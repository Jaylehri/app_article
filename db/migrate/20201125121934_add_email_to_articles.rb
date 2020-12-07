class AddEmailToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :email, :string
  end
end
