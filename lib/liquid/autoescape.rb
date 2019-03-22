require "liquid/autoescape/configuration"
require "liquid/autoescape/filters"
require "liquid/autoescape/tags/autoescape"

module Liquid
  module Autoescape

    # The context variable that stores the auto-escape state
    #
    # @private
    ENABLED_FLAG = "liquid_autoescape_enabled".freeze

    # Configure Liquid auto-escaping
    #
    # @yieldparam [Liquid::Autoescape::Configuration] config The auto-escape configuration
    def self.configure
      yield(configuration)
    end

    # Restore the configuration's default values
    def self.reconfigure
      configuration.reset
    end

    # The current auto-escape configuration
    #
    # @return [Liquid::Autoescape::Configuration]
    def self.configuration
      @configuration ||= Configuration.new
    end

  end
end
