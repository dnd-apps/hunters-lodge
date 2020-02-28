require 'grape'
require 'mini_magick'
require 'fileutils'


module HuntersLodge
    class Images < Grape::API
      version 'v1', using: :header, vendor: 'hunters-lodge'
      format :binary
      prefix 'api/images'

      before do
        header 'Access-Control-Allow-Origin', '*'
        header 'Access-Control-Allow-Methods', %w[OPTIONS POST GET]
      end

      params do
        requires :image_file, type: File
        requires :zoom, type: Integer
        requires :size, type: Integer
      end
      post :upload do
        puts params[:image_file][:filename]
        puts params[:image_file][:type]
        image_path = params[:image_file][:tempfile].to_path
        dir = Dir.mktmpdir
        puts image_path, dir

        resize_setting = format('%<size>sx%<size>s', size: param[:size])
        crop_setting = format('%<size>sx%<size>s', size: 256)
        MiniMagick::Tool::Convert.new do |convert|
          convert << image_path
          convert.resize(resize_setting)
          convert.repage.+
          convert.crop(crop_setting)
          convert.set('filename:tile')
          convert.merge! [File.join(dir, param[:zoom].to_s) + "-%[fx:page.x/256]-%[fx:page.y/256]"]
          convert << '%[filename:tile].jpeg'
        end

        derpy_dir =  'C:\\Users\\micha\\develop\\hunters_lodge_website\\tmp'

        Dir.entries(dir).each do |filename|
          puts filename
          next unless filename.include?('.jpeg')
          jpeg_path = File.join(dir, File.basename(filename))

          FileUtils.cp(jpeg_path, File.join(derpy_dir, File.basename(filename)))
        end

        'success'
      end
  end
end

