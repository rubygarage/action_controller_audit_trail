require 'rails/generators/base'
require 'rails/generators'
require 'rails/generators/active_record'

puts 'something'
module ActionControllerAuditTrail
  module Generators
    class SetupGenerator < Rails::Generators::NamedBase
      include ::Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)

      desc 'Generates (but does not run) a migration to add a audit trail table.'

      def create_migration_file
        add_audit_trail_migration('create_audit_trail_storage')
      end

      def self.next_migration_number(dirname)
        ::ActiveRecord::Generators::Base.next_migration_number(dirname)
      end

      protected

      def add_audit_trail_migration(template)
        migration_dir = File.expand_path('db/migrate')
        if self.class.migration_exists?(migration_dir, template)
          ::Kernel.warn "Migration already exists: #{template}"
        else
          migration_template "#{template}.rb", "db/migrate/#{template}.rb"
        end
      end
    end
  end
end
