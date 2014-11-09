class Logger
  LEVELS:
    error: 0
    warn: 1
    info: 2
    debug: 3

  constructor: (@source = '', @level) ->
    unless @level?
      @level = 'info'
      if Meteor.settings?
        if Meteor.settings.log_level?
          @level = Meteor.settings.log_level
        else if Meteor.settings.public and Meteor.settings.public.log_level?
          @level = Meteor.settings.public.log_level

    unless @LEVELS[@level]?
      throw new Error("Invalid level: #{@level}")

  throw: (message) ->
    @log('error', message)
    throw message

  error: (message) ->
    @log('error', message)

  warn: (message) ->
    @log('warn', message)

  info: (message) ->
    @log('info', message)

  debug: (message) ->
    @log('debug', message)

  log: (level = 'info', message) ->
    if @LEVELS[level] <= @LEVELS[@level]
      console.log @_format(message, level)

  _format: (message, level) ->
    "[#{@source}] #{level}: #{message}"
