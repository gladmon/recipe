class Recipe.Views.EditRecipe extends Backbone.Marionette.ItemView
  template: JST['backbone/templates/food_recipes/edit']
  events:
    'submit form': 'saveRecipe'
  ui:
    form: 'form'
    errorList: '#errorList'
    errors: '#errors'
    
  onRender: ->
    @ui.errors.hide()
  
  saveRecipe: ->
    @.$('.has_error').removeClass('has-error')
    @ui.errors.hide();
    if !@model
      @model = new Recipe.Models.FoodRecipe();
    model = @model
    @ui.form.serializeArray().forEach (o, i) ->
      model.set(o.name, o.value)
    model.validate()
    console.log(model.isValid(), model.validationError);
    view = @
    if !model.isValid()
      @ui.errorList.empty();
      _.each model.validationError, (message, prop) ->
        return if prop == 'count'
        view.$('[name=' + prop + ']').parent().addClass('has-error')
        view.ui.errorList.append($('<li></li>').text(message))
        console.log('[name=' + prop + ']',view.$('[name=' + prop + ']'), view.$('[name=' + prop + ']').parent())
      @ui.errors.show();
    else
      this.collection.create(model)
    return false;
