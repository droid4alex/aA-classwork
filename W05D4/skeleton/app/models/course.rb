# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

  belongs_to :student, #bananable 
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :User


  has_many :enrolled_students, #bananable
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :User 

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  has_many :enrollments, 
    through: :enrollments,
    source: :student 
end
