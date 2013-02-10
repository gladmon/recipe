class Recipe.Views.FoodRecipeView extends Backbone.View
  template: JST["backbone/templates/food_recipes/post"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()
    return false

  render: ->
    console.log("post_view",this)
    @$el.html(@template(@model.toJSON()))
    return this
