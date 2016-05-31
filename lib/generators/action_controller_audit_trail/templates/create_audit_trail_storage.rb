class CreateActionControllerAuditTrailStorage < ActiveRecord::Migration
  def change
    create_table :action_controller_audit_trail_storage do |t|
      t.string   :trackable_class, null: false
      t.integer  :trackable_id
      t.string   :controller, null: false
      t.string   :action, null: false
      t.string   :actor_id
      t.datetime :created_at, null: false
    end
    add_index :action_controller_audit_trail_storage, [:trackable_class, :trackable_id]
  end
end
