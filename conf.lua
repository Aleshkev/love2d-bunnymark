function love.conf(t)
  t.window.title = "LÖVE bunnymark"
  t.window.resizable = true
  t.window.width = 800
  t.window.height = 600
  t.window.vsync = false
  
  t.modules.audio = false
  t.modules.data = true
  t.modules.event = true
  t.modules.font = true
  t.modules.graphics = true
  t.modules.image = true
  t.modules.joystick = false
  t.modules.keyboard = false
  t.modules.math = false
  t.modules.mouse = true
  t.modules.physics = false
  t.modules.sound = false
  t.modules.system = false
  t.modules.thread = false
  t.modules.timer = true
  t.modules.touch = false
  t.modules.video = false
  t.modules.window = true
end
