require 'logger'

module UnitF
  module Log
    class << self
      def logger
        @logger ||= UnitF::Logging::Logger.new
      end

      def to_console
        logger.add_writer(UnitF::Logging::ConsoleWriter.new)
      end

      def to_file(file, max_files = 3, max_size = 1024000)
        logger.add_writer(UnitF::Logging::FileWriter.new(file, max_files: max_files, max_size: max_size))
      rescue Errno::ENOENT => e
        logger.warn("Unble to create FileWriter for #{file}")
      end

      def debug(message)
        logger.debug(message)
      end

      def info(message)
        logger.info(message)
      end

      def warn(message)
        logger.warn(message)
      end

      def error(message)
        logger.error(message)
      end

      def fatal(message)
        logger.fatal(message)
      end
    end
  end
end