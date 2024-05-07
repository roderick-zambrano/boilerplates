#!/bin/bash

while [[ $# -gt 0 ]]; do
  case "$1" in
    -u|--username)
      shift
      USERNAME="$1"
      ;;
    -p|--password)
      shift
      PASSWORD="$1"
      ;;
    *)
      echo "Usage: $0 [-u|--username <username>] [-p|--password <password>]"
      exit 1
      ;;
  esac
  shift
done

if id "$USERNAME" &>/dev/null; then
  echo "User '$USERNAME' already exists."
  exit 1
fi

useradd -m "$USERNAME"

echo "$USERNAME:$PASSWORD" | chpasswd

if [ $? -eq 0 ]; then
  echo "User '$USERNAME' created."
fi
