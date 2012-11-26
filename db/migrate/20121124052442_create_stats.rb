class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :kind
      t.string :value
      t.references :season
      t.references :player

      t.timestamps
    end
  end
end
