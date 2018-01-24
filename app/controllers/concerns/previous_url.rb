module PreviousUrl
  extend ActiveSupport::Concern
  included do

    before_action :set_previous_url

    def set_previous_url
      cookies[:previous_url] = request.original_url
    end

    def original_url
      base_url + original_fullpath
    end

  end
end
