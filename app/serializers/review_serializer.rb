class ReviewSerializer < BaseSerializer
  type :review
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
