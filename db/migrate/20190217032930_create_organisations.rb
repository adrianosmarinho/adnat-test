class CreateOrganisations < ActiveRecord::Migration[5.2]
  def change
    create_table :organisations do |t|
      t.string :name
      t.integer :hourly_rate

      t.timestamps
    end
  end
end
