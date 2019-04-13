class DemosController < ApplicationController
    
        layout 'login.html.erb'
    def new 
    end 
    
    def create 
        user = Employee.find_by(email: params[:demo][:email])
        if user && user.authenticate(params[:demo][:password])
           login(user)
            if params[:demo][:role] == 'employee'
                redirect_to employee_hub_index_path
            end
            if params[:demo][:role] == 'manager'
                redirect_to manager_hub_index_path
            end
            if params[:demo][:role] == 'admin'
                redirect_to admin_hub_index_path
            end
            #redirect_to user
        else
           flash.now[:danger] = "Invalid email or password or role"
           render 'new'
        end
    end
    
    def destroy 
        logout
        redirect_to root_url
    end
end
