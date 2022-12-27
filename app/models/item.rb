class Item < ApplicationRecord
  include ImageUploader::Attachment(:image)

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  has_many :reviews, dependent: :destroy
end

# == Schema Information
#
# Table name: items
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :string
#  price       :integer          default(0)
#  image_data  :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
