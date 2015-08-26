class IronRouterTitle extends IronRouterHelper
  constructor: (@router) -> 
    super @router
    @title ?= new ReactiveVar null
    @title.set = (newValue) ->
      oldValue = @curValue
      if _.isEqual(oldValue, newValue)
        return
      else
        document.title = newValue
        @curValue = newValue

    self = @
    @router.onAfterAction ->
      self.getTitle()

  setTitle: (title) ->
    title = title.apply(@currentRoute) if _.isFunction title
    @title.set title if _.isString title

  getTitle: ->
    @setTitle switch
      when _.has @currentRoute.route.options, 'title' then @currentRoute.route.options.title
      when @currentController and _.has @currentController::, 'title' then @currentController::['title']
      when _.has @router.options, 'title' then @router.options.title
      else false

Meteor.startup -> new IronRouterTitle Router