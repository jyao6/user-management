module Umanage
  module SessionsHelper
    
    def sign_in(user)
      remember_token = Umanage::User.new_remember_token
      cookies.permanent[:remember_token] = remember_token
      user.update_attribute(:remember_token, Umanage::User.digest(remember_token))
      self.current_user = user
    end

    def signed_in?
      !current_user.nil?
    end
    
    def current_user=(user)
      @current_user = user
    end

    def current_user
      remember_token = Umanage::User.digest(cookies[:remember_token])
      @current_user ||= find_user_match(remember_token)
    end

    def current_user?(user)
      user == current_user
    end

    def sign_out
      current_user.update_attribute(:remember_token,
                                    Umanage::User.digest(Umanage::User.new_remember_token))
      cookies.delete(:remember_token)
      self.current_user = nil
    end

    # looks through all subclasses of Umanage::User to find user with matching token
    def find_user_match(remember_token)
      Rails.application.eager_load!
      user = nil
      ActiveRecord::Base.descendants.select {|model| model < Umanage::User}.each do |umodel|
        user ||= umodel.find_by(remember_token: remember_token)
      end
      return user
    end

  end
end
