Package.describe({
  name: 'ostrio:iron-router-title',
  version: '0.2.0',
  summary: 'Change document.title (page title) on the fly within iron-router',
  git: 'https://github.com/VeliovGroup/Meteor-iron-router-title',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0');
  api.use(['underscore', 'iron:router@1.0.7'], 'client');
  api.addFiles('ostrio:iron-router-title.js', 'client');
});