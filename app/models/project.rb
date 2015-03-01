class Project < ActiveRecord::Base
  validates :name, presence: {message:"^Укажите название проекта"}

  has_and_belongs_to_many :users
end
