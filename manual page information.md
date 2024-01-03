.\" Manpage for internsctl
.TH INTERNSCTL 1 "December 2023" "Version 0.1.0" "Internsctl Manual"

.SH NAME
internsctl \- a versatile command-line tool for system administration

.SH SYNOPSIS
internsctl [options] [command] [arguments]

.SH DESCRIPTION
Internsctl is a command-line utility designed for system administration tasks. It provides various functionalities, including CPU and memory information, file operations, user management, and more.

.SH OPTIONS
The following options are available:

--version, -v      Display the current version of internsctl.
--help, -h         Show usage guidelines and command options.

.SH COMMANDS
The following commands are supported:
- cpu getinfo      Display CPU information.
- memory getinfo   Display memory information.
- user create      Create a new user on the system.
- user list        List regular users or those with sudo permissions.
- file getinfo <file-name>  You'll get information about the provided file
- file getinfo [option] <file-name> It'll provide the specific information about the file

.SH SEE ALSO
ls, lscpu, free, adduser, getent

.SH AUTHOR
Abhinav Tomar <abhinavtomar7906@gmail.com>

.SH BUGS
No known bugs.

.SH COPYRIGHT
This program comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it under the terms of the GNU General Public License.

.\" End of manpage
