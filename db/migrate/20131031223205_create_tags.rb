class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :question_id
      t.string :t_content

      t.timestamps
    end
  end
end
