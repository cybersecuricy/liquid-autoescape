module Solid
  module Autoescape

    # The base error from which all other auto-escape errors inherit
    class AutoescapeError < StandardError; end

    # An error raised when an exemption encounters an issue
    class ExemptionError < AutoescapeError; end

  end
end
