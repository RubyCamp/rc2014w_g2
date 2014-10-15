require 'dxruby'

require_relative 'director'
require_relative 'character'
require_relative 'matsuejo'
require_relative 'izumotaisya'
require_relative 'orochi'
require_relative 'dojo'
require_relative 'aquas'
require_relative 'iwamiginzan'
require_relative 'gonokawa'
require_relative 'kagura'
require_relative 'ushitsuki'
require_relative 'rousoku'

require_relative 'scene'
require_relative 'load_scenes'

sound = Sound.new("sounds/01.wav")  

Window.caption = "地味ファンタジー"
Window.width   = 800
Window.height  = 600

Scene.set_current_scene(:title)

Window.loop do
  if Input.keyPush?(K_ESCAPE)
    sound.play
  end

  Scene.play_scene
  
end
