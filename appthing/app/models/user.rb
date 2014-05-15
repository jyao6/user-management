class User < Umanage::User
	permission_handler :viewables, [:show, :index], "http://www.facebook.com", "items", "users", "super_users", "admins"
	permission_handler :editables, [:show, :index, :new, :create, :update, :edit], "http://www.facebook.com", "posts", "pets"
end
