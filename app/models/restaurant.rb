# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  location   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Restaurant < ApplicationRecord
end
