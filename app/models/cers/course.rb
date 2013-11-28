class Cers::Course < ActiveRecord::Base
  acts_as_taggable
  default_scope select('cers_courses.id, cers_courses.created_at, cers_courses.image_file_name, cers_courses.image_updated_at').joins('INNER JOIN cers_products ON cers_products.itemable_id = cers_courses.id INNER JOIN cers_product_domains ON cers_product_domains.cers_product_id = cers_products.id').where('cers_products.itemable_type = ? AND cers_products.enabled = ? AND cers_product_domains.domain_id = ?', 'Cers::Course', true, ApplicationController::DOMAIN_ID)
  scope :salable, where('? >= cers_products.started_at AND (? <= cers_products.ended_at OR cers_products.ended_at IS NULL)', Time.now, Time.now)

  COURSE_TYPES = {
      online: 1,
      presencial: 2
  }

  #relação category_courses
  has_many :category_courses, :foreign_key => :cers_course_id, :class_name => Cers::CategoryCourse
  has_many :cers_categories,  :through     => :category_courses

  #relação cers_products
  has_one :cers_product, :class_name => Cers::Product, :as => :itemable, :foreign_key => :itemable_id, :dependent => :destroy
  accepts_nested_attributes_for :cers_product, :allow_destroy => true

  #relação cers_course_subject_teachers
  has_many :cers_course_subject_teachers, :foreign_key => :cers_course_id,   :class_name => Cers::CourseSubjectTeacher
  has_many :cers_teachers,  :through => :cers_course_subject_teachers,       :class_name => Cers::Teacher
  has_many :cers_subjects, :through => :cers_course_subject_teachers,        :class_name => Cers::Subject
  accepts_nested_attributes_for :cers_course_subject_teachers, allow_destroy: true

  delegate :title, :to => :cers_product, allow_nil: true

  has_attached_file :image,
                    :url  => ":attachment/:id-:filename",
                    :path => ":class/:year/:month/:id-:filename"

  attr_accessible :id, :course_type, :title, :public_notice_link, :started_at,
                  :ended_at, :expire_at, :release_ended_at, :available_time,
                  :workload, :tag_list, :goal_description,
                  :workload_description, :programmatic_content, :cers_product_attributes,
                  :cers_category_ids, :cers_course_subject_teachers_attributes,
                  :cers_certificate_template_id, :image, :access_time

  def saleable?
    self.cers_product.saleable? && self.enabled
  end

  def current_price
    self.cers_product.current_price
  end

  def enabled
    self.cers_product.enabled
  end

  def started_at
    self.cers_product.started_at
  end

  def ended_at
    self.cers_product.ended_at
  end
end