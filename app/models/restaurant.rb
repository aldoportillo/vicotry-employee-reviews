# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  location   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Restaurant < ApplicationRecord

  has_many :users

  has_many :posts, class_name: "Post", foreign_key: "restaurant_id"
end
