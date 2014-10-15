module Title
  class DirectorT
    def initialize
      @bg_img = Image.load("images/shimane_quest.png")
      @timer = 5 * 60
    end

    def play
      Window.draw(0, 0, @bg_img)
      @timer -= 1
      if @timer <= 0
        Scene.set_current_scene(:scene1)
      end
#     director.play
    end
  end
end
