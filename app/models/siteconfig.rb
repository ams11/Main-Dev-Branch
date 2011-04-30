class Siteconfig < ActiveRecord::Base
  acts_as_singleton

  has_attached_file :hero_picture_small_1,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
  has_attached_file :hero_picture_big_1,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"

  has_attached_file :hero_picture_small_2,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
  has_attached_file :hero_picture_big_2,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
    
  has_attached_file :hero_picture_small_3,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
  has_attached_file :hero_picture_big_3,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
    
  has_attached_file :topten_picture_1,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
  has_attached_file :topten_picture_2,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
  has_attached_file :topten_picture_3,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
  has_attached_file :topten_picture_4,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
  has_attached_file :topten_picture_5,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
  has_attached_file :topten_picture_6,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
  has_attached_file :topten_picture_7,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
  has_attached_file :topten_picture_8,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
  has_attached_file :topten_picture_9,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
  has_attached_file :topten_picture_10,
    :storage => :s3,
    :path => ':attachment/:id/:style.:extension',
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"

=begin
    attr_accessor :hero_title_1, :hero_desc_1, :hero_link_1
    attr_accessor :hero_title_2, :hero_desc_2, :hero_link_2
    attr_accessor :hero_title_3,
      :hero_desc_3,
      :hero_link_3,
      :topten_title_1,
      :topten_link_1,
      :topten_title_2,
      :topten_link_2,
      :topten_title_3,
      :topten_title_4,
      :topten_link_4,
      :topten_title_5,
      :topten_link_5,
      :topten_title_6,
      :topten_link_6,
      :topten_title_7,
      :topten_link_7,
      :topten_title_8,
      :topten_link_8,
      :topten_title_9,
      :topten_link_9,
      :topten_title_10,
      :topten_link_10,
      :hero_picture_big_1,
      :hero_picture_small_1,
      :hero_picture_big_2,
      :hero_picture_small_2,
      :hero_picture_big_3,
      :hero_picture_small_3,
      :topten_picture_1,
      :topten_picture_2,
      :topten_picture_3,
      :topten_picture_4,
      :topten_picture_5,
      :topten_picture_6,
      :topten_picture_7,
      :topten_picture_8,
      :topten_picture_9,
      :topten_picture_10
=end

end


# == Schema Information
#
# Table name: siteconfigs
#
#  id                                :integer         not null, primary key
#  hero_title_1                      :string(255)
#  hero_desc_1                       :string(255)
#  hero_link_1                       :string(255)
#  hero_title_2                      :string(255)
#  hero_desc_2                       :string(255)
#  hero_link_2                       :string(255)
#  hero_title_3                      :string(255)
#  hero_desc_3                       :string(255)
#  hero_link_3                       :string(255)
#  topten_title_1                    :string(255)
#  topten_link_1                     :string(255)
#  topten_title_2                    :string(255)
#  topten_link_2                     :string(255)
#  topten_title_3                    :string(255)
#  topten_title_4                    :string(255)
#  topten_link_4                     :string(255)
#  topten_title_5                    :string(255)
#  topten_link_5                     :string(255)
#  topten_title_6                    :string(255)
#  topten_link_6                     :string(255)
#  topten_title_7                    :string(255)
#  topten_link_7                     :string(255)
#  topten_title_8                    :string(255)
#  topten_link_8                     :string(255)
#  topten_title_9                    :string(255)
#  topten_link_9                     :string(255)
#  topten_title_10                   :string(255)
#  topten_link_10                    :string(255)
#  created_at                        :datetime
#  updated_at                        :datetime
#  hero_picture_big_1_file_name      :string(255)
#  hero_picture_big_1_content_type   :string(255)
#  hero_picture_big_1_file_size      :integer
#  hero_picture_big_1_updated_at     :datetime
#  hero_picture_small_1_file_name    :string(255)
#  hero_picture_small_1_content_type :string(255)
#  hero_picture_small_1_file_size    :integer
#  hero_picture_small_1_updated_at   :datetime
#  hero_picture_big_2_file_name      :string(255)
#  hero_picture_big_2_content_type   :string(255)
#  hero_picture_big_2_file_size      :integer
#  hero_picture_big_2_updated_at     :datetime
#  hero_picture_small_2_file_name    :string(255)
#  hero_picture_small_2_content_type :string(255)
#  hero_picture_small_2_file_size    :integer
#  hero_picture_small_2_updated_at   :datetime
#  hero_picture_big_3_file_name      :string(255)
#  hero_picture_big_3_content_type   :string(255)
#  hero_picture_big_3_file_size      :integer
#  hero_picture_big_3_updated_at     :datetime
#  hero_picture_small_3_file_name    :string(255)
#  hero_picture_small_3_content_type :string(255)
#  hero_picture_small_3_file_size    :integer
#  hero_picture_small_3_updated_at   :datetime
#  topten_picture_1_file_name        :string(255)
#  topten_picture_1_content_type     :string(255)
#  topten_picture_1_file_size        :integer
#  topten_picture_1_updated_at       :datetime
#  topten_picture_2_file_name        :string(255)
#  topten_picture_2_content_type     :string(255)
#  topten_picture_2_file_size        :integer
#  topten_picture_2_updated_at       :datetime
#  topten_picture_3_file_name        :string(255)
#  topten_picture_3_content_type     :string(255)
#  topten_picture_3_file_size        :integer
#  topten_picture_3_updated_at       :datetime
#  topten_picture_4_file_name        :string(255)
#  topten_picture_4_content_type     :string(255)
#  topten_picture_4_file_size        :integer
#  topten_picture_4_updated_at       :datetime
#  topten_picture_5_file_name        :string(255)
#  topten_picture_5_content_type     :string(255)
#  topten_picture_5_file_size        :integer
#  topten_picture_5_updated_at       :datetime
#  topten_picture_6_file_name        :string(255)
#  topten_picture_6_content_type     :string(255)
#  topten_picture_6_file_size        :integer
#  topten_picture_6_updated_at       :datetime
#  topten_picture_7_file_name        :string(255)
#  topten_picture_7_content_type     :string(255)
#  topten_picture_7_file_size        :integer
#  topten_picture_7_updated_at       :datetime
#  topten_picture_8_file_name        :string(255)
#  topten_picture_8_content_type     :string(255)
#  topten_picture_8_file_size        :integer
#  topten_picture_8_updated_at       :datetime
#  topten_picture_9_file_name        :string(255)
#  topten_picture_9_content_type     :string(255)
#  topten_picture_9_file_size        :integer
#  topten_picture_9_updated_at       :datetime
#  topten_picture_10_file_name       :string(255)
#  topten_picture_10_content_type    :string(255)
#  topten_picture_10_file_size       :integer
#  topten_picture_10_updated_at      :datetime
#  topten_link_3                     :string(255)
#

