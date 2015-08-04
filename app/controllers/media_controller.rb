class MediaController < ApplicationController
  def new
  end

  def create
    render plain: params[:media].inspect
  end
end
