class Task < ActiveRecord::Base
  acts_as_taggable

  validates :title, presence:{message:"^Укажите заголовок"}
  validates :title, length:{minimum:3}, unless: lambda{self.title.blank?}
end
