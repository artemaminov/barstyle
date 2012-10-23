ActiveAdmin.register Page do

	index do
		column :section_id do |page|
			page.section.name
		end
		column :main
		column :is_subsection
		column :title
		column :featured_image do |page|
			aws_image_tag(page.featured_image, :style => 'thumb')
		end
		column :static_attached
		column :announce
		default_actions
	end

	form do |f|
		f.inputs "Basic info" do
			f.input :section_id, :as => :select, :collection => Section.all
			f.input :main, :as => :radio
			f.input :is_subsection, :as => :radio
			f.input :title
			f.input :featured_image, :as => :rich_picker
			f.input :announce, :input_html => { :rows => 5 }
			f.input :text, :as => :rich, :config => { :width => '671px', :height => '400px' }
			f.input :static_attached
			f.input :permalink
		end
		f.buttons
	end
end
