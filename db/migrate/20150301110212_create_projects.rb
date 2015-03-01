class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    create_table :projects_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
    end
  end
end
