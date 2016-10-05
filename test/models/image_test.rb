# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  imagable_id       :integer
#  imagable_type     :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
