class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
			t.string :featured_image
			t.text :announce
      t.text :text
      t.string :permalink
      t.boolean :main
      t.integer :section_id
			t.boolean :is_subsection
			t.string :static_attached

      t.timestamps
    end
  end
end
