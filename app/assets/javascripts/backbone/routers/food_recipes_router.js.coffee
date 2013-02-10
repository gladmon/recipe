class Recipe.Routers.FoodRecipesRouter extends Backbone.Router

  initialize: (options) ->
    @options = options

  routes:
    "index"       : "index"
    "new"         : "newPost"
    ":id"         : "show"
    ":id/edit"    : "edit"
    ".*"          : "index"

  index: ->
    @view = new Recipe.Views.FoodRecipesIndexView(@options)

  newPost: ->
    @view = new Recipe.Views.FoodRecipesNewView({collection: @recipes})
