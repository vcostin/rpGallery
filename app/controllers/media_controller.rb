class MediaController < ApplicationController
  def index
      @media = Medium.with_role(:owner, current_user)
  end

  def show
    @medium = Medium.find(params[:id])
  end

  def new
    @medium = Medium.new
  end

  def edit
    @medium = Medium.find(params[:id])
  end

  def create
    # render plain: params[:medium].inspect
    @medium = Medium.new(medium_params)

    if @medium.save
      current_user.add_role :owner, @medium
      redirect_to media_path, notice: "The Media #{@medium.title} has been uploaded."
    else
      render "new"
    end
  end

  def update
    @medium = Medium.find(params[:id])

    if @medium.update(medium_params)
      redirect_to media_path, notice: "The Media #{@medium.title} has been updated."
    else
      render 'edit'
    end
  end

  def destroy
    @medium = Medium.find(params[:id])
    if @medium.destroy
      redirect_to media_path, notice: "The Media #{@medium.title} has been deleted."
    end
  end

  private
  def medium_params
    params.require(:medium).permit(:title, :description, :attachment)
  end
end
