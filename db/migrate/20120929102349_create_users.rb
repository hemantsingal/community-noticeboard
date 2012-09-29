class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :mobile_numer
      t.string :email
      t.string :username
      t.string :name
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
