class SuperUser < Umanage::User
	permission_handler :viewables, [:show, :index], "http://www.facebook.com", "super_users", "admins"
	permission_handler :editables, [:show, :index, :new, :create, :update, :edit], "http://www.facebook.com", "posts", "pets", "users", "items"
end
