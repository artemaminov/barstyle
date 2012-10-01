class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :text
      t.string :permalink
      t.boolean :main
      t.integer :menu_id

      t.timestamps
    end
  end
end
