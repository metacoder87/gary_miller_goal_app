class User < ApplicationRecord

    validates :session_token, presence: true
    validates :username, uniqueness: true, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :password_digest, presence: { message: 'Password can\'t be blank.' }

    attr_reader :password

    before_validation :ensure_session_token

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user
        user.is_password?(password) ? user : nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(32)
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token

        while User.exists?(session_token: self.session_token)
            self.session_token = self.class.generate_session_token
        end
        self.save!

        self.session_token
    end

    def decrement_cheer_count!
        self.cheer_count = self.cheer_count - 1
        self.save!
    end

    def is_password?(maybe_password)
        BCrypt::Password.new(self.password_digest).is_password?(maybe_password)
    end

    def password=(new_password)
        @password = new_password
        self.password_digest = BCrypt::Password.create(new_password)
    end

    private

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end
end
