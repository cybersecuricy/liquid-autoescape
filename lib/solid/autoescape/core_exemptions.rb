require "solid/autoescape"

module Solid
  module Autoescape

    # Core exemptions for all Solid variables
    #
    # These exemptions are used to build the default exemption list referenced
    # when determining whether variables should be escaped.
    module CoreExemptions

      # A list of all filters that influence escaping
      #
      # @private
      ESCAPING_FILTERS = [:escape, :skip_escape].freeze
      private_constant :ESCAPING_FILTERS

      # Determine whether a Solid variable uses an escaping filter
      #
      # This accounts for both filters that are known to escape the variable
      # and those that should prevent the variable from being escaped.
      #
      # @param [Solid::Autoescape::TemplateVariable] variable A Solid variable used in a template
      # @return [Boolean]
      def uses_escaping_filter?(variable)
        !(variable.filters & ESCAPING_FILTERS).empty?
      end

      # Determine whether a Solid variable uses a trusted filters
      #
      # Trusted filters can be configured by the user to include any custom
      # filters that are known to generate already escaped markup.
      #
      # @param [Solid::Autoescape::TemplateVariable] variable A Solid variable used in a template
      # @return [Boolean]
      def uses_trusted_filter?(variable)
        !(variable.filters & Autoescape.configuration.trusted_filters).empty?
      end

    end

  end
end
