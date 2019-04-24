class User < ApplicationRecord
    belongs_to :employee
    has_secure_password
    validates_presence_of :password_digest, on: :create
    validates_uniqueness_of :email, :employee_id
    validate :is_active_in_system, on: :create
    validate :is_active_in_system, on: :update
    validates_format_of :email,:with => /\A[a-zA-Z0-9]+([\w\.\'\!\#\$\%\&\*\+\-\/\=\?\^\`\{\|\}\~])*([a-zA-Z0-9])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}\z/

    
    def is_active_employee
        all_active_employees = Employee.active.map(&:id)
        unless all_active_employees.include?(self.employee_id)
            errors.add(:employee_id, "Users
            can only be assigned to active
            employees")
        end
    end
    
  def user_role 
    self.employee.role
  end
end
