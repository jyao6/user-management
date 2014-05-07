class SuperUser < ActiveRecord::Base
	# permission_handler :editable, [:index, :show, :new, :create, :update, :edit], "http://www.facebook.com", "users"
	# permission_handler :viewable, [:index, :show], "http://www.google.com", "super_users"
end
