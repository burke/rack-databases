module Rack
  class Databases

    def self.current
      @current ||= 'default'
    end 
    
    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      if request.path =~ /^\/__database__\/(.*)/
        begin 
          nxt = $1
          ActiveRecord::Base.establish_connection(nxt)
          Rack::Databases.instance_variable_set("@current", nxt)
          [200, {'Content-Type' => 'text/plain'}, ["Switched to #{nxt} database"]]
        rescue => ex
          [500, {'Content-Type' => 'text/plain'}, [ex.message]]
        end 
      else 
        @app.call(env)
      end 
    end 

  end
end
