class RegistrationController < ApplicationController
  
  def entry
    #@user = User.new
  end

  def confirm
    @user = User.new(user_params)
    #render action: "entry"
  end  
  
  def thanks
  end
    
  def user_params
    params.require(:user).permit(:name, :email, :tel, :sex)
  end  

end