require "active_record"
require "action_controller"
require "active_support"

# FOUR VERSIONS: VISITOR, VIEWER, EDITOR, ADMIN
# module Umanage
    def permission_handler(var_name, method_array, redirect_link, *args)
      if (self < ActiveRecord::Base)
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
                # if !(self.class.send(var_name).include?(current_user.class))
                #   redirect_to redirect_link
                # end

                if thingy
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

# end
