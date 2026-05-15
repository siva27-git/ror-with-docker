redis_options = {
  host: ENV.fetch("CACHE_HOST", "localhost"),
  port: ENV.fetch("CACHE_PORT", 6379),
  ssl: true
}

password = ENV.fetch("CACHE_PASSWORD", nil)
redis_options[:password] = password if password.present?

REDIS = Redis.new(redis_options)
