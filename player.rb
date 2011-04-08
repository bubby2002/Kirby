class Player

  def initialize(game_window)
      @game_window = game_window
      @icon = Gosu::Image.new(@game_window, "images/kirby.png", true)
      @x = 50
      @y = 800
      @z = 90
   end

 def draw
    @icon.draw(@x,@y, 1)
 end

  def move_left
    if @x < 0
      @x = 0
    else
      @x = @x - 10
    end
  end

  def move_right
    if @x > (@game_window.width - @z)
      @x = @game_window.width - @z
    else
    @x = @x + 10
    end
  end

  def move_up
    if @y < 0
      @y = 0
    else
      @y = @y - 10
    end
  end

  def move_down
    if @y > (@game_window.height - @z)
      @y = @game_window.height - @z
    else
      @y = @y + 10
    end
  end

  def hit_by?(balls)
   balls.any? {|ball| Gosu::distance(@x, @y, ball.x, ball.y) < 50}
  end


end