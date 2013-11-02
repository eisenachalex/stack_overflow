class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.date :date_of_birth
      t.string :email
      t.string :password_digest
      t.string :website
      t.string :current_city
      t.string :name
      t.text :interests

      t.timestamps
    end
  end
end
