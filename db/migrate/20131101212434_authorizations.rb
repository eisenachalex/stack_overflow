class Authorizations < ActiveRecord::Migration
	def change
		create_table :authorizations do |t|
			t.string :privider
			t.string :uid
			t.string :oauth_token
      t.string :oauth_secret
			t.integer :user_id

			t.timestamps
		end
	end
  def up
  end

  def down
  end
end
