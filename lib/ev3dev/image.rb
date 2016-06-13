# You should install ImageMagick and its Ruby binding gem RMagick.
# robot@ev3dev:~$ sudo apt-get update
# robot@ev3dev:~$ sudo apt-get install ruby-rmagick
# (or ~$ sudo gem install rmagick -N -V)

module Ev3dev
  class Image
    def initialize(*args)
      require 'RMagick'

      case args.size
      when 0
        @image = Magick::Image.new(192, 128){ self.format = 'mono'}
      when 1
        image_file = args.first

        if image_file.end_with?('.mono')
          @image = Magick::Image.read(image_file){ self.size = "192x128" }.first
        else
          @image = Magick::Image.read(image_file).first
          @image.format = 'mono'
          @image.resize_to_fill!(192, 128)
        end
      else
        raise "ArgumentError: wrong number of arguments 0 or 1"
      end
    end

    # resize EV3 Screen(192 x 128) and .mono image format
    # output file name should be '.mono'
    def save(output_file)
      @image.write(output_file)
      @image.destroy!
    end

    def text(x, y, size, string)
      draw = Magick::Draw.new
      draw.annotate(@image, 0, 0, x, y, string){self.pointsize = size}
    end
  end
end
