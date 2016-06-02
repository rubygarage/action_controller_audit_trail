require 'rails_helper'

describe ActionControllerAuditTrail::ReportConstructor do
  context 'with trackable' do
    it 'starts a job to create a record' do
      actor_method = :current_user
      actor_id_method = :id
      trackable_errors_method = :errors
      trackable_id_method = :id
      current_user_id = 1
      errors = []
      controller_name = 'Sessions'
      action_name = 'create'
      time = stub_time_now
      trackable_class = 'User'
      trackable = stub_trackable(id: current_user_id, klass: trackable_class, errors: [])
      controller = stub_controller(
        trackable: trackable,
        name: controller_name,
        action: action_name,
        current_user_id: current_user_id
      )
      allow(ActionControllerAuditTrail::Jobs::TrackJob).to receive(:perform_async)
      constructor = ActionControllerAuditTrail::ReportConstructor.new(
        actor_method, actor_id_method, trackable_errors_method, trackable_id_method
      )

      constructor.create(controller)

      expect(ActionControllerAuditTrail::Jobs::TrackJob).to \
        have_received(:perform_async).with(
          trackable_class,
          current_user_id,
          errors,
          controller_name,
          action_name,
          current_user_id,
          time
        )
    end
  end

  context 'without trackable' do
    it 'does nothing' do
      actor_method = :current_user
      actor_id_method = :id
      trackable_errors_method = :errors
      trackable_id_method = :id
      current_user_id = 1
      controller_name = 'Sessions'
      action_name = 'create'
      controller = stub_controller(
        trackable: nil,
        name: controller_name,
        action: action_name,
        current_user_id: current_user_id
      )
      allow(ActionControllerAuditTrail::Jobs::TrackJob).to receive(:perform_async)
      constructor = ActionControllerAuditTrail::ReportConstructor.new(
        actor_method, actor_id_method, trackable_errors_method, trackable_id_method
      )

      constructor.create(controller)

      expect(ActionControllerAuditTrail::Jobs::TrackJob).not_to \
        have_received(:perform_async)
    end
  end

  def stub_controller(trackable:, name:, action:, current_user_id:)
    double('controller').tap do |controller|
      allow(controller).to receive(:trackable).and_return(trackable)
      allow(controller).to receive(:controller_name).and_return(name)
      allow(controller).to receive(:action_name).and_return(action)
      allow(controller).to receive(:current_user).and_return(double('user', id: current_user_id))
    end
  end

  def stub_trackable(id:, klass:, errors:)
    double('trackable').tap do |trackable|
      allow(trackable).to receive(:id).and_return(id)
      allow(trackable).to receive(:class).and_return(klass)
      allow(trackable).to receive(:errors).and_return(errors)
    end
  end

  def stub_time_now
    Time.zone.now.tap do |time|
      allow(Time).to receive(:zone).and_return(double(now: time))
    end
  end
end
