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

class Image < ApplicationRecord
  belongs_to :imagable, polymorphic: true

  has_attached_file :file, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
end
