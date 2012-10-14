ActiveAdmin.register Section do

	config.sort_order = 'position_asc'

	index do
		column :position
		column :name
		column :permalink
		default_actions
	end
  
end
