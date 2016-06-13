# http://www.ev3dev.org/docs/tutorials/using-ev3-lcd/
# LCD Mode      : 178 x 128 pixel
#     LineLength: 24 bytes (192 bits)
#     Geometry  : 1 (1 bit per pixel)
#     Type      : PACKED PIXELS
#     Visual    : MONO01 (0: white, 1: black)
# Frame Buffer directory: /dev/fb0
# Frame Buffer size     : 24 * 128 = 3072 bytes
# 178 bits in a line (192 bits) and 128 rows are actually displayed
#
# image_file must be 192 x 128 pixel .mono format
# (raw bi-level bitmap in least-significant-byte(LSB) first order)
# http://www.imagemagick.org/script/formats.php


module Ev3dev
  class Screen
    PATH = "/dev/fb0"

    FRAME_BUFFER_SIZE = 3072   # 24 line length * 128 rows
    BLANK_IMAGE = Array.new(FRAME_BUFFER_SIZE){ 0 }.pack("C*")

    attr_accessor :imgs

    def initialize
      raise "couldn't find screen attributes" unless File.exist?(PATH)
      @imgs = []
    end

    def load(image_file)
      raise "couldn't load a image file except .mono format" unless image_file.end_with?('.mono')

      file_size = File.size(image_file)
      raise "file size:#{file_size} is not correct:(#{FRAME_BUFFER_SIZE})" unless file_size == FRAME_BUFFER_SIZE

      @imgs << File.binread(image_file)
    end

    def load_blank
      @imgs << BLANK_IMAGE
    end

    def show
      if @imgs.size >= 2
        File.binwrite(PATH, @imgs.shift)
      else
        File.binwrite(PATH, @imgs.first)
      end
    end

    def show_blank
      File.binwrite(PATH, BLANK_IMAGE)
    end
  end
end
