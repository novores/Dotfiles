config.load_autoconfig()

# source
config.source('gruvbox.py')

# key binding
config.bind('<Alt-Shift-u>', 'spawn --userscript qute-keepassxc --key 4C40A8C5', mode='insert')
config.bind('pw', 'spawn --userscript qute-keepassxc --key 4C40A8C5', mode='normal')
config.bind('pt', 'spawn --userscript qute-keepassxc --key 4C40A8C5 --totp', mode='normal')

config.bind(';t', 'hint userscript link translate')
config.bind(';T', 'hint userscript all translate --text')
config.bind('<Ctrl+T>', 'spawn --userscript translate')
config.bind('<Ctrl+Shift+T>', 'spawn --userscript translate --text')
config.bind('K', 'tab-next')
config.bind('J', 'tab-prev')
