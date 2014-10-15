require_relative 'tourism_area'

class Rousoku < TourismArea

  def initialize(x ,y, picture_path, logo_path, icon_path)
#    super
    @x, @y = x, y
    @icon  = Image.load(icon_path)

#    @back    = Image.load("Desc/background.PNG")
    @rousoku        = Image.load("Desc/rousoku.PNG").set_color_key([0,0,0])
    @rousoku_hakken = Image.load("Desc/rousoku_hakken.PNG").set_color_key([0,0,0])  
    @rousoku_sound = Sound.new("sounds/rousoku.wav")  
    @icon.set_color_key([0,117,117])
    @alpha = 0
    @got = false
    @rang = false
  end

  def show(cx, cy)
    Window.draw(800-@icon.width, 0, @icon)
    @got = true if reached(cx, cy)
    if @got && !@rang
      @rousoku_sound.play 
      @rang = true
    end
    if @got
      Window.draw(800-@rousoku.width-30, 600-@rousoku.height-150, @rousoku_hakken) #文字      
    else
      Window.draw(800-@rousoku.width-30, 600-@rousoku.height-150, @rousoku) #文字
    end
  end
end
