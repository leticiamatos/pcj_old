class Cers::Teacher < ActiveRecord::Base
  extend FriendlyId
  acts_as_taggable
  friendly_id :name, use: [:slugged, :history]

  default_scope select('cers_teachers.id, cers_teachers.slug, cers_teachers.name, cers_teachers.avatar_file_name, cers_teachers.avatar_updated_at, cers_teachers.created_at').where(:enabled => true)

  #Relação Teacher-Course
  has_many :cers_course_subject_teacher, :class_name => Cers::CourseSubjectTeacher, :foreign_key => :cers_teacher_id
  has_many :cers_courses, :through => :cers_course_subject_teacher, :class_name => Cers::Course

  # main subject references
  belongs_to :cers_subject, :foreign_key => :main_cers_subject_id, :class_name => Cers::Subject

  #relação subjects_teachers
  has_many :cers_subjects,         :through     => :cers_course_subject_teacher, :class_name => Cers::Subject

  has_attached_file :avatar,
                    :url    => ":attachment/:id-:style-:filename",
                    :path   => ":class/:year/:month/:id-:style-:filename",
                    :styles => { default: "150x150>" }
  
  has_attached_file :cover,
                    :url    => ":attachment/:id-cover-:filename",
                    :path   => ":class/:year/:month/:id-cover-:filename"

  attr_accessible :about, :email, :email_public, :enabled, :name, :slug, :video,
                  :cers_subject_attributes, :user_attributes, :cers_subject_ids, :user_id
end
