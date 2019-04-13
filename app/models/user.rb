class User < ApplicationRecord
    belongs_to :employee
    has_secure_password
    validates_uniquess_of :email
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
