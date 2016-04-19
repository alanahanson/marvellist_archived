class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :title
      t.string :link
      t.string :description
      t.integer :series_id

      t.timestamps null: false
    end
  end
end
