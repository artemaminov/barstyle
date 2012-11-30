ActiveAdmin.register Page do

	menu :label => proc{ I18n.t("active_admin.pages") }

	actions :all, except: [:show]

	filter :section_id
	filter :title
	filter :updated_at

	index do
		column :section, sortable: :section_id do |page|
			page.section.name
		end
		column :title
		column :at_main do |s|
			Utility.t(s.at_main)
		end
		column :is_subsection do |s|
			Utility.t(s.is_subsection)
		end
		column t("active_admin.attributes.pages.subsection_position"), :subsection_position
		default_actions
	end

	form do |f|
		f.inputs "Basic info" do
			f.input :section_id, as: :select, collection: Section.all, label: t("activerecord.attributes.page.section")
			f.input :at_main, as: :radio, collection: Utility.yesno, label: t("activerecord.attributes.page.at_main")
			f.input :is_subsection, as: :radio, collection: Utility.yesno, label: t("activerecord.attributes.page.is_subsection")
			f.input :subsection_position, label: t("activerecord.attributes.page.subsection_position")
			f.input :title, label: t("activerecord.attributes.page.title")
			f.input :permalink, label: t("activerecord.attributes.page.permalink")
			f.input :featured_image, as: :rich_picker, config: { scoped: true, style: 'width: 60%;' }, label: t("activerecord.attributes.page.featured_image")
			f.input :announce, input_html: { rows: 5 }, label: t("activerecord.attributes.page.announce")
			f.input :text, as: :rich, config: { scoped: true, width: '690px', height: '400px' }, label: t("activerecord.attributes.page.text")
			f.input :static_attached, label: t("activerecord.attributes.page.static_attached")
		end
		f.buttons
	end
end
