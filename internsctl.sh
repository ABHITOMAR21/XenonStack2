#!/bin/bash

function internsctl() {
  if [ "$1" == "--version" ]; then
    echo "internsctl v0.1.0"
    exit 0
  elif [ "$1" == "--help" ]; then
    echo "Usage: internsctl [OPTIONS]"
    echo "Description: Your command description"
    echo ""
    echo "Options:"
    echo "--version             Show the current version of internsctl"
    echo "--help                Show this help message"
    echo ""
    echo "CPU Options:"
    echo "cpu getinfo           Show CPU information"
    echo ""
    echo "Memory Options:"
    echo "memory getinfo        Show memory information"
    echo ""
    echo "User Options:"
    echo "user create <username> Create a new user"
    echo "user list              List all users"
    echo "user list --sudo-only  List users with sudo permissions"
    echo ""
    echo "File Options:"
    echo "file getinfo [OPTIONS] <file-name> Get information about a file"
    echo "File getinfo Options:"
        echo "file getinfo [OPTIONS] <file-name> Get information about a file"
    echo "File getinfo Options:"
    echo "--size, -s            Print size"
    echo "--permissions, -p     Print file permissions"
    echo "--owner, -o           Print file owner"
    echo "--last-modified, -m   Print last modified date"
    exit 0
  elif [ "$1" == "cpu" ] && [ "$2" == "getinfo" ]; then
    lscpu
    exit 0
  elif [ "$1" == "memory" ] && [ "$2" == "getinfo" ]; then
    free
    exit 0
  elif [ "$1" == "user" ]; then
    if [ "$2" == "create" ]; then
      if [ -z "$3" ]; then
        echo "Please provide a username to create."
        exit 1
      fi
      sudo adduser "$3"
      exit 0
    elif [ "$2" == "list" ]; then
      if [ "$3" == "--sudo-only" ]; then
        getent group sudo | cut -d: -f4 | tr ',' '\n'
        exit 0
      else
        getent passwd | cut -d: -f1
        exit 0
              getent passwd | cut -d: -f1
        exit 0
      fi
    fi
  elif [ "$1" == "file" ] && [ "$2" == "getinfo" ]; then
   filename=""
   option=""

   if [ -z "$3" ]; then
    echo "Please provide a filename."
    exit 1
   elif [ -z "$4" ]; then
    filename="$3"
   else
    filename="$4"
    option="$3"
   fi

   if [ "$option" == "--size" ] || [ "$option" == "-s" ]; then
    stat --format=%s "$filename"
   elif [ "$option" == "--permissions" ] || [ "$option" == "-p" ]; then
    stat --format=%A "$filename"
   elif [ "$option" == "--owner" ] || [ "$option" == "-o" ]; then
    stat --format=%U "$filename"
   elif [ "$option" == "--last-modified" ] || [ "$option" == "-m" ]; then
    stat --format=%y "$filename"
   elif [ -z "$option" ]; then
    # Check if the filename is given without options
    echo -e "File: $filename\nAccess: $(stat --format=%A "$filename")\nSize(B): $(stat --format=%s "$filename")\nOwner: $(stat --for>   else
    echo "Invalid option. Use '--help' for usage."
    exit 1
   fi
   exit 0
  fi


  # Your command logic goes here
  # ...
}

internsctl "$@"