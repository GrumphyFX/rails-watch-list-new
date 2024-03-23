const { environment } = require('@rails/webpacker');

// Add this line to remove the 'node' configuration
environment.config.delete('node');

module.exports = environment;