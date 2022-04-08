#!/usr/bin/env bash
echo ""
echo "find scripting"
echo ""
read -p 'where(path directory) :' dir
read -p 'directory or file(f/d) :' type
[[ $dir -ne {f,d} ]]; echo "false command!"
read -p 'query :' name
echo ""
echo "searching file..."

find $dir -type $type -name $name
