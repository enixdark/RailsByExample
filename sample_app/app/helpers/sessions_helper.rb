module SessionsHelper

    # Save user information through session when user login page
    def log_in(user)
        session[:user_id] = user.id
    end

    # Delete user information through session when user logout page

    def log_out
        self.forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end


    # return user information if it exitst for using it in views/template

    def current_user
        if(user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end


    def logged_in?
        !current_user.nil?
    end

    #Save session_id and token into Cookies
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    #Remove session_id and token stored by Cookies
    def forget(user)
        user.forget
        cookies.delete(:remember_token)
        cookies.delete(:user_id)
    end

end
