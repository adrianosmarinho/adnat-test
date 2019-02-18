class OrganisationsController < ApplicationController
  def new
    #this variable will be used by the view template
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)    
    if @organisation.save
      # Handle a successful save.
      # updates current_user organisation 
      
      #error in the update
      current_user.update(organisation_id: @organisation.id)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to current_user #the same as redirect_to user_url(current_user)
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
    def organisation_params
      # the organisation params require a organisation hash and allows only the name and hourly rate
      # we probably need to pass the current_user params too so we can update the current_user.organisation_id
      # this is called strong parameters
      # rails does not allow to pass the full params hash
      params.require(:organisation).permit(:name, :hourly_rate)
    end
end
