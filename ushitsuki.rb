require_relative 'tourism_area'

class Ushitsuki < TourismArea

  def initialize(x ,y, picture_path, logo_path, icon_path)
    @x,@y = x,y
    @picture = Image.load(picture_path)
    @logo = Image.load(logo_path)
    @icon = Image.load(icon_path)
    @back = Image.load("Desc/background.PNG")
    @desc = Image.load("Desc/ushitsuki.PNG").set_color_key([0,0,0])    
    @size=-3
    @inc = true
    @stop_count = 0
  end


  def show
    Window.drawScale(35, 600-@desc.height-30, @back, 1.13, 0.8)  #黒背景
    Window.draw(0, 600-@desc.height, @desc) #文字

    Window.drawScale(400, 380, @picture, @size, 1)
    Window.drawScale(400, 300, @logo, @size, 1)

    @stop_count -= 1
    return if @stop_count > 0
    @size += @inc ? 0.1 : - 0.1 
    @stop_count = 60 if @size.to_i == 1
    if @size >= 1
      @inc = false
    elsif @size <= -1
      @inc = true
    end


=begin
  @stop_count -= 1
  if @stop_count > 0
    return
  end
  if @inc
    @size += 0.1
  else
    @size -= 0.1
  end

p @size
  if @size.to_i == 1
    @stop_count = 60
  end

  if @size >= 1
    @inc = false
  end
  if @size <= -1
    @inc = true
  end
=end


#  if -3 <= @size && @size <= 1
#    @size += 0.1
#  else
#    @size -= 1.0
#  end

#   if @size<=1 && @size>=-3
#    @size += 0.01 
#   end
  end

end

