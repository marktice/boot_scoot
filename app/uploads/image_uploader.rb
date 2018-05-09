require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :processing
  plugin :versions
  plugin :delete_raw # delete processed files after uploading

  process(:store) do |io, context|
    original = io.download
    pipeline = ImageProcessing::MiniMagick.source(original)

    size_160 = pipeline.resize_to_limit!(160, 160)
    size_300 = pipeline.resize_to_limit!(300, 300)

    original.close!

    { original: io, thumb: size_160, medium: size_300 }
  end
end