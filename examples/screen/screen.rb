#!/usr/bin/ruby

# image_file must be 192 x 128 pixel .mono format
# (raw bi-level bitmap in least-significant-byte(LSB) first order)
# http://www.imagemagick.org/script/formats.php

require 'ev3dev'

screen = Ev3dev::Screen.new

screen.load 'black.mono'
puts "load 'black.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 3

screen.show
puts "show 'black.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 3

screen.show_blank
puts "blank screen: screen.imgs.size = #{screen.imgs.size}"
sleep 3

screen.show
puts "show 'black.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 3

screen.imgs.clear
puts "screen.imgs is cleared. screen.imgs.size = #{screen.imgs.size}"
sleep 3

screen.load 'face_1.mono'
puts "load 'face_1.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 1

screen.load 'face_2.mono'
puts "load 'face_2.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 1

screen.load 'face_3.mono'
puts "load 'face_3.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 1

screen.load 'face_4.mono'
puts "load 'face_4.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 1

screen.load 'face_5.mono'
puts "load 'face_5.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 1

screen.load 'white.mono'
puts "load 'white.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 1

screen.load 'cat_10.mono'
puts "load 'cat_10.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 3

screen.show
puts "show 'face_1.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 3

screen.show
puts "show 'face_2.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 3

screen.show
puts "show 'face_3.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 3

screen.show
puts "show 'face_4.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 3

screen.show
puts "show 'face_5.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 3

screen.show
puts "show 'white.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 3

screen.show
puts "show 'cat_10.mono' screen.imgs.size = #{screen.imgs.size}"
sleep 3

