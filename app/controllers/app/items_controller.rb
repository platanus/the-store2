class App::ItemsController < App::BaseController
  def index
    @items = Item.all
  end

  def show
    @item = Item.includes(:reviews).find(params[:id])
    @reviews = @item.reviews.order(created_at: :desc).includes(:user)
  end
end
