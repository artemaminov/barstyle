class AddSubsectionPositionToPages < ActiveRecord::Migration
  def change
    add_column :pages, :subsection_position, :integer
  end
end
