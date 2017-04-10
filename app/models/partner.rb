# == Schema Information
#
# Table name: partners
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  dni        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Partner < ApplicationRecord
end
