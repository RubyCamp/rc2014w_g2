class Character

  attr_reader :x, :y
  attr_reader :d 

  def initialize(x, y, image_file, active = true)
    @d = 40
    @x, @y = x, y # 現在位置
    @x_bef, @y_bef = 0, 0 # 前の位置
    @active = active
    @image = Image.load(image_file).set_color_key([255, 255, 255])
    @tere_sound = Sound.new("sounds/01.wav")
    @ushitsuki_sound = Sound.new("sounds/get_treasure.wav")    
    @izumotaisya_sound = Sound.new("sounds/izumotaisya.wav")        
    @bgm = Sound.new("sounds/carby.wav").play
  end

  def activate
    @active = true
  end

  def inactivate
    @active = false
  end

  def active?
    return @active
  end

  def inactive?
    return !@active
  end

  def take_pos_note
    puts "(x_bef, y_bef) = (#{@x_bef}, #{@y_bef})"
    puts "(x, y) = (#{@x}, #{@y})"        
    @x_bef, @y_bef = @x, @y
  end

  def moved_to?
    (@x_bef != @x || @y_bef != @y)? true : false
  end

  def play_effect_sound
    @ushitsuki_sound.play if @x == 3 && @y == 5 && moved_to?    
    @tere_sound.play if @x == 12 && @y == 3 && moved_to? 
    @izumotaisya_sound.play if @x == 10 && @y == 4 && moved_to?     
  end

  def up
    @y -= 1 if active?
  end

  def right
    @x += 1 if active?
  end

  def down
    @y += 1 if active?
  end

  def left
    @x -= 1 if active?
  end

  def draw # ピクセルに直してから表示
    px = @x * @d
    py = @y * @d
    Window.draw(px, py, @image, 10)
  end
end
