# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  email           :string(255)
#  role            :integer          default("user")
#  type            :string(255)
#  resume          :string(255)
#  provider        :string(255)
#  picture         :text(65535)
#  provider_id     :string(255)
#  auth_token      :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
