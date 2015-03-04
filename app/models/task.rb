class Task < ActiveRecord::Base
  acts_as_taggable

  validates :title, presence:{message:'Укажите заголовок'}
  validates :title, length:{minimum:3}, unless: lambda{self.title.blank?}
  validates :time, format: {with:/\A\d+\z/,message:"Время указывается в минутах"}, unless: lambda{self.time.blank?}

  belongs_to :user
  belongs_to :project
  has_many :task_histories, dependent: :destroy

  attr_accessor :message, :current_user

  state_machine initial: :analyze do
    state :analyze, value: 0
    state :doing, value: 1
    state :testing, value: 2
    state :released, value: 3
    state :archived, value: 4


    event :to_do do
      transition all => :doing
    end

    event :to_test do
      transition :doing => :testing
    end

    event :to_analyze do
      transition :doing => :analyze
    end

    event :to_release do
     transition :testing => :released
    end

    event :archive do
      transition all => :archived
    end

    after_transition :write_history
  end

  def assign(user)
    self.user = user
    self.save!
    write_history
  end
  private

    def write_history
      history_hash={date:Time.now,user_id:current_user.id}
      unless self.user_id_changed?
        history_hash[:type_of_event]= :move
        history_hash[:change]=self.state_name
      else
        history_hash[:type_of_event] = :assign
        history_hash[:change]=self.user_id
      end
      self.task_histories.create(history_hash)
    end

end
