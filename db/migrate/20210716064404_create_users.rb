class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ""
      t.integer :gender, null: false, default: 0
      t.date :birth, null: true
      t.date :joined_date, null: true
      t.text :note, null: false, default: ""

      t.timestamps
      t.integer :lock_version
    end
  end
end
