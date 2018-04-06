local image
local batch

function love.load(arg)
  image = love.graphics.newImage('bunny.png')
  batch = love.graphics.newSpriteBatch(image, 100000, 'dynamic')
end

local nsprites = 0
local posx, posy, speedx, speedy = {}, {}, {}, {}

local function spawn()
  nsprites = nsprites + 1
  posx[nsprites] = 0.0
  posy[nsprites] = 0.0
  speedx[nsprites] = math.random() * 10.0
  speedy[nsprites] = math.random() * 10.0 - 5.0

  batch:add(0, 0)
end

local gravity = 0.75
local bounce = 0.85

function love.update(dt)
  if love.mouse.isDown(1) then
    for i = 1, 50 do
      spawn()
    end
  end

  local screenw, screenh = love.graphics:getDimensions()
  local halfimagew, halfimageh = image:getWidth() / 2, image:getHeight() / 2

  for i = 1, nsprites do
    posx[i] = posx[i] + speedx[i]

    if posx[i] < 0.0 then
      posx[i] = 0.0
      speedx[i] = -speedx[i]
    elseif posx[i] > screenw then
      posx[i] = screenw
      speedx[i] = -speedx[i]
    end

    posy[i] = posy[i] + speedy[i]
    speedy[i] = speedy[i] + gravity

    if posy[i] < 0.0 then
      posy[i] = 0.0
      speedy[i] = 0.0
    elseif posy[i] > screenh then
      posy[i] = screenh
      speedy[i] = speedy[i] * -bounce

      if math.random() < 0.5 then
        speedy[i] = speedy[i] - math.random() * 6.0
      end
    end

    batch:set(i, posx[i] - halfimagew, posy[i] - halfimageh)
  end
end

function love.draw()
  love.graphics.draw(batch)

  love.graphics.print(
    'Bunnies: ' ..
      nsprites ..
        '\nFPS: ' .. love.timer.getFPS() .. '\nFrametime: ' .. math.floor(1000 / love.timer.getFPS() * 10) / 10
  )
end
