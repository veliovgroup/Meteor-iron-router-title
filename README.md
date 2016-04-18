Reactive page title for Meteor and Iron-Router
========
Change `document.title` (*page title*) on the fly via [iron-router's](https://atmospherejs.com/iron/router) configuration.

This package supports `title` option defined in list below, ordered by prioritization:
 1. `Router.route()` [*overrides all below*]
 2. `RouteController.extend()`
 3. `Router.configure()` 
 4. `<title>My Title</title>` [*might be overridden by any above*]

Install:
========
```shell
meteor add ostrio:iron-router-title
```

Demo Application:
========
 - [Source](https://github.com/VeliovGroup/Meteor-iron-router-title/tree/master/demo)
 - ~~Live: http://iron-router-title.meteor.com~~ (*We are looking for free hosting for this demo*)

Usage:
========
Set *default* title in your template, this title will be used if `title` isn't specified in router's configuration:
```html
<head>
  <title>My default title</title>
</head>
```

Set `title` property in router's or controller's configuration:
```javascript
// Set default document.title value in 
// case router has no title property
Router.configure({
  title: 'Default title'
});

Router.route('account', {
  template: 'account',
  path: '/me/account',
  title: 'My Account'
});

var LocationController = RouteController.extend({
  title: "Location Title"
});

Router.route('locations', {
  controller: LocationController
});
```

Use function context:
```javascript
Router.route('account', {
  template: 'account',
  path: '/me/account/:_id',
  title: function() {
    return "Account of " + (this.data().getFullName());
  },
  data: function() {
    var self = this;
    return {
      getFullName: function() {
        return Meteor.users.findOne(self.params._id).fullName;
      }
    };
  }
});
```

To change `title` reactively, just pass it as function:
```javascript
Router.route('account', {
  template: 'account',
  path: '/me/account',
  title: function() {
    return i18n.get('account.document.title');
  }
});
```
In this example we've used [ostrio:i18n](https://atmospherejs.com/ostrio/i18n) package