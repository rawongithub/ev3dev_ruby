#!/usr/bin/ruby

# Ev3dev::Image class requires RMagick gem (ImageMagick Ruby binding)
# robot@ev3dev:~$ sudo apt-get update
# robot@ev3dev:~$ sudo apt-get install ruby-rmagick
# (or ~$ sudo gem install rmagick -N -V)

require 'ev3dev'

image = Ev3dev::Image.new
image.text(20, 60, 40, "I'm EV3!")
image.save('/home/robot/text.mono')
puts "text image /home/robot/text.mono is created"
sleep 2

screen = Ev3dev::Screen.new
screen.load '/home/robot/text.mono'
puts "text image /home/robot/text.mono is loaded"
sleep 2

screen.show
puts "now display 'I'm EV3!'"
sleep 3
