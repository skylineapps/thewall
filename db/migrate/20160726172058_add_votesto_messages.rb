class AddVotestoMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :vote, :integer, default: 0, null: false
  	add_column :comments, :vote, :integer, default: 0, null: false
  end
end
