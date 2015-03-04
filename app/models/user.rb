class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: {message: "^Роботам здесь не место!"}
  validates :name, length: {minimum: 2 }, unless: lambda{self.name.blank?}

  has_and_belongs_to_many :projects
  has_many :tasks
  has_many :task_histories

  def available_projects
    if self.admin?
      Project.all
    else
      self.projects
    end
  end

end
