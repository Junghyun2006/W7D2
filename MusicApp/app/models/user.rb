class User < ApplicationRecord
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6}, allow_nil: true

    attr_reader :password

    after_initialize :ensure_session_token

    # finding the user instance based on input parameters
    def self.find_by_credentials(user_email, user_password)
        user = User.find_by(email: user_email)

        return nil unless user && user.is_password?(user_password)
        user
    end

    # creating a BCrypt::Password instance and assigning it to user.password_digest
    def password=(password)
        @password = password
        # BCrypt::Password.create hashes a secret, returning a BCrypt::Password instance aka ******
        self.password_digest = BCrypt::Password.create(password)
    end

    # encrypting password to password_digest
    def is_password?(password)
        bcrypt_pass = BCrypt::Password.new(self.password_digest)
        # different from User#is_password?, BCryptObject#is_password?
        bcrypt_pass.is_password?(password)
    end

    # reassigning session token for the purpose of the user logging in and logging out
    def reset_session_token!
        self.update(session_token: self.class.generate_session_token)
        # or
        # self.session_token = SecureRandom.urlsafe_base64

        self.save!
        self.session_token
    end

    private
    # generates a random base64 session token 
    def self.generate_session_token
        SecureRandom.urlsafe_base64
    end

    # check if the user has a session token, if not assign one
    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end
end
