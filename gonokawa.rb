require_relative 'tourism_area'

class Gonokawa < TourismArea

  def initialize(x ,y, picture_path, logo_path, icon_path)
    @x,@y = x,y
    @picture = Image.load(picture_path)
    @logo = Image.load(logo_path)
    @icon = Image.load(icon_path)  
    @back = Image.load("Desc/background.PNG")
    @desc = Image.load("Desc/gonokawa.PNG").set_color_key([0,0,0])      
    @rot = 0
  end

  def show
    Window.drawScale(35, 600-@desc.height-12, @back, 1.13, 0.82)  #黒背景
    Window.draw(0, 600-@desc.height, @desc) #文字

    Window.drawRot(0, 100, @picture, @rot)
    Window.drawRot(0, 0, @logo, @rot)
    if @rot <360
     @rot += 10
    end
  end

end
