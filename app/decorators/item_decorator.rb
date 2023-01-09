class ItemDecorator < Draper::Decorator
  delegate_all

  def reviews_average
    object.reviews.average(:rating)
  end

  def reviews_count
    object.reviews.count
  end
end
