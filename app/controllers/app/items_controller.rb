class App::ItemsController < App::BaseController
  def index
    @items = Item.all
  end
end
