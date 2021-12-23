class User < ApplicationRecord

    has_many :authored_poll,
        primary_key: :id,
        foreign_key: :user_id,
        class_name:'Poll'

    has_many :response,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: 'Response'

end