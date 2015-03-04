class CreateTaskHistories < ActiveRecord::Migration
  def change
    create_table :task_histories do |t|
      t.string :type_of_event
      t.text :change
      t.datetime :date
    end
    add_reference :task_histories, :user
    add_reference :task_histories, :task
  end
end
