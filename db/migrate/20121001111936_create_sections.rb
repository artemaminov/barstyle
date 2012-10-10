class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :permalink
      t.integer :position

      t.timestamps
    end
  end
end