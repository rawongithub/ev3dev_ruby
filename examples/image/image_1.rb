#!/usr/bin/ruby

# Ev3dev::Image class requires RMagick gem (ImageMagick Ruby binding)
# robot@ev3dev:~$ sudo apt-get update
# robot@ev3dev:~$ sudo apt-get install ruby-rmagick
# (or ~$ sudo gem install rmagick -N -V)

require 'ev3dev'

image = Ev3dev::Image.new('cat_10.jpg')
image.save('/home/robot/cat10.mono')
puts "cat_10.jpg is converted to /home/robot/cat10.mono"
sleep 2

screen = Ev3dev::Screen.new
screen.load '/home/robot/cat10.mono'
puts "/home/robot/cat10.mono is loaded"
sleep 2

screen.show
puts "cat10.mono is displayed"
sleep 3
