class CreateScaffoldSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :scaffold_samples do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
