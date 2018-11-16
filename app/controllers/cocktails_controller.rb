class CocktailsController < ApplicationController
  def index
    ids = []
    @cocktails = Cocktail.all
    @cocktails.each { |c| ids << c.id }
    id = ids.sample
    @cocktail = Cocktail.find(id)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    @cocktail.save
    if @cocktail.save
      redirect_to cocktails_path
    else
      render 'new'
    end
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name, :photo)
  end
end
