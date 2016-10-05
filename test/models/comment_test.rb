# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  text             :text(65535)
#  user_name        :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  commentable_type :string(255)
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
