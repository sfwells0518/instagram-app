class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :profile_picture
      t.text :bio

      t.timestamps
    end
  end
end
