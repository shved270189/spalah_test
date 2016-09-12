# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  email           :string
#  role            :integer          default("user")
#  type            :string
#

class Employee < User
end
