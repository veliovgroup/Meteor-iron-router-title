Reactive page title for meteor within iron-router
========
Change `document.title` on the fly within [iron-router](https://atmospherejs.com/iron/router)

This package supports `title` option defined in list below, ordered by prioritization:
 - `Router.route()` [*overrides all*]
 - `RouteController.extend()`
 - `Router.configure()` [*might be overridden by any above*]

Install:
========
```shell
meteor add ostrio:iron-router-title
```

Usage:
========
Set `title` property in router's or controller's configuration:
```coffeescript
# Set default document.title value in 
# case router has no title property
Router.configure
  title: 'Default title'

Router.route 'account',
  template: 'account'
  path: '/me/account'
  title: 'My Account'

LocationController = RouteController.extend(title: "Location Title")
Router.route 'locations', controller: LocationController
```

Use function context:
```coffeescript
Router.route 'account',
  template: 'account'
  path: '/me/account/:_id'
  title: ->
    "Account of #{@data().getFullName()}"
  data: ->
    getFullName: =>
      Meteor.users.findOne(@params._id).fullName
```

To change `title` reactively, just pass it as function:
```coffeescript
Router.route 'account',
  template: 'account'
  path: '/me/account'
  title: () ->
    i18n.get 'account.document.title'
```
In this example we used [ostrio:i18n](https://atmospherejs.com/ostrio/i18n) package