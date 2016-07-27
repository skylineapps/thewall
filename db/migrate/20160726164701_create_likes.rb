class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :message, index: true, foreign_key: true
      t.string :comment
      t.string :references

      t.timestamps null: false
    end
  end
end
