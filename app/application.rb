class Application
  def call(env)
    @@item = []
    
    
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item_name
        item = @@item.find{|i| i.name == item_name}
        resp.write item
      else
        resp.write "Route not found"
        resp.status = 404
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end