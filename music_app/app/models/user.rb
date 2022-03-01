class User < ApplicationRecord
    validates :email, presence: true , uniqueness: true
    validates :password_digest, presence: {message: "password can\'t be blank"}
    validates :session_token, presence: true , uniqueness: true
    validates :password ,length: {minimum: 6, allow_nil: true}

    attr_reader :password

    after_initialize :ensure_session_token

    def generate_unique_session_token
        token = SecureRandom.urlsafe_base64(20)

        while self.class.exists?(session_token: token) do 
            token = SecureRandom.urlsafe_base64(20)
        end
        token
    end

    def reset_session_token
        self.session_token = self.generate_unique_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end


    def is_password!(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return nil if user.nil?

        user.is_password!(password) ? user : nil 
    end
end
