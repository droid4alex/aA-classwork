# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
class User < ApplicationRecord
  #enrolled_courses
  has_many :enrollments,             #correct, per Zach
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  has_many :enrolled_courses, 
    through: :enrollments, 
    source: :course 

    # has_many :enrolled_courses,       #incorrect, use "through"
    # primary_key: :id,
    # foreign_key: :course_id,
    # class_name: :Course 

end
