local obj = {
  layer = 0,
  uplayer = 0,
  spr1 = love.graphics.newImage("assets/game/circle.png"),
  spr2 = love.graphics.newImage("assets/game/paddle.png"),
  x=0,
  y=0,
  bobi=0,
  angle = 0,
  extend = 0,
  cmode = true
}


function obj.update(dt)
  if maininput:pressed("a") then
    obj.cmode = not obj.cmode
  end
  if obj.cmode then
    obj.angle = 0-math.deg(math.atan2(obj.y - love.mouse.getY(), love.mouse.getX() - obj.x)) +90
   -- print(math.atan2(obj.y - love.mouse.getY(), love.mouse.getX() - obj.x))
  else
    if maininput:down("left") then
      obj.angle = obj.angle - 7
    elseif maininput:down("right") then
      obj.angle = obj.angle + 7
    end
  end
      
  obj.bobi = obj.bobi + 0.05
  
  
  
end

function obj.draw()
  love.graphics.setLineWidth(2)
  local p1 = helpers.rotate(cs.length - 12+cs.extend,obj.angle,obj.x,obj.y)
  local p2 = helpers.rotate(2+cs.extend/2,obj.angle,obj.x,obj.y)
  local p3 = helpers.rotate(cs.length - 12+cs.extend,obj.angle+16,obj.x,obj.y)
  local p4 = helpers.rotate(cs.length - 12+cs.extend,obj.angle-16,obj.x,obj.y)

  helpers.color(2)

  love.graphics.line(p2[1],p2[2],p3[1],p3[2])
  love.graphics.line(p2[1],p2[2],p4[1],p4[2])
    helpers.color(1)
  love.graphics.draw(obj.spr1,p2[1],p2[2]+(math.sin(obj.bobi)*2),0,1,1,16,16)
  
  
  

  
  love.graphics.draw(obj.spr2,p1[1],p1[2],math.rad(obj.angle),1,1,24,14)



end
return obj