class AddRoleToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :role, :string
		AdminUser.find_by_email('admin@example.com').update_column('role', 'admin')
  end
end
