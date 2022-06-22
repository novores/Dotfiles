config.load_autoconfig()

# source
config.source('gruvbox.py')

# key binding
config.bind('<Alt-Shift-u>', 'spawn --userscript qute-keepassxc --key EC0229C8', mode='insert')
config.bind('pw', 'spawn --userscript qute-keepassxc --key EC0229C8', mode='normal')
