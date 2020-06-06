class Api::V1::ItemsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    items = Item.all

    render json: {data: items, status: :success}
  end

  def show
    item = Item.find(params[:id])

    render json: {data: item, status: :success}
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: {data: item, status: :create}
    else
      render json: {data: item.errors, status: :unprocessable_entity}
    end
  end

  def update
    item = Item.find(params[:id])

    if item.update(item_params)
      render json: {data: item, status: :update}
    else
      render json: {data: item.errors, status: :unprocessable_entity}
    end
  end

  def destroy
    item = Item.find(params[:id])

    item.destroy
    render json: {data: item, status: :destroy}
  end

  private

  def item_params
    params.permit(:name, :stock, :price)
  end
end