class Recipe.Views.FoodRecipesIndexView extends Backbone.View

  el: '#recipes'

  template: JST["backbone/templates/food_recipes/index"]
  
  events:
    "submit .navbar-form" : "search"

  initialize: ->
      @render()
      @load_recents()
      # TODO: not alert, but create notifaction
      if @options.msg
        alert(@options.msg)

  load_recents: ->
      @options.recently_made.forEach(@addRecentlyMade, @)
      @options.recently_added.forEach(@addRecentlyAdded, @)

  addRecentlyAdded: (model) ->
      @view = new Recipe.Views.FoodRecipeRecentlyAddedView({model: model})
      @$el.find('#recently_added').append @view.render().el
      
  addRecentlyMade: (model, i) ->
      @view = new Recipe.Views.FoodRecipeRecentlyMadeView({model: model})
      @div = jQuery(@view.render().el)
      @div.addClass('active') if i == 0
      @$el.find('#recently_made').append @div

  search: ->
    router.navigate('#search/' + jQuery(".navbar-form input[type=text]").val(), {trigger:true})
    return false
  
  render: ->
      @$el.html @template()
      @
