class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, null: false, default: ''
    add_column :users, :tel, :string, null: false, default: ''
  end
end
