class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: {message: "Роботам здесь не место!"}
  validates :name, length: {minimum: 2 }, unless: lambda{self.name.blank?}
end
