require 'test_helper'

class FoodRecipesControllerTest < ActionController::TestCase
  setup do
    @food_recipe = food_recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_recipe" do
    assert_difference('FoodRecipe.count') do
      post :create, food_recipe: {  }
    end

    assert_redirected_to food_recipe_path(assigns(:food_recipe))
  end

  test "should show food_recipe" do
    get :show, id: @food_recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_recipe
    assert_response :success
  end

  test "should update food_recipe" do
    put :update, id: @food_recipe, food_recipe: {  }
    assert_redirected_to food_recipe_path(assigns(:food_recipe))
  end

  test "should destroy food_recipe" do
    assert_difference('FoodRecipe.count', -1) do
      delete :destroy, id: @food_recipe
    end

    assert_redirected_to food_recipes_path
  end
end
