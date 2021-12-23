class User <ApplicationRecord

    validates :email, uniqueness: true

    has_many( :shortened,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'ShortenedUrl')

    has_many :visits,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Visit'

    

end