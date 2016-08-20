#!/usr/bin/python
import argparse
import sys
import subprocess
import os
from ConfigParser import ConfigParser

subprocess.Popen("source sample.sh", shell=True, executable='/bin/bash')
