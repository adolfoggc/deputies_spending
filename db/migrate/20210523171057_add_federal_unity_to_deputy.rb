class AddFederalUnityToDeputy < ActiveRecord::Migration[6.0]
  def change
    add_column :deputies, :federal_unity, :integer
  end
end
