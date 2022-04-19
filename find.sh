#!/usr/bin/env bash
echo ""
echo  -e "\e[33m find scripting"
echo ""
read -p 'where(path directory) : ' dir
read -p 'directory or file(f/d) : ' type
if [[ $type -ne "{f,d}" ]]; then echo "false command!"; fi
read -p 'query :' name
echo ""
echo "searching file..."

find $dir -type $type -name $name
