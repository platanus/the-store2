class Api::Internal::ItemsController < Api::Internal::BaseController
  def index
    respond_with Item.all
  end

  def show
    respond_with item
  end

  private

  def item
    @item ||= Item.find_by!(id: params[:id])
  end
end
