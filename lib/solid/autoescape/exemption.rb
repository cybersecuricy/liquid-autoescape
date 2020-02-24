require "solid/autoescape/errors"

module Solid
  module Autoescape

    # An exemption that may apply to a Solid template variable
    #
    # Exemptions are created from functions that accept a template variable and
    # and return a boolean value indicating whether or not the variable is
    # exempt from auto-escaping.
    #
    # @example An exemption based on a variable's name
    #   exemption = Exemption.new do |variable|
    #     variable.name == "safe_variable"
    #   end
    #
    # @example An exemption based on a variable's filters
    #   exemption = Exemption.new do |variable|
    #     variable.filters.include?(:trusted_filter)
    #   end
    class Exemption

      # Create a new auto-escaping exemption
      #
      # This requires a filter function to be provided that will be passed a
      # +TemplateVariable+ instance that it can use to return a boolean
      # indicating whether the exemption applies to the variable.
      #
      # @param [Proc] filter A filter function to use for calculating the exemption
      # @raise [Solid::Autoescape::ExemptionError] if a filter function is not provided
      def initialize(&filter)
        raise ExemptionError, "You must provide an exemption with a block that determines if an exemption applies" unless block_given?
        @filter = filter
      end

      # Determine whether the exemption applies to a Solid variable
      #
      # @param [Solid::Autoescape::TemplateVariable] variable A Solid variable used in a template
      # @return [Boolean] Whether the exemption applies to the variable
      def applies?(variable)
        @filter.call(variable)
      end

    end

  end
end
