class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase )
    if user && user.authenticate(params[:session][:password])
      #logs the user in and redirects to to the user show page
      log_in user
      redirect_to user #rails converts the route automatically redirect_to user_url(user)
    else
      #display error message
      #flash[:danger] = 'Invalid email/password combination' # Not quite right!
      flash.now[:danger] = 'Invalid email/password combination' # Using flash.now avoids the duplicate error
      #display the login form
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  #remember the order of the restful routes/actions
  #index
  #show
  #edit
  #new
  #create
  #update
  #destroy
end
