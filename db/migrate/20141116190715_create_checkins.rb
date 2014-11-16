class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.references :movie, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
