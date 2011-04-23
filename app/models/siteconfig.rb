class Siteconfig < ActiveRecord::Base
  include Singleton
  
  attr_accessible :hero_url
end
