require "active_record"
require "action_controller"
require "active_support"

def permission_handler(var_name, *args)
  if (self < ActiveRecord::Base)
    method_name = "#{var_name}_permissions".to_sym
    args.each do |model|
      model = model.to_s.capitalize
      controller_klass = ActiveSupport::Inflector.constantize("#{model}Controller")
      if !controller_klass.method_defined?(method_name)
        controller_klass.instance_eval do
          self.class.send("attr_accessor", var_name)

          # class << self
          #   # TODO var_name not accessible BECAUSE scoping
          #   attr_accessor :viewable
          # end
        end

        controller_klass.class_eval do
          # def view_permissions
          #   # TODO implement current_user function
          #   # self.class.viewables.include?(current_user.class)
          #   false
          # end
          define_method(method_name) do
            false
          end

          before_action only: [:new, :show, :create, :edit, :update, :destroy] do
            send(method_name)
          end
        end   
      end
      controller_klass.send("#{var_name}=", controller_klass.send(var_name) || [])
      controller_klass.send(var_name) << self
    end
  end
end

# require "active_record"
# require "action_controller"

# # TODO: need to make it so that MyUser shows up in a table...
# class MyUser < ActiveRecord::Base
# 	def initialize
# 		super

# 	end

# 	def hello
# 		"oh hai i hate work"
# 	end
# end

# class CreateMyUsers < ActiveRecord::Migration
#   def change
#     create_table :my_users do |t|
#       t.string :name
#       t.string :email

#       t.timestamps
#     end
#   end
# end


# # maybe add something to ActionController::Base class
# # so that it does the before_action filter (for a user) automatically
# # i.e. redirects for certain actions (i.e. :show, :edit)
# ActionController::Base.class_eval do
#   def to_squawk
#     "squawk!"
#   end

#   def initialize
#   	p to_squawk
#   	p self.class
#   	super
#   end

# end
