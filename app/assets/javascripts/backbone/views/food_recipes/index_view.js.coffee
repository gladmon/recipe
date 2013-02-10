class Recipe.Views.FoodRecipesIndexView extends Backbone.View

  el: '#recipes'

  template: JST["backbone/templates/food_recipes/index"]

  initialize: ->
      @render()
      @load_recents()

  load_recents: ->
      @options.recently_made.forEach(@addRecentlyMade, @)
      @options.recently_added.forEach(@addRecentlyAdded, @)

  addRecentlyAdded: (model) ->
      @view = new Recipe.Views.FoodRecipeRecentlyAddedView({model: model})
      @$el.find('#recently_added').append @view.render().el
      
  addRecentlyMade: (model) ->
      @view = new Recipe.Views.FoodRecipeRecentlyMadeView({model: model})
      @$el.find('#recently_made').append @view.render().el

  render: ->
      @$el.html @template()
      @
