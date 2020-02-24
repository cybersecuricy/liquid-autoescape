require "solid/autoescape/errors"
require "solid/autoescape/exemption"
require "solid/autoescape/template_variable"

module Solid
  module Autoescape
    describe Exemption do

      it "requires a callable filter block" do
        expect { Exemption.new }.to raise_error(ExemptionError)
        expect { Exemption.new { true } }.to_not raise_error
      end

      describe "#applies?" do

        it "evaluates the filter block in the context of variable data" do
          exemption = Exemption.new { |variable| variable.name == "one" }
          var_one = TemplateVariable.new(:name => "one")
          var_two = TemplateVariable.new(:name => "two")

          expect(exemption.applies?(var_one)).to be(true)
          expect(exemption.applies?(var_two)).to be(false)
        end

      end

    end
  end
end
