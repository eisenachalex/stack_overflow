class CreateBadges < ActiveRecord::Migration
 def change
 	create_table :badges do |t|
 		t.integer :user_id
 		t.string :file

 		t.timestamps
 	end
 end
end
