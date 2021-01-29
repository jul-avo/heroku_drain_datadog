# frozen_string_literal: true

module HerokuDrainDatadog
  class Service
    class Tag
      attr_reader :heroku_name, :datadog_name, :type

      def initialize(heroku_name:, datadog_name:, type:)
        @heroku_name = heroku_name
        @datadog_name = datadog_name
        @type = type
      end

      def coerce(value:)
        case type
        when :string
          value.to_s.tr("\"", "")
        when :Source2DynoType
          value.split(".").first
        when :string_array_first
          value.first
        end
      end
    end
  end
end
