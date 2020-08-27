class Rack::Attack
    Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
    Rack::Attack.safelist('allow from localhost') do |req|
        '127.0.0.1' == req.ip || '::1' == req.ip
    end
    throttle('req/ip', limit: 300, period: 5.minutes) do |req|
        req.ip # unless req.path.start_with?('/assets')
    end
end