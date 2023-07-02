class User < ApplicationRecord
    has_secure_password
    has_many :recipes
    validates_presence_of :username
    validates_uniqueness_of :username, case_sensitive: true
end
