Reactive page title for meteor within iron-router
========
Change `document.title` on the fly within [iron-router](https://atmospherejs.com/iron/router)

Install:
========
```shell
meteor add ostrio:iron-router-title
```

Usage:
========
Simple set `title` property in router configuration:

```coffeescript
# Set default document.title value in 
# case router has no title property
document.title = 'My Meteor App Title'

Router.map ->
  Router.route 'account',
    template: 'account'
    path: '/me/account'
    title: 'My Account'
```

To change `title` reactively, just pass it as function:

```coffeescript
Router.map ->
  Router.route 'account',
    template: 'account'
    path: '/me/account'
    title: () ->
      i18n.get 'account.document.title'
```
In this example we used [ostrio:i18n](https://atmospherejs.com/ostrio/i18n) package