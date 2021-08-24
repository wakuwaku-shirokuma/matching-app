class RegistrationController < ApplicationController
  
  def entry
    @title = "つながるための準備、してみよう！"
    @h1 = "つながるための準備、してみよう！"
    #@user = User.new
  end

  def confirm
    @title = "つながるための準備、できた？"
    @h1 = "つながるための準備、できた？"
    @user = User.new(user_params)
    #render action: "entry"
  end  
  
  def thanks
  end
    
  def user_params
    params.require(:user).permit(:name, :email, :tel, :sex)
  end  

end