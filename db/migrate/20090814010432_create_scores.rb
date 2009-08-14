class CreateScores < ActiveRecord::Migration
  def self.up
    create_table :scores do |t|
      t.references :user
      t.integer :points
      t.string :source

      t.timestamps
    end
    
  
  end

  def self.down

    drop_table :scores
  end
end