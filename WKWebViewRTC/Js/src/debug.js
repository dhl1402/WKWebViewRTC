var debug = require('debug')
var exec = require('./IOSExec');

// module.exports = debug
module.exports = (namespace) => (...data) => exec.execNative(null, null, 'native_console_log', namespace, data)