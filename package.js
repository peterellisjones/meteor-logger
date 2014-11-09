Package.describe({
  name: 'peterellisjones:logger',
  summary: 'Simple logger for Meteor',
  version: '1.0.0',
  git: 'https://github.com/peterellisjones/meteor-logger.git'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0');
  api.use('coffeescript');
  api.addFiles('logger.coffee');
  api.export('Logger');
});
