class Siteconfig < ActiveRecord::Base
  acts_as_singleton
  
  attr_accessible :hero_url
end

# == Schema Information
#
# Table name: siteconfigs
#
#  id             :integer         not null, primary key
#  hero_url       :string(255)
#  sidekick_url_1 :string(255)
#  sidekick_url_2 :string(255)
#  sidekick_url_3 :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

