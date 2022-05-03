class Application < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body
  has_one :content , class_name:"ActionText::RichText" , as: :record ,dependent: :destroy

end
