class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :content
      t.integer :status
      t.integer :user_id_to_notified
      t.integer :notified_by

      t.timestamps
    end
  end
end
