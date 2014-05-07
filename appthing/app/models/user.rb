class User < ActiveRecord::Base
	permission_handler :viewable, [:create, :new, :edit, :update, :show, :destroy], "http://www.facebook.com", "users"
end
