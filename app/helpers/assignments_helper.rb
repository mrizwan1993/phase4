module AssignmentsHelper
    def assignment_for_select_for_admin
        Assignment.chronological.collect { |a| [a.employee.first_name + " " + a.employee.last_name + ", " + a.store.name, a.id] }
    end
    
    def assignment_for_select_for_manager(user_id)
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
        assignments_employees_stores = Array.new
        employees_regulars.each do |employee|
            manager_stores.each do |store|
                assignments_employees_stores << Assignment.for_store(store).for_employee(employee)
            end
        end
        
        #now put them in a proper array
        all_assignments = Array.new
        assignments_employees_stores.each do |collection|
            collection.each do |assignment|
                all_assignments << assignment
            end
        end
        
        all_assignments.collect { |a| [a.employee.first_name + " " + a.employee.last_name + ", " + a.store.name, a.id] }
    end
end

