class ImageUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick

  storage :fog

  def extension_white_list
    %w(jpg jpeg png)
  end

  process :resize_to_fit => [700, 700]

  version :padded do
  	process :resize_and_pad => [500,400, background="#FFFFFF"]
  end

  version :medium do
    process :resize_to_fill => [200,200]
  end

end