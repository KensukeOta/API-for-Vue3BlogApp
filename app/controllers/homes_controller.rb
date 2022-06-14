class HomesController < ApplicationController
  def index
    render json: { message: "OK"}
  end
end
