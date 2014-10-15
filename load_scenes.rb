require_relative 'title/director'
require_relative 'director'

Scene.add_scene(Title::DirectorT.new,  :title)
Scene.add_scene(Scene1::Director.new,  :scene1)
