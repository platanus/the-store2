class Api::Internal::ReviewSerializer < ActiveModel::Serializer
  type :review

  belongs_to :user
  belongs_to :item

  attributes(
    :id,
    :user_id,
    :item_id,
    :body,
    :rating,
    :created_at,
    :updated_at
  )
end
