class Recipe.Views.FoodRecipesSearchView extends Backbone.View

  el: '.main-content'

  template: JST["backbone/templates/food_recipes/search"]
  
  events:
    "click .search-btn": "search_click"

  initialize: ->
    @render()
    #@collection = new Recipe.Collections.FoodRecipesCollection
    if @options.term
      jQuery(".search-term").val(@options.term)
      @search(@options.term)
    
  search_click: ->
    @search(jQuery('.search-term',@$el).val())
    return false
        
  search: (term) ->
    if term.length < 4
      alert('You must search for things with atleast 4 letters for now :(')
      return false
    console.log(@collection.length)  
    console.log(@collection)  
    console.log(@collection.last_search)  
    if @collection.last_search!=term
      router.navigate("#search/" + term)
      that = this
      @collection.fetch(
        'data': { search: term }, 
        'success': -> that.load_result() 
      )
      @collection.last_search=term
      console.log("searching for",term)
    else
      @load_result()
    
  load_result: ->
    console.log("loading result?", @$el.find('.search-results'))
    @$el.find('.search-results').empty()
    if @collection.length > 0
      that = this
      @collection.forEach (e,i) ->
        @recipe = new Recipe.Views.FoodRecipesSearchResultView({model:e})
        that.$el.find('.search-results').append @recipe.render().el
        that.options.recipes.add(e)
    else
      @$el.find('.search-results').text("Woops! We're fresh out of " + jQuery(".search-term").val() + ". Please try searching differently...")

  load_recents: ->
      @options.recently_made.forEach(@addRecentlyMade, @)
      @options.recently_added.forEach(@addRecentlyAdded, @)

  render: ->
      @$el.html @template()
      @
