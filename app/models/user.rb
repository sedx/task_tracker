class User < ActiveRecord::Base
  validates :name,
            presence: {message: "Роботам здесь не место!"},
            length: {minimum: 2 }
end
