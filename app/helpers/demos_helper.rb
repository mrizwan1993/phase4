module DemosHelper
    def login(user)
        session[:user_id] = user.id
        session[:role] = params[:demo][:role]
    end
    
    def current_user
        if @current_user.nil?
            if session[:role] == 'admin'
                @current_user = Employee.find_by(id: session[:user_id])
            else
                @current_user = Employee.find_by(id: session[:user_id])
            end
            if session[:role] == 'manager'
                @current_user = Employee.find_by(id: session[:user_id])
            else 
                @current_user = Employee.find_by(id: session[:user_id])
            end
        else
            @current_user
        end
    end
    
    def logged_in?
        !current_user.nil?
    end
    
    def logout
        session.delete(:user_id)
        session.delete(:role)
        @current_user = nil
    end
end
