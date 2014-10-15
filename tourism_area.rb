class TourismArea

	def initialize(x ,y, picture_path, logo_path, icon_path)
    @x, @y = x, y
    @picture = Image.load(picture_path)
    @logo    = Image.load(logo_path)
    @icon    = Image.load(icon_path)
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
