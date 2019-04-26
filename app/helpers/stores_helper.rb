module StoresHelper
    def store_for_select_for_manager(user_id)
        user = User.find(user_id)
        manager = Employee.find(user.employee.id)
        manager_assignments = Assignment.for_employee(manager)
        manager_stores = Array.new
        manager_assignments.each do |assignment|
            manager_stores << Store.find(assignment.store_id)
        end
        manager_stores.collect { |s| [s.name, s.id] }
    end
end
