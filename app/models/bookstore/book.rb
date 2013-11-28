class Bookstore::Book < ActiveRecord::Base
  acts_as_taggable
  
  default_scope select('bookstore_books.id, bookstore_books.created_at, bookstore_books.cover_file_name, bookstore_books.cover_updated_at').joins("INNER JOIN cers_products ON cers_products.itemable_id = bookstore_books.id INNER JOIN cers_product_domains ON cers_product_domains.cers_product_id = cers_products.id").where("cers_products.itemable_type = ? AND cers_products.enabled = ? AND cers_product_domains.domain_id = ?", 'Bookstore::Book', true, ApplicationController::DOMAIN_ID)
  scope :salable, where('? >= cers_products.started_at AND (? <= cers_products.ended_at OR cers_products.ended_at IS NULL)', Time.now, Time.now)

  paginates_per 3

  #relação cers_products
  has_one :cers_product, :class_name => Cers::Product, :as => :itemable,
          :conditions => { :itemable_type => 'Bookstore::Book' }, :dependent => :destroy
  accepts_nested_attributes_for :cers_product, :allow_destroy => true

  # delegate :title, :to => :cers_product, allow_nil: true
  
  has_attached_file :cover,
                    :url  => ":attachment/:id-:style-:filename",
                    :path => ":class/:year/:month/:id-:style-:filename",
                    :styles => { default: "250x188>" }

  attr_accessible :author, :cover, :edition, :enabled, :ended_at, :path_id,
                    :size, :isbn, :pages, :tag_list, :price, :bookstore_publishing_house_id, 
                    :slug, :started_at, :synopsis, :title, :sale_item_prices_attributes, 
                    :cers_product_attributes

end