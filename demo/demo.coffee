Router.configure
  layoutTemplate: '_layout'
  title: -> "Default Title"

secondPageController = RouteController.extend
  title: "Second Page Title"
  template: 'secondPage'
  path: '/secondPage'

Router.map ->
  @route 'index',
    template: 'index'
    path: '/'

  @route 'secondPage', controller: secondPageController

  @route 'thirdPage', 
    template: 'thirdPage'
    path: '/thirdPage/:something'
    title: -> "Third Page Title > #{@params.something}"
    data: -> param: @params.something

if Meteor.isClient
  Template._layout.helpers
    rand: -> Math.floor(Random.fraction() * 10) * 5