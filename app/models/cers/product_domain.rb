class Cers::ProductDomain < ActiveRecord::Base
  belongs_to :cers_product, :class_name => Cers::Product
  belongs_to :domain, :class_name => Domain

  attr_accessible :cers_product_id, :domain_id
end
