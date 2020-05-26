class User < ApplicationRecord
    has_many :boards, dependent: :destroy
end
