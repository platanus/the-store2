class App::ItemsController < App::BaseController
  def index
    @items = Item.all
  end

  def show
    @item = Item.includes(:reviews).find(params[:id])
  end
end
