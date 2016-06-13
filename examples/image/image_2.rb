#!/usr/bin/ruby

# Ev3dev::Image class requires RMagick gem (ImageMagick Ruby binding)
# robot@ev3dev:~$ sudo apt-get update
# robot@ev3dev:~$ sudo apt-get install ruby-rmagick
# (or ~$ sudo gem install rmagick -N -V)

require 'ev3dev'

image = Ev3dev::Image.new
image.save('/home/robot/no_image.mono')
puts "/home/robot/no_image.mono is created"
sleep 2

screen = Ev3dev::Screen.new
screen.load '/home/robot/no_image.mono'
puts "/home/robot/no_image.mono is loaded"
sleep 2

screen.show
puts "no_image.mono is displayed"
sleep 3
