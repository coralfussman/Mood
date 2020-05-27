class User < ApplicationRecord
    has_many :boards, dependent: :destroy

    has_secure_password
end
