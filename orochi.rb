require_relative 'tourism_area'

class Orochi < TourismArea

  def initialize(x ,y, picture_path, logo_path, icon_path)
    super
    @icon.set_color_key([255,255,255])     
    @back = Image.load("Desc/background.PNG")
    @desc = Image.load("Desc/orochi.PNG").set_color_key([0,0,0])       
  end

  def show
    Window.drawScale(35, 600-@desc.height-14, @back, 1.13, 0.82)  #黒背景
    Window.draw(0, 600-@desc.height, @desc) #文字

    Window.draw(0, 100, @picture)
    Window.draw(0, 0, @logo, 1)
  end

end
