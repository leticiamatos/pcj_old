class Cers::Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => [:slugged, :history]

  belongs_to :itemable, :polymorphic => true
  
  has_many :cers_product_domains, :foreign_key => :cers_product_id, :class_name => Cers::ProductDomain
  has_many :domains, :through => :cers_product_domains, :class_name => Domain

  default_scope select('cers_products.slug, cers_products.title')

  scope :cers_courses,    where(:itemable_type => "Cers::Course")
  scope :bookstore_books, where(:itemable_type => "Bookstore::Book")

  scope :of_id, ->(itemable_id) { where(:itemable_id => itemable_id) }
  scope :saleable, where('? >= cers_products.started_at AND (? <= cers_products.ended_at OR cers_products.ended_at IS NULL)', Time.now.in_time_zone, Time.now.in_time_zone)


  attr_accessible :id, :itemable_type, :itemable_id,
                  :title, :price, :started_at,
                  :ended_at, :can_promote, :sale_item_prices_attributes,
                  :enabled

  def saleable?
    Time.now.in_time_zone >= self.started_at && Time.now.in_time_zone <= self.ended_at
  end

  def current_price
    valid_price = self.sale_item_prices.valid_item_price.first
    unless valid_price.blank?
      self.price - (self.price * valid_price.discount / 100)
    else
      self.price
    end
  end

  private
  def self.item(product_id)
    item = Cers::Product.find(product_id)
    item.itemable_type.constantize.find(item.itemable_id)
  end
end
