class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.references :tlk, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :bio
      t.string :image

      t.timestamps
    end
  end
end
