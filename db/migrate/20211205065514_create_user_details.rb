class CreateUserDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :user_details do |t|
      t.text :future
      t.integer   :user_id
      t.timestamps
    end
    add_foreign_key :user_details, :users
  end
end
