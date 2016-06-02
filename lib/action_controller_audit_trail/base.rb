module ActionControllerAuditTrail
  module Base
    def trackable(trackable_key, options = {})
      after_action(:publish_audit_trail, options.slice(:if, :unless, :only, :except))

      define_method :publish_audit_trail do
        ActionControllerAuditTrail::ReportConstructor.new(
          options[:actor_method] || :current_user,
          options[:actor_id_method] || :id,
          options[:trackable_errors_method] || :errors,
          options[:trackable_id_method] || :id
        ).create(self)
      end

      define_method :trackable do
        @trackable ||= instance_variable_get(:"@#{trackable_key}").presence
      end
    end
  end
end
