class Cers::CategoryCourse < ActiveRecord::Base
  belongs_to :cers_category, :class_name => 'Cers::Category', :foreign_key => :cers_category_id
  belongs_to :cers_course, :class_name => 'Cers::Course', :foreign_key => :cers_course_id
  # attr_accessible :title, :body
end
