class DemosController < ApplicationController
    
        layout 'login.html.erb'
    def new 
    end 
    
    def create 
        if params[:demo][:role] == 'student'
            user = Student.find_by(andrew_id: params[:demo][:andrew_id])
        end
        if params[:demo][:role] == 'professor'
            user = Professor.find_by(andrew_id: params[:demo][:andrew_id])
        end
        if user && user.authenticate(params[:demo][:password])
           login(user)
            if params[:demo][:role] == 'student'
                redirect_to student_hub_index_path
            end
            if params[:demo][:role] == 'professor'
                redirect_to professor_hub_index_path
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
