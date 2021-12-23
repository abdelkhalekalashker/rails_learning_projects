class CreateResponss < ActiveRecord::Migration[6.1]
  def change
    create_table :responss do |t|
      t.integer :respondant_id ,null:false
      t.integer :answer_choice_id
      t.timestamps
    end
    add_index :responss ,:respondant_id
    add_index :responss ,:answer_choice_id
  end
end
