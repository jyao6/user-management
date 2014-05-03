class User < ActiveRecord::Base
	permission_handler :viewable, "users"
end
