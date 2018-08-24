Rails.application.routes.draw do
  root to: 'contacts#index'
  get 'contacts' => 'contacts#index'
  get 'search' => 'contacts#search'
  get 'search/:string' => 'contacts#search'
end
