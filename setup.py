#!/usr/bin/python

import subprocess

# Function will process command
def process(comm):
	process = subprocess.Popen(comm.split(), stdout=subprocess.PIPE)
	output, error = process.communicate()

# Get Script
URL = "https://github.com/Errandur/dotfiles/raw/beta/setup.sh"
command = 'wget ' + URL + ' -O setup-test.sh'
process(command)

# Process script
command = 'sudo bash setup-test.sh'
process(command)
