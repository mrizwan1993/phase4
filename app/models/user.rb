class User < ApplicationRecord
    belongs_to :employee
    has_secure_password
    validates_presence_of :password_digest, on: :create
    validates_uniqueness_of :email, :employee_id
    validate :is_active_employee, on: :create
    validate :is_active_employee, on: :update
    validates_format_of :email, with: /@/, message: "is not a valid format"

    
    def is_active_employee
        all_active_employees = Employee.active.map(&:id)
        unless all_active_employees.include?(self.employee_id)
      errors.add(:employee_id, "cannot be created. cannot create a user for an inactive employee. Please make this employee active")
        end
    end
    
  def user_role 
    self.employee.role
  end
end
