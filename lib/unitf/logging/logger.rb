require 'logger'

module UnitF
  module Logging

    DEBUG = ::Logger::Severity::DEBUG
    INFO = ::Logger::Severity::INFO
    WARN = ::Logger::Severity::WARN
    ERROR = ::Logger::Severity::ERROR
    FATAL = ::Logger::Severity::FATAL

    class Logger
      def initialize(level = INFO)
        @writers = []
        @level = ENV['UNITF_LOG_LEVEL'] || level
      end

      def add_writer(writer)
        @writers << writer
        writer.level = @level
      end

      def debug(message)
        write(DEBUG, message)
      end

      def info(message)
        write(INFO, message)
      end

      def warn(message)
        write(WARN, message)
      end

      def error(message)
        write(ERROR, message)
      end

      def fatal(message)
        write(FATAL, message)
      end

      def level=(level)
        level = UnitF::Logging.const_get(level.upcase) if level.is_a?(String)
        @level = level
        @writers.each do |writer|
          writer.level = level
        end
      end

      def write(severity, message)
        @writers.each do |writer|
          writer.log(severity, message)
        end
      end
    end
  end
end