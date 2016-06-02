require 'sucker_punch'
require 'active_record'
require 'rails/railtie'
require 'action_controller_audit_trail/version'
require 'action_controller_audit_trail/base'
require 'action_controller_audit_trail/report_constructor'
require 'action_controller_audit_trail/tracker'
require 'action_controller_audit_trail/jobs/track_job'
require 'action_controller_audit_trail/models/storage'

module ActionControllerAuditTrail
  class Railtie < ::Rails::Railtie
  end
end

ActionController::Base.send(:extend, ActionControllerAuditTrail::Base) if defined?(ActionController)
