ActiveAdmin.register Page do

	index do
		column :section_id do |page|
			page.section.name
		end
		column :main
		column :title
		column :permalink do |page|
			page.title.to_url
		end
		column :featured_image do |page|
			raw "<img src=\"#{page.featured_image}\">"
		end
		column :text do |page|
			raw strip_tags page.text.slice 0, 300
		end
		default_actions
	end

	form do |f|
		f.inputs "Basic info" do
			f.input :section_id, :as => :select, :collection => Section.all
			f.input :main, :as => :radio
			f.input :title
			f.input :permalink
			f.input :featured_image, :as => :rich_picker#, :config => { :allowed_styles => [ :original ], :view_mode => "list" }
			f.input :text, :as => :rich, :config => { :width => '76%', :height => '400px' }
		end
		f.buttons
	end
end
