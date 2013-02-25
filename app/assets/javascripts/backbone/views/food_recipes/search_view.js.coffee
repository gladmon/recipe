class Recipe.Views.FoodRecipesSearchView extends Backbone.View

  el: '#recipes'

  template: JST["backbone/templates/food_recipes/search"]
  
  events:
    "click .search-btn": "search_click"

  initialize: ->
    @render()
    # TODO: not alert, but create notifaction
    if @options.term
      alert(@options.term)
    @collection = new Recipe.Collections.FoodRecipesCollection
    
  search_click: ->
    console.log(jQuery('.search-term',@$el))
    console.log(jQuery('.search-term',@$el).val())
    @search(jQuery('.search-term',@$el).val())
    return false
        
  search: (term) ->
    that = this
    @collection.fetch(
      'data': { search: term }, 
      'success': -> that.load_result() 
    )
    console.log("searching for",term)
    
  load_result: ->
    console.log("loading result?", @$el.find('.search-results'))
    @$el.find('.search-results').empty()
    that = this
    @collection.forEach (e,i) ->
      @recipe = new Recipe.Views.FoodRecipesSearchResultView({model:e})
      that.$el.find('.search-results').append @recipe.render().el
      console.log(i,@recipe,e)

  load_recents: ->
      @options.recently_made.forEach(@addRecentlyMade, @)
      @options.recently_added.forEach(@addRecentlyAdded, @)

  render: ->
      @$el.html @template()
      @
