class CreateUpdateEvents < ActiveRecord::Migration
  def change
    create_table :update_events do |t|
      t.string :content
      t.time :stamp

      t.timestamps
    end
  end
end
