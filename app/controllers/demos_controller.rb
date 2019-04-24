class DemosController < ApplicationController
    
    layout 'login.html.erb'
    def new
    end
    
    def create
       user = User.find_by(email: params[:loginpage][:email].downcase) 
       
       if user && user.authenticate(params[:loginpage][:password])
           login(user)
           employee_user = Employee.find(user.user_employee_id)
            if employee_user.role == 'admin'
                redirect_to admin_hub_index_path 
                return
            
            elsif employee_user.role == 'manager'
                redirect_to manager_hub_index_path 
                return
            
            else
                redirect_to employee_hub_index_path 
                return
            end
            
       else
           flash.now[:danger] = "Invalid email or password"
           render 'new'
       end
    end
    
    def destroy
        logout
        redirect_to root_url
    end
end
