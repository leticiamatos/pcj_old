class Domain < ActiveRecord::Base
    acts_as_taggable

  has_many :cers_product_domains, :foreign_key => :domain_id, :class_name => Cers::ProductDomain
  has_many :cers_products, :through => :cers_product_domains, :class_name => Cers::Product

    has_many :sections
end
