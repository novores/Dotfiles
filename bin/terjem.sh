#!/bin/sh
x=$(trans ":$1" -b "$2")
dunstify "Translate Result" "$x"
