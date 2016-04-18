class IronRouterTitle extends IronRouterHelper
  constructor: (@router) -> 
    super @router
    self       = @
    @default   = document.title or null
    @title    ?= new ReactiveVar @default
    
    @title.set = (newValue) ->
      oldValue = @curValue
      if _.isEqual(oldValue, newValue)
        return
      else
        document.title = newValue
        @curValue = newValue

    @router.onAfterAction -> self.getTitle()

  setTitle: (title) ->
    title = title.apply(@currentRoute) if _.isFunction title
    @title.set title if _.isString title

  getTitle: ->
    @setTitle switch
      when @currentRoute?.route?.options?.title then @currentRoute.route.options.title
      when @currentRoute?.prototype and _.has @currentRoute::, 'title' then @currentRoute::['title']
      when @currentRoute?.title then @currentRoute.title
      when @currentController?.prototype and _.has @currentController::, 'title' then @currentController::['title']
      when @currentController?.title then @currentController.title
      when @router?.options?.title then @router.options.title
      else @default

Meteor.startup -> new IronRouterTitle Router