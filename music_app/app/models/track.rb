class Track < ApplicationRecord
    validates :lyrics , :title , :ord , presence: true
    validates :bonus , inclusion: {in: [false , true]}
    validates :ord , uniqueness: { scope: :album_id}

    belongs_to :album

    has_one :band,
        through: :album,
        source: :band

    after_initialize :set_defaults

    def set_defaults
        self.bonus ||= false
    end
end
