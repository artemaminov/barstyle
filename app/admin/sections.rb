ActiveAdmin.register Section do

	config.sort_order = 'position_asc'

	index do
		column :show_in_menu
		column :position
		column :name
		column :is_news_section
		column :permalink
		default_actions
	end
  
end
