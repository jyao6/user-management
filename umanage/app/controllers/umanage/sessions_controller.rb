class Umanage::SessionsController < ApplicationController
  include Umanage::SessionsHelper

  def new
    if signed_in?
      redirect_to main_app.root_url
    end
  end  
  
  def create
    user = find_user(params)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to main_app.root_url
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end

  private
    # searches through all subclasses of Umanage::User to find the matching login credentials
    def find_user(params)
      Rails.application.eager_load!
      user = nil
      ActiveRecord::Base.descendants.select {|model| model < Umanage::User}.each do |umodel|
        user ||= umodel.find_by(email: params[:session][:email].downcase)
      end
      return user
    end
end
