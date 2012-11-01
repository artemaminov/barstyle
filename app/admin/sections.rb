ActiveAdmin.register Section do

	menu :if => proc { current_admin_user.email == 'admin@barstyle.info' }

	config.sort_order = 'position_asc'

	index do
		column :position
		column :name
		column :show_in_menu
		column :is_news_section
		column :permalink
		default_actions
	end
  
end
