BarstyleLocal::Application.routes.draw do

  mount Rich::Engine => '/rich', :as => 'rich'

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config


  root :to => 'index#show_page'
	match '/search' => 'index#search', via: :post, as: :search
	match '/:section' => 'index#show_section', as: :section
	match '/:section/:page_permalink' => 'index#show_page', as: :page

end