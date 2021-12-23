class ShortenedUrl<ApplicationRecord

    validates :short_url,:user_id,:long_url,presence:true
    validates :short_url , uniqueness:true

    has_many :visits,
    primary_key: :id,
    foreign_key: :shorted_url_id,
    class_name: 'visit'

    has_many :visitors,
    -> { distinct },
    through: :visits,
    source: 'User'

    def self.creat_user_long_url(user,long_url)
        ShortenedUrl.create!(
            user_id: user.id,
            long_url: long_url,
            short_url: ShortenedUrl.randum_code
        )
    end

    def self.randum_code
        loop do
            randum_code= SecureRandom.urlsafe_base64(8)
            return randum_code unless ShortenedUrl.exists?(short_url:randum_code)
        end
    end

    def num_clicks
        visits.count
    end

    def num_uniques
        visits.select("user_id").distinct.count
    end

    def num_recent_uniques
        visits
            .select("user_id")
            .where  ('created_at < ?'),10.minuts.ago
            .distinct
            .count
    end


end