#!/usr/bin/env bash

# simple script as a translation tool using translate-shell, I use it on dmenu 

# The GPLv3 License (GPLv3)

# Copyright (c) 2022 Novores(novalhidayat@tuta.io)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

set -e
# if no argument translate clip
if [ -z "$1" ] && [ -z "$2" ]; then  
  x=$(trans -b "$(xsel -ob)") ; sleep 1;  notify-send "Translate Result" "$x"
elif [ -z "$2" ]; then
  x=$(trans -b "$1"); sleep 1; notify-send "Translate Result" "$x"
elif [ -n "$2" ]; then
  x=$(trans ":$1" -b "$2"); sleep 1; notify-send "Translate Result" "$x"
fi
