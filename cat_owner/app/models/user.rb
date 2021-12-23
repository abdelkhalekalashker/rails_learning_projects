class User < ApplicationRecord
    has_many :cats
    validates :email, presence: true

    validates :name , presence:true
end
