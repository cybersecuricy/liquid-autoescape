require "solid"

module Solid
  module Autoescape

    # Solid filters used to support the {% autoescape %} tag
    module Filters

      # Flag an input as exempt from auto-escaping
      #
      # This is a non-transformative filter that works by registering itself
      # in a variable's filter chain.  If a variable detects this in its
      # filters, no escaping will be performed on it.
      #
      # @param [String] input A variable's content
      # @return [String] The unmodified content
      def skip_escape(input)
        input
      end

    end

    Template.register_filter(Filters)

  end
end
