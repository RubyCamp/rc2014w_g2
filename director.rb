module Scene1
class Director
  def initialize
    @shijimin = Character.new(5, 12, "images/shimanekko.png")
    @char1    = Character.new(13, 1, "images/shijimin.png", false)
    @char2    = Character.new(4, 4, "images/shimanekko.png", false)
    @bg_img = Image.load("images/background.png")
    @matsuejo    = Matsuejo.new(12, 3, "TourismAreaPicture/fixed_size_350/matsuejo.png","TourismAreaLogo/matsuejo.png", "TourismAreaIcon/matsuejo.png")
    @izumotaisya = Izumotaisya.new(10, 4, "TourismAreaPicture/fixed_size_350/izumotaisya.png","TourismAreaLogo/izumotaisya.png", "TourismAreaIcon/izumotaisya.png")
    @orochi = Orochi.new(11, 5, "TourismAreaPicture/fixed_size_350/oroch_roop.png","TourismAreaLogo/orochi_loop.png", "TourismAreaIcon/orochi_loop.png")
    @dojo   = Dojo.new(13, 5, "TourismAreaPicture/fixed_size_350/dojo_sukui.png","TourismAreaLogo/dojo_sukui.png", "TourismAreaIcon/dojo_sukui.png")
    @aquas  = Aquas.new(5, 10, "TourismAreaPicture/fixed_size_350/aquas.png","TourismAreaLogo/aquas.png", "TourismAreaIcon/aquas.png")
    @iwamiginzan = Iwamiginzan.new(7, 7, "TourismAreaPicture/fixed_size_350/iwamiginzann.png","TourismAreaLogo/iwamiginzan.png", "TourismAreaIcon/iwamiginzan.png")
    @gonokawa    = Gonokawa.new(6, 9, "TourismAreaPicture/fixed_size_350/go_no_kawa.png","TourismAreaLogo/gounokawa.png", "TourismAreaIcon/aquas.png")
    @kagura      = Kagura.new(4, 11, "TourismAreaPicture/fixed_size_350/iwamikagura.png","TourismAreaLogo/iwamikagura.png", "TourismAreaIcon/iwamikagura.png")
    @ushitsuki   = Ushitsuki.new(3, 5, "TourismAreaPicture/fixed_size_350/ushituki.png","TourismAreaLogo/ushitsuki.png", "TourismAreaIcon/ushitsuki.png")
    @rousoku   = Rousoku.new(2, 3, "","", "images/rousoku.png")    
    @active_player_changed = false
  end

  def play
    @matsuejo.show_icon    
    @izumotaisya.show_icon
    @orochi.show_icon
    @dojo.show_icon
    @aquas.show_icon    
    @iwamiginzan.show_icon
    @gonokawa.show_icon
    @kagura.show_icon
    @ushitsuki.show_icon

    @rousoku.show(@char1.x, @char1.y)


    Window.draw(0, 0, @bg_img)


    if Input.keyPush?(K_UP)
      @shijimin.take_pos_note
      @char2.take_pos_note

      @shijimin.up
      @shijimin.down unless check
      @char1.up
      @char1.down unless check1
      @char2.up
      @char2.down unless check2
      @active_player_changed = false

      @shijimin.play_effect_sound
      @char2.play_effect_sound      
    elsif Input.keyPush?(K_RIGHT)
      @shijimin.take_pos_note
      @char2.take_pos_note      

      @shijimin.right
      @shijimin.left unless check
      @char1.right
      @char1.left unless check1
      @char2.right
      @char2.left unless check2
      @active_player_changed = false

      @shijimin.play_effect_sound
      @char2.play_effect_sound               
    elsif Input.keyPush?(K_DOWN)
      @shijimin.take_pos_note
      @char2.take_pos_note      

      @shijimin.down
      @shijimin.up unless check
      @char1.down
      @char1.up unless check1
      @char2.down
      @char2.up unless check2
      @active_player_changed = false

      @shijimin.play_effect_sound
      @char2.play_effect_sound               
    elsif Input.keyPush?(K_LEFT)
      @shijimin.take_pos_note
      @char2.take_pos_note      

      @shijimin.left
      @shijimin.right unless check
      @char1.left
      @char1.right unless check1
      @char2.left
      @char2.right unless check2
      @active_player_changed = false

      @shijimin.play_effect_sound
      @char2.play_effect_sound               
    end

    unless @active_player_changed
      if @shijimin.active? && @shijimin.x==13 && @shijimin.y==2
        @shijimin.inactivate
        @char1.activate
        @active_player_changed = true
      elsif @char1.active? && @char1.x==4 && @char1.y==3 
        @char1.inactivate
        @char2.activate
        @active_player_changed = true
      elsif @char1.active? && @char1.x==13 && @char1.y==1
        @char1.inactivate
        @shijimin.activate
        @active_player_changed = true
      elsif @char2.active? && @char2.x==4 && @char2.y==4 
        @char2.inactivate
        @char1.activate
        @active_player_changed = true
      end
    end

    if @shijimin.active? && @char1.inactive? && @char2.inactive?
      @shijimin.draw
    elsif @shijimin.inactive? && @char1.active? && @char2.inactive?
      @char1.draw
    elsif @shijimin.inactive? && @char1.inactive? && @char2.active?
      @char2.draw
    end

    #p [@shijimin.x, @shijimin.y]
    #p [@char2.x, @char2.y]

    @matsuejo.show if @matsuejo.reached(@shijimin.x, @shijimin.y) == true
    @izumotaisya.show if @izumotaisya.reached(@shijimin.x, @shijimin.y) == true
    @orochi.show if @orochi.reached(@shijimin.x, @shijimin.y) == true
    @dojo.show if @dojo.reached(@shijimin.x, @shijimin.y) == true
    @aquas.show if @aquas.reached(@shijimin.x, @shijimin.y) == true
    @iwamiginzan.show if @iwamiginzan.reached(@shijimin.x, @shijimin.y) == true
    @gonokawa.show if @gonokawa.reached(@shijimin.x, @shijimin.y) == true
    @kagura.show if @kagura.reached(@shijimin.x, @shijimin.y) == true
    @ushitsuki.show if @ushitsuki.reached(@char2.x, @char2.y) == true
  end

  def check
    char_height = 4.0
    char_width = 4.0
    color = @bg_img[@shijimin.x*@shijimin.d + char_height, @shijimin.y*@shijimin.d + char_width]
    return color[1] < 100 && color[2] < 180 && color[3] <200
  end

  def check1
    char_height = 4.0
    char_width = 4.0
    color1 = @bg_img[@char1.x*@char1.d + char_height, @char1.y*@char1.d + char_width]
    return color1[1] > 0 && color1[2] < 170 #color[n]:RGBのn番目の数を引数としてとる.
  end

  def check2
    char_height = 4.0
    char_width = 4.0
    color = @bg_img[@char2.x*@char2.d + char_height, @char2.y*@char2.d + char_width]
    return color[2] > 170
  end

end

end