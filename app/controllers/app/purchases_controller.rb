class App::PurchasesController < App::BaseController
  def index
    @purchases = current_user.purchases.order(created_at: :desc).includes(:item)
  end
end
