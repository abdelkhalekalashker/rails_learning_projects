class CreateShortenedUrl < ActiveRecord::Migration[6.1]
  def change
    create_table :shortened_urls do |t|
      t.integer :user_id,null:false
      t.string :short_url
      t.string :long_url
      t.timestamps
    end
    add_index :shortened_urls, :user_id 
    add_index :shortened_urls, :short_url, uniqe:true
  end

end
