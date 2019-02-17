class ShiftsController < ApplicationController
  
  # retrieve all shifts of an user
  def index
  end
  
  def new
  end

  #thanks to SessionsHelper in ApplicationController we can access the current user here
  def create
    #@article = Article.find(params[:article_id])
    #@comment = @article.comments.create(comment_params)
    @shift = current_user.shifts.create(shift_params)
    redirect_to user_shifts_path(current_user)

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
  def shift_params
    # the shift params require a user hash and allows only the name, email, password and password confirmation attributes
    # this is called strong parameters
    # rails does not allow to pass the full params hash
    params.require(:shift).permit(:start, :finish, :break_length)
  end

end
