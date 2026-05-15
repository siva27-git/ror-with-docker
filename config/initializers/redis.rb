redis_options = {
  host: ENV.fetch("CACHE_HOST", "localhost"),
  port: ENV.fetch("CACHE_PORT", 6379).to_i,
  reconnect_attempts: 3,
  ssl: true
}

REDIS = Redis.new(redis_options)
