class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user
      t.references :movie
      t.boolean   :is_like
      t.timestamps
    end
  end
end
