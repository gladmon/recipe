class Validator
  constructor: (@target) ->
    @errors = 
      count: 0
  
  required: (prop) ->
    if !@target.has(prop)
      @errors[prop] = 'Please provide the ' + prop
      @errors.count++
    @
    
  notEmpty: (prop) ->
    if @target.has(prop) and @target.get(prop).length == 0
      @errors[prop] = 'Please provide the ' + prop
      @errors.count++
    @

  valid: ->
    @errors.count == 0

class Recipe.Models.FoodRecipe extends Backbone.Model
  paramRoot: 'food_recipe'
  urlRoot: '/food_recipes'
  validate: () ->
    validator = new Validator(this)
    validator.required('name').notEmpty('name')
    validator.required('steps').notEmpty('steps')
    validator.required('ingredients').notEmpty('ingredients')
    
    if validator.valid()
      null
    else
      validator.errors


class Recipe.Collections.FoodRecipesCollection extends Backbone.Collection
  model: Recipe.Models.FoodRecipe
  url: '/food_recipes'
