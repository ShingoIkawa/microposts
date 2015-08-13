class AddProfileToUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :area
      t.string :body
      t.string :email
      t.string :password_digest

      t.timestamps
      
      t.index :email, unique: true
    end
  end
end