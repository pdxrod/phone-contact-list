Rails.application.routes.draw do
  root to: 'contacts#index'
  get 'contacts' => 'contacts#index'
  get '1' => 'contacts#index', number: 1
  get '2' => 'contacts#index', number: 2
  get '3' => 'contacts#index', number: 3
  get '4' => 'contacts#index', number: 4
  get '5' => 'contacts#index', number: 5
  get '6' => 'contacts#index', number: 6
  get '7' => 'contacts#index', number: 7
  get '8' => 'contacts#index', number: 8
  get '9' => 'contacts#index', number: 9
  get '*' => 'contacts#index'
  get '0' => 'contacts#index'
  get '#' => 'contacts#index'
  get 'search' => 'contacts#search'
  get 'search/:string' => 'contacts#search'
end
