class Cms::Category < ActiveRecord::Base
  belongs_to :section
  has_many :news
  has_many :downloads
  has_many :blogs
  has_many :banners

  attr_accessible :id, :name, :section_id
end
