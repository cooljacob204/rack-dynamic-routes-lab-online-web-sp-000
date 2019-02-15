class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    
    if req.path.match(/items/)
      item_name= req.path.split("/items/").last
      item = @@item.find{|i| i.name == item_name}
      
      resp.write song.item
    end
    
    resp.finish
  end
end