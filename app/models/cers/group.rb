class Cers::Group < ActiveRecord::Base
    extend FriendlyId

    has_many :cers_group_categories, :foreign_key => :cers_group_id,     :class_name => Cers::GroupCategory
    has_many :cers_categories,       :through     => :cers_group_categories, :class_name => Cers::Category
    has_many :cers_courses,          :through     => :cers_categories, :class_name => Cers::Course

    default_scope where(:enabled => true, :domain_id => ApplicationController::DOMAIN_ID).order('cers_groups.order').limit(7)
  
    attr_accessible :description, :enabled, :title, :slugged

    friendly_id :title, :use => [:slugged, :history]
    
    has_attached_file :image,
                  :url  => ":attachment/:id-:filename",
                  :path => ":class/:year/:month/:id-:filename"
end
