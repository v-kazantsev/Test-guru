module Placeholder
  extend ActiveSupport::Concern
    def self.image_generator(height:, width:)
      "http://via.placeholder.com/#{width}x#{height}"
    end
end
