class AddUserToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :user, index: true
    add_foreign_key :comments, :users 
  end
end
