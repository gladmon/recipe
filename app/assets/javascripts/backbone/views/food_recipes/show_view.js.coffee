class Recipe.Views.FoodRecipesShowView extends Backbone.View

  el: '.main-content'

  template: JST["backbone/templates/food_recipes/show"]

  initialize: (options) ->
      @render()
      @model.attributes.ingredients.forEach(@renderIngredientLi, @)
      @model.attributes.steps.forEach(@renderStepLi, @, '#step_list')
  
  renderIngredientLi: (item, parentList) ->
      @view = new Recipe.Views.FoodRecipeIngredientView({name: item})
      @$el.find('#ingredient_list').append @view.render().el
      
  renderStepLi: (item, parentList) ->
      @view = new Recipe.Views.FoodRecipeIngredientView({name: item})
      @$el.find('#step_list').append @view.render().el

  render: ->
      @$el.html(@template(@model))
      @
