class User < ActiveRecord::Base
	permission_handler :viewable, [:index, :show], "http://www.facebook.com", "users" 
	permission_handler :creatable, [:new, :create, :index, :show], "selfies", "posts"
end
