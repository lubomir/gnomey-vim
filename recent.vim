" This function adds current file to the recents
function! AddToRecentFiles()
    if exists("g:disablerecent") && g:disablerecent == 1
        return
    endif
    python <<EOF
import gtk, vim
uri = u'file://' + vim.eval("expand(\"%:p\")")
m = gtk.recent_manager_get_default()
m.add_item(uri)
while gtk.events_pending():
    gtk.main_iteration()
gtk.main_iteration()
EOF
endfunction

" After saving a file, add it to recent documents
autocmd BufWritePost * :call AddToRecentFiles()
