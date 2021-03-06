#!/usr/bin/ruby

# https://github.com/ev3dev/ev3dev/wiki/Using-Sound
# http://espeak.sourceforge.net/commands.html

require 'ev3dev'

sound = Ev3dev::Sound.new

p sound.device_path  #=> "/sys/devices/platform/snd-legoev3"
p sound.mode         #=> "idle"; idle, tone or pcm
p sound.volume       #=> "75"
sound.volume 10
p sound.volume       #=> "9"

text =
"Hello, I am a robot EV3. \
 Now I can speak."

sound.espeak "'#{text}'"
sleep 3

# option -p; pitch, -s; speed in words-per-minute
sound.espeak "-p 80 -s 210 '#{text}'"
sleep 3

sound.espeak "'From the direct character string, I am a robot EV3. I can speak.'"
sleep 3

sound.espeak "-p 60 -s 100 'With options, I can speak.'"
sleep 3

# speaks a text file: option -f
sound.espeak "-f espeak_sample.txt"
sleep 3

sound.espeak "-p 90 -s 150 -f espeak_sample.txt"
sleep 3
