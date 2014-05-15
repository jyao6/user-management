class Admin < Umanage::User
	permission_handler :editables, [:show, :index, :new, :create, :update, :edit], "http://www.facebook.com", "posts", "pets", "users", "items", "super_users", "admins"
end
