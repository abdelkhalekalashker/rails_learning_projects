class AddFieldsToResponses < ActiveRecord::Migration[6.1]
  def change
    add_column :responses, :author_id, :integer
    add_column :responses, :question_id, :integer
    add_column :responses, :back , :string
  end
end
