class Cers::Subject < ActiveRecord::Base

  #relação cers_course_subject_teachers
  has_many :cers_course_subject_teachers, :foreign_key => :cers_subject_id,              :class_name => Cers::CourseSubjectTeacher
  has_many :cers_courses,                 :through     => :cers_course_subject_teachers, :source     => :cers_course
  has_many :cers_teachers,                :class_name  => Cers::Teacher, :through => :cers_course_subject_teachers

  attr_accessible :id, :title, :enabled

end
