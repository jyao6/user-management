require "active_record"
require "action_controller"
require "active_support"

def permission_handler(var_name, method_array, redirect_link, *args)
  if (self < Umanage::User)
    method_name = "#{var_name}_#{self.name.downcase}_permissions".to_sym
    args.each do |model|
      model = model.to_s.camelize
      controller_klass = ActiveSupport::Inflector.constantize("#{model}Controller")
      
      # sets up the attr_accessor and the filter if it hasn't been defined yet
      if !controller_klass.method_defined?(method_name)
        controller_klass.instance_eval do
          self.class.send("attr_accessor", var_name)
        end

        controller_klass.class_eval do
          include Umanage::SessionsHelper
          define_method(method_name) do
            p current_user.class
            p self.class.send(var_name)
            # if action in the list, need to redirect
            if !signed_in? or (self.class.send(var_name).include?(current_user.class))
              redirect_to redirect_link
            end
          end

          # the list of actions that need to be authenticated (otherwise redirect)
          before_action except: method_array do
            send(method_name)
          end
        end   
      end
      # add self to the controller's allowed list of model-callers
      controller_klass.send("#{var_name}=", controller_klass.send(var_name) || [])
      controller_klass.send(var_name) << self
    end
  end
end
