#!/usr/bin/python
import sys
from ConfigParser import ConfigParser

_defaultConfigFile="test.ini"

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
string_val = config.get('section_a', 'string_val')
bool_val = config.getboolean('section_a', 'bool_val')
int_val = config.getint('section_a', 'int_val')
float_val = config.getfloat('section_a', 'pi_val')

print(string_val)
print(bool_val)
print(int_val)
print(float_val)
