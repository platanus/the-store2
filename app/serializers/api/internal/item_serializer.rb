class Api::Internal::ItemSerializer < BaseSerializer
  type :item
  add_image_handling_attributes(
    attachment_name: :image,
    derivatives: ImageUploader::DERIVATIVES.keys,
    include_original_image: true
  )

  attributes(
    :id,
    :name,
    :description,
    :price,
    :created_at,
    :updated_at,
    :reviews_count,
    :reviews_average
  )

  has_many :reviews

  def reviews_count
    object.decorate.reviews_count
  end

  def reviews_average
    object.decorate.reviews_average.to_f
  end
end
