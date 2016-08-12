#!/usr/bin/python
import sys
from ConfigParser import ConfigParser

_defaultConfigFile="mssql.conf"

#Get the command line parameters
if len(sys.argv) == 2:
	_defaultConfigFile=sys.argv[1]
elif len(sys.argv) > 2:
	print("Usage: mssql-conf.py <fileName>\n<fileName> (optional) is the path to the config file, if not specified the default path is used")
	sys.exit()

# instantiate
config = ConfigParser()

# parse existing file
config.read(_defaultConfigFile)

# read values from a section
logdir = config.get('Database_Configuration', 'SQL_TEMPDB_LOG_DIR')
logFileGrowth = config.getint('Database_Configuration', 'SQL_TEMPDB_LOG_FILE_GROWTH')
ssrs = config.getboolean('Service_Configuration', 'SSRS')
certificateFileLocation = config.get('Security_Configuration', 'SSL_CERTIFICATE_FILE_LOCATION')

print(logdir)
print(logFileGrowth)
print(ssrs)
print(certificateFileLocation)
