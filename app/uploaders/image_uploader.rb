require "image_processing/vips"

class ImageUploader < BaseUploader
  def allowed_types
    @allowed_types ||= %w[image/jpeg image/jpg image/png image/svg+xml image/gif].freeze
  end

  plugin :derivation_endpoint, prefix: "derivations/images"
  plugin :add_metadata
  plugin :image_handling_utilities

  DERIVATIVES = {
    sm: { size: [300, 300], resize_method: 'resize_to_fill!', type: 'jpg' },
    sm_webp: { size: [300, 300], resize_method: 'resize_to_fill!', type: 'webp' }
  }

  Attacher.derivatives do |original|
    vips = ImageProcessing::Vips.source(original)

    DERIVATIVES.reduce({}) do |derivatives_hash, (name, derivative_info)|
      derivatives_hash[name] = vips.convert(derivative_info[:type]).resize_to_limit!(
        *derivative_info[:size]
      )
      derivatives_hash
    end
  end

  derivation :thumbnail do |file, width, height|
    ImageProcessing::Vips
      .source(file)
      .resize_to_limit!(width.to_i, height.to_i)
  end

  Attacher.default_url do |derivative: nil, **|
    file&.derivation_url(:thumbnail, *DERIVATIVES.dig(derivative, :size)) if derivative.present?
  end

  add_metadata :blurhash do |io, derivative: nil, **|
    if derivative.nil?
      Shrine.with_file(io) do |file|
        image = Vips::Image.new_from_file(file.path, access: :sequential)
        image = image.resize(100.0 / image.width)
        flat_rgb_pixels = []
        image.to_a.each do |row|
          row.each { |pixel| flat_rgb_pixels.concat(pixel[0..2])  }
        end

        Blurhash.encode(image.width, image.height, flat_rgb_pixels)
      end
    end
  end
end
