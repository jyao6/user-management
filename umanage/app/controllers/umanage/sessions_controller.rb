module Umanage
  class SessionsController < Umanage::ApplicationController
    def new
      if signed_in?
        redirect_to root_url
      end
    end  
    
    def create
      user = find_user(params)
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

    private
      def find_user(params)
        Rails.application.eager_load!
        user = nil
        ActiveRecord::Base.descendants.select {|model| model < Umanage::User}.each do |umodel|
          if user.nil?
            user = umodel.find_by(email: params[:session][:email].downcase)
        end
        return user
      end
  end
end
