class AddStateToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :state, :integer, default: 0
    add_index :tasks, :state
  end
end
