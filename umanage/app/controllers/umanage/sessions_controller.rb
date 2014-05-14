module Umanage
  class SessionsController < Umanage::ApplicationController
    def new
      if signed_in?
        redirect_to root_url
      end
    end  
    
    def create
      user = Umanage::User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        sign_in user
        redirect_to user
      else
        flash.now[:error] = 'Invalid email/password combination'
        render 'new'
      end
    end

    def destroy
      sign_out
      redirect_to root_url
    end
  end
end
