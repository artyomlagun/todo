class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :lname
      t.string :fname
      t.string :position
      t.string :username
      t.string :email

      t.timestamps null: false
    end
  end
end
