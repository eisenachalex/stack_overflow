class RemoveQuestionidFromTagTable < ActiveRecord::Migration
  def change
    change_table(:tags) do |t|
      t.remove :question_id
    end
  end
end
