class AddInfoUserToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
		add_column :users, :line_1, :string
		add_column :users, :line_2, :string
		add_column :users, :line_3, :string
		add_column :users, :telephone, :string
		add_column :users, :mobile, :string
		add_column :users, :role, :string
  end
end
