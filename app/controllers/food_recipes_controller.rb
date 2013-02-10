class FoodRecipesController < ApplicationController
  # GET /food_recipes
  # GET /food_recipes.json
  def index
    @food_recipes = FoodRecipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @food_recipes }
    end
  end

  # GET /food_recipes/1
  # GET /food_recipes/1.json
  def show
    @food_recipe = FoodRecipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food_recipe }
    end
  end

  # GET /food_recipes/new
  # GET /food_recipes/new.json
  def new
    @food_recipe = FoodRecipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food_recipe }
    end
  end

  # GET /food_recipes/1/edit
  def edit
    @food_recipe = FoodRecipe.find(params[:id])
  end

  # POST /food_recipes
  # POST /food_recipes.json
  def create
    @food_recipe = FoodRecipe.new(params[:food_recipe])

    respond_to do |format|
      if @food_recipe.save
        format.html { redirect_to @food_recipe, notice: 'Food recipe was successfully created.' }
        format.json { render json: @food_recipe, status: :created, location: @food_recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @food_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /food_recipes/1
  # PUT /food_recipes/1.json
  def update
    @food_recipe = FoodRecipe.find(params[:id])

    respond_to do |format|
      if @food_recipe.update_attributes(params[:food_recipe])
        format.html { redirect_to @food_recipe, notice: 'Food recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_recipes/1
  # DELETE /food_recipes/1.json
  def destroy
    @food_recipe = FoodRecipe.find(params[:id])
    @food_recipe.destroy

    respond_to do |format|
      format.html { redirect_to food_recipes_url }
      format.json { head :no_content }
    end
  end
end
