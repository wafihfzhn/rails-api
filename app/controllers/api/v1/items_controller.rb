class Api::V1::ItemsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    items = Item.all

    render json: {data: items, status: :ok}
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: {data: item, status: :create}
    else
      render json: {data: item.errors, status: :unprocessable_entity}
    end
  end

  private

  def item_params
    params.permit(:name, :stock, :price)
  end
end