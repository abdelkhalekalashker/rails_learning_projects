class CreateQuestiones < ActiveRecord::Migration[6.1]
  def change
    create_table :questiones do |t|
      t.string :text , null:false
      t.integer :poll_id , null:false
      t.timestamps
    end
    add_index :questiones , :poll_id
  end
end