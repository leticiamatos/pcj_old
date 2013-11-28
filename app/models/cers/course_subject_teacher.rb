class Cers::CourseSubjectTeacher < ActiveRecord::Base

  acts_as_taggable

  belongs_to :cers_course,  :foreign_key => :cers_course_id,  :class_name => Cers::Course
  belongs_to :cers_subject, :foreign_key => :cers_subject_id, :class_name => Cers::Subject
  belongs_to :cers_teacher, :foreign_key => :cers_teacher_id, :class_name => Cers::Teacher


  attr_accessible :id, :receive_message, :cers_course_id,
                  :cers_subject_id, :cers_teacher_id, :quantity_of_lessons,
                  :mirrored_from_id, :tag_list

end
