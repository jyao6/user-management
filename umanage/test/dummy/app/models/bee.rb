class Bee < Umanage::User
	permission_handler :viewable, [:index, :show], "http://www.facebook.com", "bees"
end
