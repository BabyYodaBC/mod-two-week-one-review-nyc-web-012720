class SeasController < ApplicationController
  
  def index
    @seas = Sea.all
  end

  def new
    @sea = Sea.new
  end

  def create
    @sea = Sea(sea_params)

    redirect_to @sea
  end

  def show
    @sea = Sea.find(params[:id])
  end

  def edit
    @sea = Sea.find(params[:id])
  end

  def update
    @sea = Sea.find(params[:id])
    @sea.update(sea_params)
    redirect_to @sea
  end

  def destroy
    @sea = Sea.find(params[:id])
    @sea.destroy

    redirect_to_action: "index"
  end


  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
