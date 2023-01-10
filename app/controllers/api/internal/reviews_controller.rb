class Api::Internal::ReviewsController < Api::Internal::BaseController
  before_action :authenticate_user!

  def create
    respond_with current_user.reviews.create!(review_params)
  end

  private

  def review_params
    params.require(:review).permit(
      :item_id,
      :body,
      :rating
    )
  end
end
