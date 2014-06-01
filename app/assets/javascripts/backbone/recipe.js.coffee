#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

@app = new Backbone.Marionette.Application

app.addInitializer -> 
  app.addRegions(main: '#main')
  app.router = new Recipe.Routers.FoodRecipesRouter

app.addInitializer -> 
  jQuery(".navbar-form").submit ->
    app.router.search(jQuery(".navbar-form input[type=text]").val())
    jQuery(".navbar-form input[type=text]").val("")

window.Recipe =
  App: app
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  
$(document).ready ->
  app.start()
  Backbone.history.start()
