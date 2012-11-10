ActiveAdmin.register AdminUser do

	menu :label => proc{ I18n.t("active_admin.admin_user") }

	index do
		column :email
		column :role, collection: AdminUser::ROLES
		column :current_sign_in_at
		column :last_sign_in_at
		column :sign_in_count
		default_actions
	end

	filter :email

	form do |f|
		f.inputs "Admin Details" do
			f.input :email
			f.input :role, collection: AdminUser::ROLES
			f.input :password
			f.input :password_confirmation
		end
		f.buttons
	end
end
