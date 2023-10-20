config.load_autoconfig()

# source

# key binding
# config.bind('<Alt-Shift-u>', 'spawn --userscript qute-keepassxc --key 4C40A8C5', mode='insert')
# config.bind('pw', 'spawn --userscript qute-keepassxc --key 4C40A8C5', mode='normal')
# config.bind('pt', 'spawn --userscript qute-keepassxc --key 4C40A8C5 --totp', mode='normal')

config.bind(';t', 'hint userscript link translate')
config.bind(';T', 'hint userscript all translate --text')
config.bind('<Ctrl+T>', 'spawn --userscript translate')
config.bind('<Ctrl+Shift+T>', 'spawn --userscript translate --text')
config.bind('K', 'tab-next')
config.bind('J', 'tab-prev')
config.bind(',m', "jseval javascript:var win = window; var doc = document; var title = encodeURIComponent(doc.title); var location = encodeURIComponent(doc.location); var left = ((win.screenX || win.screenLeft) + 10); var top = ((win.screenY || win.screenTop) + 10); var endp = 'https://nch.pl/index.php/apps/bookmarks/bookmarklet?output=popup&url=' + location + '&title=' + title; var specs = 'left=' + left + ',top=' + top + ',height=500px,width=550px,resizable=1,alwaysRaised=1'; var command = win.open(endp, 'bkmk_popup', specs); win.setTimeout(function() { command.focus() }, 300);")


config.bind(',D', 'config-cycle colors.webpage.darkmode.enabled ;; restart')
config.bind(',ap', 'config-cycle content.user_stylesheets $HOME/Gitrepos/solarized-everything-css/css/apprentice/apprentice-all-sites.css ""')
config.bind(',dr', 'config-cycle content.user_stylesheets $HOME/Gitrepos/solarized-everything-css/css/darculized/darculized-all-sites.css ""')
config.bind(',gr', 'config-cycle content.user_stylesheets $HOME/Gitrepos/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css ""')
config.bind(',sd', 'config-cycle content.user_stylesheets $HOME/Gitrepos/solarized-everything-css/css/solarized-dark/solarized-dark-all-sites.css ""')
config.bind(',sl', 'config-cycle content.user_stylesheets $HOME/Gitrepos/solarized-everything-css/css/solarized-light/solarized-light-all-sites.css ""')
