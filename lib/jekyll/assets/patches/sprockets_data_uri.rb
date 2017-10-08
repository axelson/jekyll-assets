# Frozen-string-literal: true
# Copyright: 2012 - 2017 - MIT License
# Encoding: utf-8

module Jekyll
  module Assets
    module Patches
      module SprocketsDataURI

        # --
        # @note this could be removed.
        # data_uri allows you to extract the data URI.
        # @return [String]
        # --
        def data_uri
          "data:#{content_type};base64,#{Rack::Utils.escape(
            Base64.encode64(to_s))}"
        end
      end
    end
  end
end

# --
module Sprockets
  class Asset
    prepend Jekyll::Assets::Patches::SprocketsDataURI
  end
end