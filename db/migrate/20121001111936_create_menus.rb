class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :permalink
      t.integer :position

      t.timestamps
    end
  end
end
