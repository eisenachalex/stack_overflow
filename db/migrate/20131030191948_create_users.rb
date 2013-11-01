class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.date :date_of_birth
      t.string :email
      t.string :password_digest
      t.string :website
      t.string :file

      t.timestamps
    end
  end
end
