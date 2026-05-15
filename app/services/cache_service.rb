class CacheService
  def self.get(key)
    raw = REDIS.get(key)
    return nil if raw.nil?

    JSON.parse(raw, symbolize_names: true)
  rescue JSON::ParserError
    raw
  end

  def self.set(key, value, ttl: nil)
    serialized = value.is_a?(String) ? value : value.to_json
    if ttl
      REDIS.setex(key, ttl.to_i, serialized)
    else
      REDIS.set(key, serialized)
    end
  end

  def self.delete(key)
    REDIS.del(key)
  end

  def self.exists?(key)
    REDIS.exists?(key)
  end
end
