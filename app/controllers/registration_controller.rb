class RegistrationController < ApplicationController
  
  def entry
  end

  def confirm
    render action: "entry"
  end  
  
  def user_params
    params.require(:user).permit(:name, :email, :tel, :sex)
  end  

end