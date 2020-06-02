class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all

    render json: {data: items, status: :ok}
  end
end