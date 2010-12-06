module Rack
  module Databases

    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      if request.path =~ /^\/__database__\/(.*)/
        begin 
          ActiveRecord::Base.establish_connection($1)
          [200, {'Content-Type' => 'text/plain'}, ["Switched to #$1 database"]]
        rescue => ex
          [500, {'Content-Type' => 'text/plain'}, [ex.message]]
        end 
      else 
        @app.call(env)
      end 
    end 

  end
end
