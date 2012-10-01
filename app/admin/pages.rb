ActiveAdmin.register Page do
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
