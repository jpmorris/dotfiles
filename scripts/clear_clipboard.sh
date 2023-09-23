# if copyq is installed
copyq 'tab(config("clipboard_tab")); var xs = Array.apply(0, Array(size())).map(function(x,i){return i}); remove.apply(this, xs);'
# different clipboards
xclip -sel pri < /dev/null
xclip -sel sec < /dev/null
xclip -sel clip < /dev/null
