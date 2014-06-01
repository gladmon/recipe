class Recipe.Views.FoodRecipesIndexView extends Backbone.Marionette.ItemView

  template: JST["backbone/templates/food_recipes/index"]

  onRender: ->
    Recipe.recently_made.forEach(@addRecentlyMade, @) if Recipe.recently_made
    Recipe.recently_added.forEach(@addRecentlyAdded, @) if Recipe.recently_added
    if @options.msg
      alert(@options.msg)

  addRecentlyAdded: (model) ->
      @view = new Recipe.Views.FoodRecipeRecentlyAddedView({model: model})
      @$el.find('#recently_added').append @view.render().el
      
  addRecentlyMade: (model, i) ->
      @view = new Recipe.Views.FoodRecipeRecentlyMadeView({model: model})
      @div = jQuery(@view.render().el)
      @div.addClass('active') if i == 0
      @$el.find('#recently_made').append @div
