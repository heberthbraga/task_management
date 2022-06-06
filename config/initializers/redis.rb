unless defined? REDIS_URL
  REDIS_URL = "#{ENV.fetch('REDIS_URL')}:#{ENV.fetch('REDIS_PORT')}/#{ENV.fetch('REDIS_DATABASE')}"
end