require 'mini_magick'
require 'fileutils'

zoom_levels = %i[256 512 1024 2048 4096]
asset_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'assets/map'))
input_file = File.join(asset_dir, 'world.jpeg')

zoom_levels.each_with_index do |size, zoom_level|
  tile_dir = File.join(asset_dir, 'tiles')
  FileUtils.mkdir_p(tile_dir) unless File.directory?(tile_dir)
  zoom_dir = File.join(tile_dir, zoom_level.to_s)
  FileUtils.mkdir_p(zoom_dir) unless File.directory?(zoom_dir)

  resize_setting = format('%<size>sx%<size>s', size: size)
  crop_setting = format('%<size>sx%<size>s', size: 256)
  convert = MiniMagick::Tool::Convert.new
  convert << input_file
  convert.resize(resize_setting)
  convert.repage.+
  convert.crop(crop_setting)
  convert.set('filename:tile')
  convert.merge! ["#{zoom_dir}/%[fx:page.x/256]-%[fx:page.y/256]"]
  convert << '%[filename:tile].jpeg'
  convert.call
end

