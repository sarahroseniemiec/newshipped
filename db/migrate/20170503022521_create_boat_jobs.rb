class CreateBoatJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :boat_jobs do |t|
      t.integer :boat_id
      t.integer :job_id

      t.timestamps
    end
  end
end
