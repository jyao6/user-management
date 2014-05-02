require "active_record"
require "action_controller"

# TODO: need to make it so that MyUser shows up in a table...
class MyUser < ActiveRecord::Base
	def initialize
		super

	end

	def hello
		"oh hai i hate work"
	end
end

class Admin < MyUser
end

class Editor < MyUser
end

class CreateMyUsers < ActiveRecord::Migration
  def change
    create_table :my_users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end


# maybe add something to ActionController::Base class
# so that it does the before_action filter (for a user) automatically
# i.e. redirects for certain actions (i.e. :show, :edit)
ActionController::Base.class_eval do
  def to_squawk
    "squawk!"
  end

  def initialize
  	p to_squawk
  	p self.class
  	super
  end

end
