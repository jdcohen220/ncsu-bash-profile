# Bash profiles for NCSU

This repo contains two bash profiles, one for local use - `.bash_profile` and one for work
on the Common Platform - `.mybashrc`. 

# Local
Functions primarily used to shell into remote systems, and work with SFTP. There is some
common functionality shared with remote i.e. testing functions for making sure that
code developed locally compiles and runs as expected on the remote host.

# Remote
Helpful functions for customizing the remote session on the NCSU cluster. Expedites compilation
and testing of multiple test files for a single program.

# Credentials
Credentials are read in from the same directory (root) as the bash profiles. The program assumes the existence of a `.ncsu-pass` with
a valid password for the system.