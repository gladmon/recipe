class Recipe.Views.FoodRecipesShowView extends Backbone.View

  el: '#recipes'

  template: JST["backbone/templates/food_recipes/show"]

  initialize: ->
      @render()
      @model.ingredients.forEach(@renderLi, @, '#ingredient_list')
      @model.steps.forEach(@renderLi, @, '#step_list')

  renderLi: (item, parentList) ->
      @view = new Recipe.Views.FoodRecipeIngredientView({name: item})
      @$el.find(parentList).append @view.render().el

  render: ->
      @$el.html @template()
      @
