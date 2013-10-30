class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.date :date_of_birth
      t.string :email
      t.string :password
      t.string :website

      t.timestamps
    end
  end
end
