require "solid/autoescape/configuration"
require "solid/autoescape/filters"
require "solid/autoescape/tags/autoescape"

module Solid
  module Autoescape

    # The context variable that stores the auto-escape state
    #
    # @private
    ENABLED_FLAG = "solid_autoescape_enabled".freeze

    # Configure Solid auto-escaping
    #
    # @yieldparam [Solid::Autoescape::Configuration] config The auto-escape configuration
    def self.configure
      yield(configuration)
    end

    # Restore the configuration's default values
    def self.reconfigure
      configuration.reset
    end

    # The current auto-escape configuration
    #
    # @return [Solid::Autoescape::Configuration]
    def self.configuration
      @configuration ||= Configuration.new
    end

  end
end
