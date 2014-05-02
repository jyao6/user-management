require 'generators'

module Registrar
	module Generators
		class InstallGenerator < Generators::Base
			include Generators::Migration

			# source_root File.expand_path('..', __FILE__)


			# protected

			#   def copy_migration(filename)
			#     if self.class.migration_exists?("db/migrate", "#{filename}")
			#       say_status("skipped", "Migration #{filename}.rb already exists")
			#     else
			#       migration_template "migrations/#{filename}.rb", "db/migrate/#{filename}.rb"
			#     end
			#   end
		end
	end
end
