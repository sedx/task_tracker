class User < ActiveRecord::Base
  validates :name, presence: {message: "Роботам здесь не место!"}
  validates :name, length: {minimum: 2 }, unless: lambda{self.name.blank?}
end
