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
    :updated_at
  )
end
