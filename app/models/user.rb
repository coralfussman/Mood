class User < ApplicationRecord
    has_many :boards, dependent: :destroy
    has_secure_password

    validates :username, uniqueness: {message: "must be unique"}
    validates :password, length: { minimum: 5 }
end
