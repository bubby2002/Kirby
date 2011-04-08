# $: << File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'gosu'
require 'player'
require 'ball'

class MyGame < Gosu::Window
  def initialize
    super(1200, 1000, false)
    @player1 = Player.new(self)
    @balls = 6.times.map {Ball.new(self)}
    @running = true
    @pause = false
  end
    
  def button_down(id)
    if id == Gosu::Button::KbP
      if @pause == false
        @pause = true
      else
        @pause = false
      end
    end
  end

  def update
    if @pause == false
    
      if @running
        if button_down? Gosu::Button::KbLeft
          @player1.move_left
        end

        if button_down? Gosu::Button::KbRight
          @player1.move_right
        end

        if button_down? Gosu::Button::KbUp
          @player1.move_up
        end

        if button_down? Gosu::Button::KbDown
          @player1.move_down
        end

        @balls.each {|ball| ball.update}
     
        if @player1.hit_by? @balls
          stop_game!
        end
      
    else
        #the game is currently stopped
      if button_down? Gosu::Button::KbEscape
          restart_game
      end
    end
  end
end


    def draw
      @player1.draw
      @balls.each {|ball| ball.draw}
     end

     def stop_game!
       @running = false
     end

     def restart_game
       @running = true
       @balls.each {|ball| ball.reset!}
     end

end
game = MyGame.new
game.show

