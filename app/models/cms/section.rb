class Cms::Section < ActiveRecord::Base

  belongs_to :domain
  has_many :categories

  attr_accessible :id, :domain_id, :name, :model_name
end
