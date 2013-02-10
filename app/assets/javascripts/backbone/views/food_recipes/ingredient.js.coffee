class Recipe.Views.FoodRecipeIngredientView extends Backbone.View
  template: JST["backbone/templates/food_recipes/ingredient"]

  initialize: (options) ->
    @model = {'name' : options.name}
  
  destroy: () ->
    @model.destroy()
    this.remove()
    return false

  render: ->
    @$el.html(@template(@model))
    return this
