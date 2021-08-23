class RegistrationController < ApplicationController
  
  def entry
  end

  def confirm
    render action: "entry"
  end  
  
end