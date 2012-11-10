ActiveAdmin.register Page do

	menu :label => proc{ I18n.t("active_admin.pages") }

	filter :section_id
	filter :title
	filter :updated_at

	index do
		column :section_id do |page|
			page.section.name
		end
		column :at_main
		column :is_subsection
		column :title
		column :featured_image do |page|
			unless page.featured_image.blank?
				aws_image_tag(page.featured_image, style: 'thumb')
			end
		end
		column :static_attached
		column :announce
		default_actions
	end

	form do |f|
		f.inputs "Basic info" do
			f.input :section_id, as: :select, collection: Section.all, label: t("activerecord.attributes.page.section")
			f.input :at_main, as: :radio, label: t("activerecord.attributes.page.at_main")
			f.input :is_subsection, as: :radio, label: t("activerecord.attributes.page.is_subsection")
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
