#!/bin/bash
clip_translate(){
  x=$(xsel -ob)
  trans -b "$x"
}

dunstify -t 50000 "Translate Clip" "$(clip_translate)"
