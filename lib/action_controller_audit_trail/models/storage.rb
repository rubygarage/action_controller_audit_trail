module ActionControllerAuditTrail
  class Storage < ::ActiveRecord::Base
    self.table_name = 'action_controller_audit_trail_storage'
  end
end
