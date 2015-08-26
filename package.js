Package.describe({
  name: 'ostrio:iron-router-title',
  version: '1.0.0',
  summary: 'Change document.title (page title) on the fly within iron-router',
  git: 'https://github.com/VeliovGroup/Meteor-iron-router-title',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0');
  api.use(['underscore', 'iron:router@1.0.7', 'coffeescript', 'reactive-var', 'ostrio:iron-router-helper-class@1.0.0'], 'client');
  api.addFiles('iron-router-title.coffee', 'client');
  api.imply('ostrio:iron-router-helper-class@1.0.0');
});