require "solid/autoescape"
require "solid/autoescape/configuration"

module Solid
  describe Autoescape do

    after(:each) { Autoescape.reconfigure }

    describe ".configure" do

      it "allows auto-escape settings to be customized" do
        Autoescape.configure do |config|
          expect(config).to be_an_instance_of(Autoescape::Configuration)
        end
      end

    end

    describe ".reconfigure" do

      it "undoes any user configuration" do
        Autoescape.configure do |config|
          config.trusted_filters << :my_custom_filter
        end

        expect(Autoescape.configuration.trusted_filters).to include(:my_custom_filter)

        Autoescape.reconfigure
        expect(Autoescape.configuration.trusted_filters).to_not include(:my_custom_filter)
      end

    end

    describe ".configuration" do

      it "exposes the current configuration object" do
        Autoescape.configure do |config|
          config.global = true
        end

        config = Autoescape.configuration
        expect(config).to be_an_instance_of(Autoescape::Configuration)
        expect(config.global?).to be(true)
      end

    end

  end
end
