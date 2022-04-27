class Post < ApplicationRecord
    has_many :applications , dependent: :destroy
    belongs_to :user    
end
