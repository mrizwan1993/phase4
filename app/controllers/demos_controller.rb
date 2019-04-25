class DemosController < ApplicationController
    layout 'login.html.erb'
    def new
    end
    
    def create
       user = User.find_by(email: params[:demo][:email]) 
       if user && user.authenticate(params[:demo][:password])
           role=user.user_role
           login(user)
            if role == 'admin'
                redirect_to admin_hub_index_path
                
            elsif role == 'manager'
                redirect_to manager_hub_index_path 
            
            else
                redirect_to employee_hub_index_path 
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
