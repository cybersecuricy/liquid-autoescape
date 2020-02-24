require "solid/autoescape/core_exemptions"
require "solid/autoescape/exemption_list"

module Solid
  module Autoescape

    # A configuration file for setting auto-escape options
    class Configuration

      # @return [Solid::Autoescape::ExemptionList] The list of custom exemptions
      attr_reader :exemptions

      # @return [Boolean] Whether global mode is enabled
      attr_writer :global

      # @return [Array<Symbol>] The list of trusted filter names
      attr_accessor :trusted_filters

      # Create a new configuration object with default values
      def initialize
        reset
      end

      # Reset the configuration's values to their defaults
      def reset
        @exemptions = ExemptionList.from_module(CoreExemptions)
        @global = false
        @trusted_filters = []
      end

      # Whether global mode is enabled
      #
      # @return [Boolean]
      def global?
        @global
      end

    end

  end
end
