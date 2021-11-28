require 'logger'

module UnitF
  module Logging
    class Writer < ::Logger

      attr_reader :name

      def initialize(file, max_files: 3, max_size: 1024000, name: 'none')
        super(file, max_files, max_size)
        @name = name
      end
    end
  end
end

module UnitF
  module Logging
    class ConsoleWriter < UnitF::Logging::Writer
      def initialize(name: 'console')
        super($stdout, name: name)
      end
    end
  end
end

module UnitF
  module Logging
    class FileWriter < UnitF::Logging::Writer
      def initialize(file, max_files: 3, max_size: 1024000, name: 'none')
        super(file, max_files: max_files, max_size: max_size, name: name)
      end
    end
  end
end
