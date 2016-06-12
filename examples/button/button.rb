#!/usr/bin/ruby

# http://www.ev3dev.org/docs/tutorials/using-ev3-buttons/

require 'ev3dev'

button = Ev3dev::Button.new
led    = Ev3dev::Led.new

puts "Right side button is pressed?"
sleep 2
puts button.right?   #=> pressed: true, released: false
                     # up?, down?, left?, right?, enter?, back?
sleep 3

puts "Pressed buttons will be indicated"
sleep 2
puts button.pressed  #=> ["up", "left"] (if the up and left buttons pressed)

sleep 3

puts "If the left or right button is pressed, led on. Break: back button"
led.off
loop do
  if button.left?
    led.left_green.on
  elsif button.right?
    led.right_green.on
  elsif button.back?
    break
  else
    led.off
  end
end
