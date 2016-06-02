require 'rails_helper'

describe ActionControllerAuditTrail::Tracker do
  it 'creates audit trail record' do
    trackable_class = double('trackable_class')
    trackable_id = spy('trackable_id')
    controller = double('controller')
    action = double('action')
    actor_id = double('actor_id')
    has_errors = double('has_errors')
    created_at = double('created_at')
    tracker = ActionControllerAuditTrail::Tracker.new
    allow(ActionControllerAuditTrail::Storage).to receive(:create)

    tracker.track(
      trackable_class, trackable_id, has_errors, controller,
      action, actor_id, created_at
    )

    expect(ActionControllerAuditTrail::Storage).to have_received(:create).with(
      trackable_class: trackable_class,
      trackable_id: trackable_id,
      controller: controller,
      action: action,
      actor_id: actor_id,
      has_errors: has_errors,
      created_at: created_at
    )
  end
end
