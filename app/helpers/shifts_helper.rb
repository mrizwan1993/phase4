module ShiftsHelper
    def shift_for_select_for_admin
        Shift.chronological.collect { |s| [s.assignment.employee.first_name + " " + s.assignment.employee.last_name + ", " + s.assignment.store.name, s.id] }
    end
    
    def shift_for_select_for_manager(user_id)
        user = User.find(user_id)
        manager = Employee.find(user.employee.id)
        manager_assignments = Assignment.for_employee(manager)
        manager_stores = Array.new
        manager_assignments.each do |assignment|
            manager_stores << Store.find(assignment.store_id)
        end
        assignments_store = Array.new
        manager_stores.each do |store|
             assignments_store << Assignment.for_store(store)
        end 
        employees_all = Array.new
        assignments_store.each do |assignment_relation|
            assignment_relation.each do |assignment|
                employees_all << Employee.find(assignment.employee_id)
            end
        end  
        employees_regulars = Array.new
        employees_all.each do |employee|
            if employee.role == 'employee'
                employees_regulars << employee
            end
        end
          
        #Now get all the assignments for these employees
        shifts_employees = Array.new
        employees_regulars.each do |employee|
            manager_stores.each do |store|
                shifts_employees << Shift.for_store(store).for_employee(employee)
            end
        end
        
        #now put them in a proper array
        all_shifts = Array.new
        shifts_employees.each do |collection|
            collection.each do |shift|
                all_shifts << shift
            end
        end
        
        all_shifts.collect { |s| [s.assignment.employee.first_name + " " + s.assignment.employee.last_name + ", " + s.assignment.store.name, s.id] }
    end
end
