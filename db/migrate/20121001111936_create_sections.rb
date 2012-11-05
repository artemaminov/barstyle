class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name, null: false
      t.string :permalink
      t.integer :position
			t.boolean :show_in_menu, null: false
			t.boolean :is_news_section, null: false

      t.timestamps
    end
  end
end
