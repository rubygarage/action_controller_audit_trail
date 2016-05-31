module ActionControllerAuditTrail
  class Tracker
    def track(trackable_class, trackable_id, has_errors, controller, action, actor_id, created_at)
      attrs = audit_trail_attrs(
        trackable_class: trackable_class,
        trackable_id: trackable_id,
        controller: controller,
        action: action,
        actor_id: actor_id,
        has_errors: has_errors,
        created_at: created_at
      )
      ActionControllerAuditTrail::Storage.create(attrs)
    end
  end
end
