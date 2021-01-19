class DosesController < ApplicationController

	def create
		@dose = Dose.new(dose_params)
    # we need `cocktail_id` to associate dose with corresponding cocktail
		@cocktail = Cocktail.find(params[:cocktail_id])
		@dose.cocktail = @cocktail
		if @dose.save
			redirect_to cocktail_path(@cocktail)
		else
			render :new
		end
	end

	def new
		@cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
	end

	def destroy
		@dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
	end

	private

	def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end