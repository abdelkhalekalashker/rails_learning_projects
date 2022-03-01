class Album < ApplicationRecord

    validates :name , :year , :band ,presence: true
    validates :year , numericality:{minimum:1900 , maximum:2030}
    validates :name , uniqueness: { scope: :band_id}
    validates :live , inclusion: { in: [true , false]}
    
    belongs_to :band

    has_many :tracks,
    dependent: :destroy

    after_initialize :set_defaults

    def set_defaults
        self.live ||= false 
    end
end
