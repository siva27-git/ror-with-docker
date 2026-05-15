redis_options = {
  host: ENV.fetch("CACHE_HOST", "localhost"),
  port: ENV.fetch("CACHE_PORT", 6379),
  ssl: ENV.fetch("CACHE_TLS", "false") == "true"
}

password = ENV.fetch("CACHE_PASSWORD", nil)
redis_options[:password] = password if password.present?

REDIS = Redis.new(redis_options)
