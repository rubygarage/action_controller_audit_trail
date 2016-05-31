require 'sucker_punch'
require 'action_controller_audit_trail/version'
require 'action_controller_audit_trail/base'
require 'action_controller_audit_trail/report_constructor'
require 'action_controller_audit_trail/tracker'
require 'action_controller_audit_trail/jobs/track_job'

module ActionControllerAuditTrail
  class Railtie < ::Rails::Railtie
  end
end
  # autoload :VERSION, 'audit_trail/version'
  # autoload :Base, 'audit_trail/base'
  # autoload :Tracker, 'audit_trail/tracker'
  # autoload :ReportConstructor, 'audit_trail/report_constructor'

  # module Jobs
  #   autoload :TrackJob, 'audit_trail/jobs/track_job'
  # end
#end

ActionController::Base.send(:extend, ActionControllerAuditTrail::Base) if defined?(ActionController)
