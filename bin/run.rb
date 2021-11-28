require 'unitf/logging'

UnitF::Log.to_console
UnitF::Log.to_file('/tmp/blah.log', 3, 3939)

UnitF::Log.info("This is info 1")
UnitF::Log.logger.level ='INFO'
UnitF::Log.info("This is info 2")
UnitF::Log.error("This is infor 3")

