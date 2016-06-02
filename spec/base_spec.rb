require 'rails_helper'

class FakeController < ActionController::Base; end

describe FakeController, type: :controller do
  controller do
    trackable :current_user

    def create
      render nothing: true
    end
  end

  it 'creates a record' do
    constructor = double('constructor')
    allow(ActionControllerAuditTrail::ReportConstructor).to receive(:new).and_return(constructor)
    allow(constructor).to receive(:create)

    post :create

    expect(constructor).to have_received(:create)
  end
end
