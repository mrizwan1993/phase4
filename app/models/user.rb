class User < ApplicationRecord
    belongs_to :employee
    has_secure_password
    validates_uniqueness_of :email
    validates_format_of :email,:with => /\A[a-zA-Z0-9]+([\w\.\'\!\#\$\%\&\*\+\-\/\=\?\^\`\{\|\}\~])*([a-zA-Z0-9])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}\z/
end
