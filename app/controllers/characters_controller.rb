class CharactersController < ApplicationController

  def index
    @characters = Character.all
    respond_to do | format |
      # format html requests normally
      format.html
      # for json requests, we'll use the built in serializer
      format.json { render json: @items }
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
     @character = Character.new(character_params)

     if @character.save
       flash[:notice] = "Character was saved successfully."

       respond_to do | format |
         # format html requests normally
         format.html { redirect_to @character }
         # for json requests, we'll use the built in serializer
         format.json { render json: @character }
       end
     else
 # #12
       flash.now[:alert] = "There was an error saving the character. Please try again."
       render :new
     end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    @character.assign_attributes(character_params)

    if @character.save
      flash[:notice] = "Character saved."
      redirect_to @character
    else
      flash.now[:alert] = "Where was an error saving the character."
      render :edit
    end
  end

  def destroy
    @character = Character.find(params[:id])

    if @character.destroy
      flash[:notice] = "\"#{@character.name}\" was deleted successfully."
      redirect_to characters_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private
  def character_params
    params.require(:character).permit(:name, :race_id, :hero_class_id, :height, :weight, :level, :current_xp, :strength, :dexterity, :constitution, :wisdom, :intelligence, :charisma, :wealth, :vision, :speed, :current_hp, :max_hp, :temp_hp, :proficiency_bonus)
  end

  def roll_dice
    rolls = []
	  sum = 0

	  # Roll 4 d-6
	  for i in 0..3
		    roll = 1 + rand(6)

		    # Sum all the dice
		    sum += roll
		    rolls << roll
	  end

	  # Sort them and remove the lowest number
	  rolls.sort!
    # Subtract that from the total
    sum -= rolls.shift

    sum
  end
end
