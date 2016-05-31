module ActionControllerAuditTrail
  class ReportConstructor
    def initialize(actor_method, actor_id_method, trackable_errors_method, trackable_id_method)
      @actor_method = actor_method
      @actor_id_method = actor_id_method
      @trackable_errors_method = trackable_errors_method
      @trackable_id_method = trackable_id_method
    end

    def create(controller)
      @controller = controller

      return unless controller.publishable.present?

      if @controller.defined?(@actor_method)
        actor_id = @controller.send(@actor_method).try(@actor_id_method)
      end

      trackable_class = controller.publishable.class.to_s
      trackable_id = controller.trackable.send(@trackable_id_method)
      trackable_errors = controller.trackable.send(@trackable_errors_method)

      ActionControllerAuditTrail::Jobs::TrackJob.perform_later(
        trackable_class, trackable_id, trackable_errors,
        controller.controller_name, controller.action_name,
        actor_id, Time.zone.now
      )
    end
  end
end
