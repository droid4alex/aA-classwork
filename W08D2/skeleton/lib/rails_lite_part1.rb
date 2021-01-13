require 'rack'

class RackApplication
  def self.call(env)
    ['200', {'Content-Type' => 'text/html'}, ["Harrow world!"]]
  end
end

Rack::Server.start(
  app: RackApplication,
  Port: 3000
)