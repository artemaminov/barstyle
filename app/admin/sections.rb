ActiveAdmin.register Section do

	menu :label => proc{ I18n.t("active_admin.sections") }

	config.sort_order = 'position_asc'

	index do
		column :position
		column :name
		column :show_in_menu
		column :is_news_section
		column :permalink
		default_actions
	end

	form do |f|
		f.inputs "Basic info" do
			f.input :name
			f.input :permalink
			f.input :position
			f.input :show_in_menu, as: :radio
			f.input :is_news_section, as: :radio
		end
		f.buttons
	end
  
end