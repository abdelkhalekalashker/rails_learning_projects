class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.integer :user_id , null:false
      t.integer :shorted_url_id , null:false
      t.timestamps
    end
    add_index :visits ,:user_id
    add_index :visits,:shorted_url_id
  end
end
