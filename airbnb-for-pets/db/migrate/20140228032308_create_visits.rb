class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :pet_id
      t.integer :visitor_id
      t.string :status, :null => false, :default => 'pending'
    end
  end
end
