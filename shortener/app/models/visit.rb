class Visit < ApplicationRecord

    belongs_to :visitors,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: 'User'
   
    def self.record_visit!(user, shortened_url)
        Visit.create!(user_id:user.id , shorted_url_id:shortened_url.id)
    end
   
    
end