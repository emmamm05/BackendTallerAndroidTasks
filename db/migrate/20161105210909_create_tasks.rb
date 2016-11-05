class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :detail
      t.attachment :attachment
      t.references :user
      t.timestamps null: false
    end
  end
end
