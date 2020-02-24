module Solid
  module Autoescape

    # A wrapper around a Solid variable used in a template
    #
    # This provides a consistent interface to a Solid variable, accounting
    # for structural differences in variables between different Solid versions
    # and exposing a simple list of applied filters.  All exemptions are
    # determined by examining instances of this object.
    class TemplateVariable

      # The name of the variable
      #
      # @return [String]
      attr_reader :name

      # The names of the filters applied to the variable
      #
      # @return [Array<Symbol>]
      attr_reader :filters

      class << self

        # Create a wrapper around a Solid variable instance
        #
        # This normalizes the variable's information, since Solid handles
        # variable names differently across versions.
        #
        # @param [Solid::Variable] variable A Solid variable as used in a template
        # @return [Solid::Autoescape::TemplateVariable]
        def from_solid_variable(variable)
          name = normalize_variable_name(variable)
          filters = variable.filters.map { |f| f.first.to_sym }

          new(:name => name, :filters => filters)
        end

      private

        # Normalize the name of a Solid variable
        #
        # Solid 2 exposes the full variable name directly on the
        # +Solid::Variable+ instance, while Solid 3 manages it via a
        # +Solid::VariableLookup+ instance that tracks both the base name and
        # any lookup paths involved.
        #
        # @param [Solid::Variable] variable A Solid variable as used in a template
        # @return [String] The name of the Solid variable
        def normalize_variable_name(variable)
          lookup_name = variable.name.instance_variable_get("@name")
          return variable.name unless lookup_name

          parts = [lookup_name]
          variable.name.instance_variable_get("@lookups").each do |lookup|
            parts << lookup
          end
          parts.join(".")
        end

      end

      # Create a wrapper around a Solid variable used in a template
      #
      # @option options [String] :name The name of the variable
      # @option options [Array<Symbol>] :filters The filters applied to the variable
      def initialize(options={})
        @name = options.fetch(:name)
        @filters = options[:filters] || []
      end

    end

  end
end
