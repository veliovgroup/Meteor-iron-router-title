Router.configure
  layoutTemplate: '_layout'
  title: -> "Default Title"

secondPageController = RouteController.extend
  title: "Second Page Title"
  template: 'secondPage'
  path: '/secondPage'
  data: -> rand: Random.id()

Router.map ->
  @route 'index',
    template: 'index'
    path: '/'
    data: -> rand: Random.id()

  @route 'secondPage', controller: secondPageController

  @route 'thirdPage', 
    template: 'thirdPage'
    path: '/thirdPage/:something'
    title: -> "Third Page Title > #{@params.something}"
    data: -> 
      param: @params.something
      rand: Random.id()