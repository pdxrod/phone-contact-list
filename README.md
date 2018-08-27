# README

# phone-contact-list

* Ruby version 2.4.1 - see https://rvm.io/

* Install Rails and other dependencies - `bundle`

* Create database - `rake db:create && rake db:migrate`

* Run the test suite - `rspec`

* After doing this, it's a good idea to `rm db/development.sqlite3` and then
`rake db:migrate RAILS_ENV=development`, as rspec affects the development database

* Run the app: `bin/rails server`, then go to http://localhost:3000 in a browser
