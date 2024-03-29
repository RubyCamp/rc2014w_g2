﻿require_relative 'tourism_area'

class Matsuejo < TourismArea

  def initialize(x ,y, picture_path, logo_path, icon_path)
    super
    @icon.set_color_key([255,255,255])        
    @back = Image.load("Desc/background.PNG")
    @desc = Image.load("Desc/matsuejo.PNG").set_color_key([0,0,0])    
    @alpha = 0
  end

  def show
    Window.drawScale(35, 600-@desc.height-30, @back, 1.13, 0.8)  #黒背景
    Window.draw(0, 600-@desc.height, @desc) #文字

    Window.drawAlpha(400, 350, @picture, @alpha)
    Window.drawAlpha(400, 250, @logo, @alpha)
   if @alpha <=250
    @alpha += 1
   elsif @alpha > 250
    @alpha = 0
   end
  end

end
