class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false
			t.string :featured_image
			t.text :announce
      t.text :text, null: false
      t.string :permalink, null: false
      t.boolean :at_main, null: false
      t.integer :section_id, null: false
			t.boolean :is_subsection, null: false
			t.string :static_attached

      t.timestamps
    end
  end
end
