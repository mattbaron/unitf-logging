# frozen_string_literal: true

require_relative "logging/version"
require_relative "logging/logger"
require_relative "logging/writer"
require_relative "log"

module UnitF
  module Logging
    class << self
      def encode_level(level)
        return level if level.is_a?(Integer)

        const_get(level.to_s.upcase)
      end
    end

    class Error < StandardError; end
  end
end
