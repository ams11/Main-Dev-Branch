# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts 'Create default admin user: admin/password.  Change the password!'
User.find_or_create_by_username('admin', { :email => 'info@soletron.com', :password => 'password', :password_confirmation => 'password', :roles => [ 'admin' ] })
