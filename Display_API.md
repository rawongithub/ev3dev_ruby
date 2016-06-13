# EV3 Display (LCD)

## Display Specifications
* Mode  : 178 x 128 pixel  
* LineLength  : 24 bytes (192 bits)  
* Geometry  : 1 (1 bit per pixel)  
* Type  : PACKED PIXELS  
* Visual  : MONO01 (0: white, 1: black)  
* Frame Buffer directory  : /dev/fb0  
* Frame Buffer size     : 24 * 128 = 3072 bytes  
* 178 bits in a line (192 bits) and 128 rows are actually displayed

## Image File Format
Image file must be 192 x 128 pixel .mono format  
(raw bi-level bitmap in least-significant-byte(LSB) first order)

### .mono format
see [ImageMagick: Supported Image Formats](http://www.imagemagick.org/script/formats.php)

## Ev3dev::Screen Class
Screen Class only supports the 192 x 128 pixel .mono image file format

- \#initialize

 creates an accessible instance variable @imgs (blank array)

- \#load(image_file)

 loads image file and adds to the array @imgs  
 (file should be the 192 x 128 pixel .mono format)

- \#load_blank

 adds blank image (white image) to the array @imgs

- \#show

 shows the @imgs[0] image to the EV3 LCD display and shifts the array @imgs (if @imgs.size >= 2)

- \#show_blank

 displays the blank image (white image) and the array @imgs is unchanged


## Ev3dev::Image Class
Image Class converts various size and format image files to the EV3 display format (192 x 128 pixel .mono format).  
And it can also create text images.

It requires [RMagick](https://github.com/rmagick/rmagick) gem ([ImageMagick](http://www.imagemagick.org/) Ruby binding).  
To install [RMagick](https://github.com/rmagick/rmagick):
```
robot@ev3dev:~$ sudo apt-get update
robot@ev3dev:~$ sudo apt-get install ruby-rmagick
(or ~$ sudo gem install rmagick -N -V)
```


- \#initialize(image_file)

 loads image file and converts the EV3 display format (192 x 128 pixel .mono format), or creates a blank image (if no arguments)

- \#save(output_file)

 saves the image_file (output file name should be '.mono')


- \#text(x, y, size, string)

 creates a text image
 - x; x position of text
 - y; y position of text
 - size; font size
 - string; text string


## How to create the EV3 display format (192 x 128 pixel .mono format) file on PC

### ImageMagick
1. Install ImageMagick

 see [ImageMagick site](http://www.imagemagick.org/)

2. Terminal command
```
$ convert -resize 192x128! original_file.jpg converted_file.mono
#converted_file_name must have .mono
```


-  Display the .mono file on PC  
it requires X Window System (or [XQuartz](https://www.xquartz.org) for Mac)
```
$ display -size 192x128 converted_file.mono
```

### RMagick (ImageMagick Ruby binding)

1. Install ImageMagick and RMagick

 see [ImageMagick site](http://www.imagemagick.org/) and [RMagick site](https://github.com/rmagick/rmagick)

2. Ruby Program
```ruby
require 'RMagick'
target_image =  Magick::Image.read('original_file.jpg').first
target_image.resize_to_fill!(192, 128)
target_image.write('converted_file.mono') #converted_file_name must have .mono
target_image.destroy!
```


-  Display the .mono file on PC  
it requires X Window System (or [XQuartz](https://www.xquartz.org) for Mac)
```ruby
require 'RMagick'
mono_image = Magick::Image.read('converted_file.mono') { self.size = "192x128" }.first
mono_image.display
```

## More Info

 - Also checkout examples

 - [Using the EV3 LCD - ev3dev.org ](http://www.ev3dev.org/docs/tutorials/using-ev3-lcd/)
