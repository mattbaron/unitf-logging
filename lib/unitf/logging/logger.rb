require 'logger'

module UnitF
  module Logging

    DEBUG = ::Logger::Severity::DEBUG
    INFO = ::Logger::Severity::INFO
    WARN = ::Logger::Severity::WARN
    ERROR = ::Logger::Severity::ERROR
    FATAL = ::Logger::Severity::FATAL

    class Logger
      def initialize
        @writers = []
        self.level = ENV['UNITF_LOG_LEVEL'] || INFO
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

      def level=(new_level)
        new_level = UnitF::Logging.const_get(new_level.upcase) if new_level.is_a?(String)
        @level = new_level
        @writers.each do |writer|
          writer.level = @level
        end
      rescue ArgumentError, NameError
        self.level = INFO
      end

      def console
        @writers.each do |writer|
          return writer if writer.is_a?(UnitF::Logging::ConsoleWriter)
        end
        nil
      end

      def dump
        @writers.each do |writer|
          puts "Name: #{writer.name} Type: #{writer.class}"
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