class UsersController < ApplicationController
  
  # executes code and renders the /users/id page
  def show
    @user = User.find(params[:id])
  end
  
  # executes code and renders the sign up page
  def new
    @user = User.new #empty user that will be updated by the form_for in the view
  end

  # handle the creation of the users after submission of the form in the sign up page
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      # Handle a successful save.
      
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user #the same as redirect_to user_url(@user)
      # note: here i can redirect to home_page and change the home page according to the user
      # something like: if @user then display the organisations. It might be easier to keep
      # a list of organisations at the home page so we can update the user organisation
    else
      render 'new'
    end
  end

  #remember the order of the restful routes/actions
  #index
  #show
  #edit
  #new
  #create
  #update
  #destroy

  private
    def user_params
      # the user params require a user hash and allows only the name, email, password and password confirmation attributes
      # this is called strong parameters
      # rails does not allow to pass the full params hash
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
