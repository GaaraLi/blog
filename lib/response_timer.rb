# class ResponseTimer
#   def initialize(app)
#     @app = app
#   end

#   def call(env)
#     status, headers, response = @app.call(env)
#     [status, headers, "<!-- Response Time: ... -->\n" + response.body]
#   end

#   def each
    
#   end
# end
class ResponseTimer
  def initialize(app, message = "Response Time")
    @app = app
    @message = message
  end
  
  def call(env)
    @start = Time.now
    @status, @headers, @response = @app.call(env)
    @stop = Time.now
    [@status, @headers, self]
  end
  
  def each(&block)
    # Add the last "if" will case the css and js not be loaded 
    # block.call("<!-- #{@message}: #{@stop - @start} -->\n") if @headers["Content-Type"].include? "text/html"
    block.call("<!--- #{@message}: #{@stop - @start} --->\n")
    @response.each(&block)
  end
end
