class CreateDeputies < ActiveRecord::Migration[6.0]
  def change
    create_table :deputies do |t|
      t.string :name
      t.integer :deputy_id
      t.string :party

      t.timestamps
    end
  end
end
