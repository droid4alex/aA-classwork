# == Schema Information
# Table name: enrollments
#  id         :bigint           not null, primary key
#  course_id  :integer   #foreign key
#  student_id :integer   #foreign key
#  created_at :datetime         not null
#  updated_at :datetime         not null
  #start with foreign keys, do belongs_to first
  #enrollments is like a joins table
  #always start with belongs_to, then locate where the correseponging has_many will be in (course.rb for this)
  #seed database using commands in lecture, then go into console to test like we did in lecture
class Enrollment < ApplicationRecord
  belongs_to :student,           
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :User
  belongs_to :course,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course
end
