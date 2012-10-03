ActiveAdmin.register Page do

	index do
		column :menu_id do |page|
			page.menu.name
		end
		column :main
		column :title
		column :text do |page|
			raw strip_tags page.text.slice 0, 500
		end
		default_actions
	end

	form do |f|
		f.inputs "Basic info" do
			f.input :menu_id, :as => :select, :collection => Menu.all
			f.input :main, :as => :radio
			f.input :title
			#f.input :featured_image, :as => :rich_picker, :config => { :style => 'width: 400px !important;' }
			f.input :text, :as => :rich, :config => { :width => '76%', :height => '400px' }
		end
		f.buttons
	end
end
