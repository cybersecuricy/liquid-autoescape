require "solid"
require "solid/autoescape/solid_ext/variable"

module Solid
  module Autoescape
    module Tags

      # A block tag that automatically escapes all variables contained within it
      #
      # All contained variables will have dangerous HTML characters escaped.
      # Any variables that should be exempt from escaping should have the
      # +skip_escape+ filter applied to them.
      #
      # @example Default usage
      #   {% assign untrusted = "<script>window.reload();</script>" %}
      #   {% assign trusted = "<strong>Text</strong>" %}
      #
      #   {% autoescape %}
      #     {{ untrusted }}
      #     {{ trusted | skip_escape }}
      #   {% endautoescape %}
      #
      # @example Controlling whether escaping is applied
      #   {% assign value = "&" %}
      #
      #   <!-- Renders "&amp;" -->
      #   {% autoescape true %}{{ value }}{% endautoescape %}
      #
      #   <!-- Renders "&" -->
      #   {% autoescape false %}{{ value }}{% endautoescape %}
      class Autoescape < Block

        SYNTAX = /^(#{QuotedFragment})?\s+?$/.freeze
        private_constant :SYNTAX

        def initialize(tag_name, markup, tokens)
          super

          if markup =~ SYNTAX
            @autoescape_flag = $1
          elsif !markup.empty?
            raise SyntaxError, "Syntax Error in 'autoescape' - Valid syntax: {% autoescape [true|false] %}"
          end
        end

        def render(context)
          context.stack do
            context[ENABLED_FLAG] = @autoescape_flag ? context[@autoescape_flag] : true
            super
          end
        end

      end

      Template.register_tag("autoescape", Autoescape)

    end
  end
end
