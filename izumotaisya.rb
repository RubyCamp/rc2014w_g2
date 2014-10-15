class Izumotaisya

  def initialize(x ,y, picture_path, logo_path, icon_path)
    @x,@y = x,y
    @picture = Image.load(picture_path)
    @logo = Image.load(logo_path)
    @alpha = 0
    @icon = Image.load(icon_path)    
    @back = Image.load("Desc/background.PNG")
    @desc = Image.load("Desc/izumotaisya.PNG").set_color_key([0,0,0])
    @icon.set_color_key([255,255,255])
  end

  def show
    Window.drawScale(35, 600-@desc.height-12, @back, 1.13, 0.82)  #黒背景
    Window.draw(0, 600-@desc.height, @desc) #文字

    Window.drawAlpha(400, 350, @picture, @alpha)
    Window.drawAlpha(400, 250, @logo, @alpha)
    if @alpha <=250
      @alpha += 1
    end
  end

  def show_icon
    Window.draw(@x*40, @y*40, @icon, 1)  #最後の引数は重ねる順番
  end

  def reached(cx, cy)
    if @x == cx && @y == cy
      return true
    else
      return false
    end
  end
end
