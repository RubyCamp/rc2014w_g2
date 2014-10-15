class Iwamiginzan

  def initialize(x ,y, picture_path, logo_path, icon_path)
    @x,@y = x,y
    @picture = Image.load(picture_path)
    @logo = Image.load(logo_path)
    @icon = Image.load(icon_path)
    @back = Image.load("Desc/background.PNG")
    @desc = Image.load("Desc/iwamiginzan.PNG").set_color_key([0,0,0])    
    @dy = 600
  end

  def show
     Window.drawScale(35, 600-@desc.height-12, @back, 1.13, 0.82)  #黒背景
     Window.draw(0, 600-@desc.height, @desc) #文字
     Window.draw(400, @dy, @picture)
     Window.draw(400, @dy-100, @logo)
     if @dy > 200
       @dy -= 4
     elsif @dy == 200
       @dy += 4
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
