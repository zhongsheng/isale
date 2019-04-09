module Isale
  class User < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 50 }
    has_secure_password

    # allow_nil
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    def authenticate?(token)
      BCrypt::Password.new(self.password_digest).is_password?(token)
    end
  end
end
