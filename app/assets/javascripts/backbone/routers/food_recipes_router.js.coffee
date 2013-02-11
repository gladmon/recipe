class Recipe.Routers.FoodRecipesRouter extends Backbone.Router

  initialize: (options) ->
    @options = options
    @recipes = new Recipe.Collections.FoodRecipesCollection
    @recipes.add(options.recently_made)
    @recipes.add(options.recently_added)

  routes:
    "index"       : "index"
    "new"         : "newRecipe"
    ":id"         : "show"
    ":id/edit"    : "edit"
    ".*"          : "index"

  index: ->
    if @msg
      @options.msg = @msg
    else
      @msg = null
    @view = new Recipe.Views.FoodRecipesIndexView(@options)

  newRecipe: ->
    @view = new Recipe.Views.FoodRecipesNewView({collection: @recipes})
    
  show: (id) ->
    @model = @recipes.get(id)
    if not @model
      @model = new Recipe.Models.FoodRecipe({'id': id})
      @recipes.add(@recipe)
      that = this
      @model.fetch(
        'success': -> @display()
        'error': -> console.log(that); that.msg = 404; that.navigate('#', {trigger: true}) 
      )
      console.log('waiting...')
    else
      @display()

  display: () ->
    @view = new Recipe.Views.FoodRecipesShowView({'model':@model})
    
