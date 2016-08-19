#!/usr/bin/python
import argparse
import sys
import subprocess
from ConfigParser import ConfigParser

var = input("Give me: ")
print var

parser = argparse.ArgumentParser()
subparser=parser.add_subparsers()
parser.add_argument("--init", help="Initialize the conf tool", action="store_true")
parser.add_argument("--apply", help="Applies the current changes", action="store_true")

set_parser=subparser.add_parser("set")
set_parser.add_argument("--sa_password", action="store_true", help="Set the sa-password for SqlServer")
args = parser.parse_args()

print(parser.parse_args())

if args.sa_password:
	print("HELLOOOOO")
