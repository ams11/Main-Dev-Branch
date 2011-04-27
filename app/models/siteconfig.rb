class Siteconfig < ActiveRecord::Base
  acts_as_singleton
  
  has_attached_file :hero_picture, 
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml"
  has_attached_file :sidekick_picture_1, 
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml"
  has_attached_file :sidekick_picture_2, 
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml"
  has_attached_file :sidekick_picture_3, 
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml"
  
  attr_accessible :hero_url, :hero_picture, :sidekick_url_1, :sidekick_picture_1, :sidekick_url_2, :sidekick_picture_2, :sidekick_url_3, :sidekick_picture_3
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

