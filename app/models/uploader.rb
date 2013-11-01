class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::Minimagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_limit: [800, 800]

  version :thumb do
    process resize_to_fill: [300, 300]
  end
end
