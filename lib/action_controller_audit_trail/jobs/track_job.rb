require 'sucker_punch'

module ActionControllerAuditTrail
  module Jobs
    class TrackJob
      include SuckerPunch::Job

      def perform(*args)
        ActionControllerAuditTrail::Tracker.new(*args).track
      end
    end
  end
end
