class Api::Internal::PurchasesController < Api::Internal::BaseController
  before_action :authenticate_user!

  def index
    respond_with current_user.purchases
  end

  def show
    respond_with purchase
  end

  def create
    respond_with Purchase.create!(purchase_params.merge(user: current_user))
  end

  private

  def purchase
    @purchase ||= current_user.purchases.find_by!(id: params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(
      :item_id
    )
  end
end
