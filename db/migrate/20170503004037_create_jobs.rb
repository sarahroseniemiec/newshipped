class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :description
      t.string :origin
      t.string :destination
      t.decimal :cost
      t.integer :amtcontainers

      t.timestamps
    end
  end
end
