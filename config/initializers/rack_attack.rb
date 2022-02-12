class Rack::Attack
  throttle("api_ip", limit: 5, period: 10) do |request|
    request.ip
  end

  #safelist_ip("allow") do |req|
  #  '192.168.1.15' == req.ip || '::1' == req.ip || '127.0.0.1' == req.ip
  #end
end