require 'logger'

module UnitF
  module Logging
    class Writer < ::Logger
      def initialize(file, max_files = 3, max_size = 1024000)
        super(file, max_files, max_size)
      end
    end
  end
end

module UnitF
  module Logging
    class ConsoleWriter < UnitF::Logging::Writer
      def initialize
        super($stdout)
      end
    end
  end
end

module UnitF
  module Logging
    class FileWriter < UnitF::Logging::Writer
      def initialize(file, max_files = 3, max_size = 1024000)
        super(file, max_files, max_size)
      end
    end
  end
end
