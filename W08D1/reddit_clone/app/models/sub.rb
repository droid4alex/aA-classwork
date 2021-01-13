# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :string           not null
#  mod_id      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sub < ApplicationRecord
    belongs_to :moderator,
        foreign_key: :mod_id,
        class_name: :User

    has_many :posts,
        foreign_key: :sub_id,
        class_name: :Post
end
