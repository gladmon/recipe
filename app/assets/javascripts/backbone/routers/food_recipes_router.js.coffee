class Recipe.Routers.FoodRecipesRouter extends Backbone.Router

  initialize: (options) ->
    @recipes = new Recipe.Collections.FoodRecipesCollection
    @recipes.add(Recipe.recently_made) if (Recipe.recently_made)
    @recipes.add(Recipe.recently_added) if (Recipe.recently_made)
    console.log("router init!")
    @search_collection = new Recipe.Collections.FoodRecipesCollection
    @search_collection.last_search = ""

  routes:
    "index"       : "index"
    "about"       : "about"
    "search/:term": "search"
    "search": "search"
    "recipe/new"         : "newRecipe"
    "recipe/:id"         : "show"
    "recipe/:id/edit"    : "edit"
    ".*"          : "index"

  index: ->
    if @msg
      @options.msg = @msg
    else
      @msg = null
    Recipe.App.main.show new Recipe.Views.FoodRecipesIndexView(@options)
    @setHeaderTab('homeTab')

  newRecipe: ->
    Recipe.App.main.show new Recipe.Views.EditRecipe({collection: @recipes})
    @setHeaderTab('newRecipeTab')
    
  show: (id) ->
    @model = @recipes.get(id)
    if not @model
      @model = new Recipe.Models.FoodRecipe({'id': id})
      @recipes.add(@recipe)
      that = this
      @model.fetch(
        'success': -> that.display()
        'error': -> console.log(that); that.msg = 404; that.navigate('#', {trigger: true}) 
      )
      console.log('waiting...')
    else
      @display()

  display: () ->
    Recipe.App.main.show new Recipe.Views.FoodRecipesShowView({'model':@model})
    @setHeaderTab('editTab')
    jQuery('.navbar-nav .editTab a').attr('href','#recipe/' + @model.id + '/edit');
    jQuery('.navbar-nav .editTab').show();
    
  search: (term) ->
    console.log("routing",@search_collection.length, @search_collection)
    Recipe.App.main.show new Recipe.Views.FoodRecipesSearchView({term:term, collection: @search_collection, recipes: @recipes})
    @setHeaderTab('searchTab')
    
  setHeaderTab: (className) ->
    jQuery('.navbar-nav .active').removeClass('active')
    jQuery('.navbar-nav .' + className).addClass('active')
