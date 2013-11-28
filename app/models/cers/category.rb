class Cers::Category < ActiveRecord::Base
    extend FriendlyId

    #relação category_courses
    has_many :category_courses,      :foreign_key => :cers_category_id
    has_many :cers_courses,          :through     => :category_courses

    has_many :cers_categories,     :foreign_key => :cers_category_id, :class_name => Cers::Category
    
    has_many :cers_group_categories, :foreign_key => :cers_category_id, :class_name => Cers::GroupCategory
    has_many :cers_groups,           :through     => :cers_group_categories

    attr_accessible :enabled, :slug, :title, :cers_group_ids

    validate :title, :maxlengh => 10, :presence => true

    friendly_id :title, :use => [:slugged, :history]
end
