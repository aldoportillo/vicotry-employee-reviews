# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  content       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#  user_id       :integer
#
class Post < ApplicationRecord

  belongs_to :user
end
