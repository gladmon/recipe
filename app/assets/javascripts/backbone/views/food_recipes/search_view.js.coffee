class Recipe.Views.FoodRecipesSearchView extends Backbone.Marionette.CompositeView
  template: JST["backbone/templates/food_recipes/search"]
  events:
    "click .search-btn": "search_click"
  ui:
    searchbox: '.search-term'
  regions:
    searchResults: '#search-results'
  onRender: ->
    if @options.term
      @ui.searchbox.val(@options.term).focus()
      @search_click
    
  search_click: ->
    @search(@ui.searchbox.val())
        
  search: (term) ->
    if term.length < 4
      alert('You must search for things with atleast 4 letters for now :(')
      return false
    console.log(@collection.length)  
    console.log(@collection)  
    console.log(@collection.last_search)  
    if @collection.last_search!=term
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
