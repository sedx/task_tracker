class TaskHistory < ActiveRecord::Base
  belongs_to :task, dependent: :destroy
  belongs_to :user, inverse_of: :task_histories
end
