config.load_autoconfig()

# source
config.source('gruvbox.py')

# key binding
config.bind('<Alt-Shift-u>', 'spawn --userscript qute-keepassxc --key E2AEE89D', mode='insert')
config.bind('pw', 'spawn --userscript qute-keepassxc --key E2AEE89D', mode='normal')
config.bind('pt', 'spawn --userscript qute-keepassxc --key E2AEE89D --totp', mode='normal')
