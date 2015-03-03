class Task < ActiveRecord::Base
  acts_as_taggable

  validates :title, presence:{message:'Укажите заголовок'}
  validates :title, length:{minimum:3}, unless: lambda{self.title.blank?}

  belongs_to :user
  belongs_to :project, dependent: :destroy
  # accepts_nested_attributes_for :project

  attr_accessor :message

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
  end
end
