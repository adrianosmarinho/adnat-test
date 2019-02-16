module SessionsHelper
    # Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id

        #here is how the session[:user_id] works
        # This places a temporary cookie on the user’s browser containing an encrypted version of the user’s id,
        # which allows us to retrieve the id on subsequent pages using session[:user_id].
        # In contrast to the persistent cookie created by the cookies method, 
        # the temporary cookie created by the session method expires immediately when the browser is closed.
    end

    # Returns the current logged-in user (if any).
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    # Returns true if the user is logged in, false otherwise.
    # This method will allow to display different links and info in the layout based on the login
    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
