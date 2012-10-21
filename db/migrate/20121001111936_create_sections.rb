class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :permalink
      t.integer :position
			t.boolean :show_in_menu

      t.timestamps
    end
  end
end
