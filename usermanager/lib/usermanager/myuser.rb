require "active_record"
require "action_controller"
require "active_support"

module Usermanager

	class MyUser < ActiveRecord::Base

		def can_view(*args)
			args.each do |model|
				model = model.to_s.capitalize
				controller_klass = ActiveSupport::Inflector.constantize("#{model}Controller")
				if controller_klass.method_defined?(:view_permissions)
					controller_klass.viewables ||= []
					controller_klass.viewables << self.class
				else
					controller_klass.instance_eval do
						class << self
							attr_accessor :viewables
						end
					end

					controller_klass.class_eval do
						def view_permissions
							# TODO implement current_user function
							self.class.viewables.include?(current_user.class)
						end

						before_action only: [:show] do
							view_permissions
						end
					end		
				end

			end
		end

		def can_edit(*args)
			args.each do |model|
				model = model.to_s.capitalize
				controller_klass = ActiveSupport::Inflector.constantize("#{model}Controller")
				if controller_klass.method_defined?(:edit_permissions)
					controller_klass.editables ||= []
					controller_klass.editables << self.class
				else
					controller_klass.instance_eval do
						class << self
							attr_accessor :editables
						end
					end

					controller_klass.class_eval do
						def edit_permissions
							# TODO implement current_user function
							self.class.editables.include?(current_user.class)
						end

						before_action only: [:new, :create, :edit, :update, :destroy] do
							edit_permissions
						end
					end		
				end

			end
		end

	end
end
