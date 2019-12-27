class AddPendingToParticipants < ActiveRecord::Migration[6.0]
  def change
    add_column :participants, :pending, :boolean, default: true
  end
end
