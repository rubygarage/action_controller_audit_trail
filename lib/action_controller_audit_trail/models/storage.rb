module ActionControllerAuditTrail
  class Storage < ActiveRecord::Base
    set_table_name 'action_controller_audit_trail'
    #  Storage contains such fields:
    #   - trackable_class
    #   - trackable_id
    #   - has_errors
    #   - controller_type
    #   - controller_action
    #   - actor_id
  end
end
