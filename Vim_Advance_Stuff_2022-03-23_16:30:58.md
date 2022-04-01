# Change sentence and put you in insert mode

c)

# Delete chanracter before cursor
X

# Delete current and previous line
d-

# CTRL-W is super useful

* CTRL-W o --> kill the other buffer after saving it

* CTRL-W x  --> Exchange Buffer position

* CTRL-W | --> Make One particular buffer big

* CTRL-W = --> Make all the buffer EQUAL size



# Searching from the command line

* CTRL+g and CTRL+t to go through every match without leaving COMMAND-LINE mode.

# Copying from buffer to the command line

* CTRL+r CTRL+f - Copy the filename under the buffer’s cursor.

* CTRL+r CTRL+w - Copy the word under the buffer’s cursor.

* CTRL+r CTRL+a - Copy the WORD under the buffer’s cursor.

* CTRL+r CTRL+l - Copy the line under the buffer’s cursor.

# Fill in quickfix window
* :cex [] - Empty the current quickfix list.

* :cex system("<cmd>") - Populate your quickfix list with any shell command

# How to evaluate vim script expression or shell command output from insert mode

* C-r = put you to command mode then you need to pass what you want to evaluate and the resulting content gets pasted on the buffer.

# Inserting and Deleting

* - CTRL+a - Insert the last content inserted.

* - CTRL+@ - Insert the last content inserted and quit INSERT mode.

* - CTRL+h - Delete the character before the cursor.

* - CTRL+w - Delete the word under the cursor.

* - CTRL+u - Delete everything before the cursor.

* - CTRL+t - Add one indentation.

* - CTRL+d - Delete one indentation.

# Completion in Insert mode

** _Vim needs to be compiled with the +insert_expand feature for these keystrokes to work._

* CTRL+x CTRL+y - Scroll up

* CTRL+x CTRL+e - Scroll down

* CTRL+x CTRL-l - Complete a whole line from the content of one of your buffer.

* CTRL+x CTRL-f - Complete the filepath under the cursor. It expands environment variables if it contains a filepath too.

* CTRL+x s - Complete with spelling suggestions.

* CTRL+x CTRL+v - Complete with the command line history.

* CTRL+x CTRL+i - Complete with the keywords in the current and included files. These files are in the option path.

 # Restrict viminfo information in viminfo file
*  :set viminfo=!,'100,<50,s100.
* that means , set the global variable max 100 files ,a maximum of 50 lines per register and 100kib for for each item.
* :oldfiles or :ol - Display all marked files stored in the viminfo file.
* :rviminfo or :rv - Read the viminfo file.
* :wviminfo or :wv - Write the viminfo file.

# Diagraph

- CTRL+K ->: →
- CTRL+K TM: ™
- CTRL+K Co: ©
- CTRL+K Rg: ®
- CTRL+K Eu: €
- CTRL+K +-: ±

# Checking existing functions

* :function or :fu - List all declared function.
* function - Keyword to declare a function. You can add a bang (function!) to overwrite a previously declared function with the same name.

# You can also use these useful keystrokes in NORMAL mode:

* & - Repeat the last substitute, without its range and its flags.
* g& - Repeat the last substitute with the same flags but without the same range (it’s global), and replace its pattern with the last search pattern.

# Vim Special strings
* % - Relative path of the current file.

* <cword> - Word under the cursor.

* <cWORD> - WORD under the cursor.

* <cfile> - Filepath under the cursor.

* <afile> - File open in the buffer when executing autocommands.

* <sfile> - Filename of sourced file when used with command :source.

**You can also use the following with %:

* :p - Output the absolute path instead of the relative one. Also expand the tilda ~ to the home directory.
* :. - Make the file path relative to the working directory.
* :~ - Make the file path relative to the home directory (if possible).
* :h - Keep the head of the file path (remove the last element).
* :t - Keep the tail of the file path (remove everything except the last element).
* :r - Keep the root of the file name (remove its extension).
* :e - Remove everything except the extension of the filename.
* :s?pat?sub? - Substitute the first occurrence of “pat” with “sub”.
* :gs?pat?sub? - Substitute all occurrences of “pat” with “sub”.

expand(<special_string>) to expand these placeholders

:echom expand("%")
:echom expand("%:p")
:echom expand("<cword>")

# Important options
* NORC - Don’t load any vimrc but load your plugins.

* NONE - Don’t load any vimrc nor plugins.

# Special arguments

* <silent> - Doesn’t output the mapping in the Vim command-line. If you want to also drop the output of the command linked to the mapping, add the command :silent.

* <buffer> - The mapping’s scope is reduced to the current buffer only. These mappings have the priority on the global ones.

* <expr> - The mapping executes a Vimscript expression instead of a Vim command.

* <unique> - The mapping fails if it already exists. It’s useful if you don’t want to override any mapping defined previously.

* <Cmd> - The mapping can run a command without quitting the current mode you’re in.

# Difference between localist window and quickfix

 * Local list is local and that means you can have local window per buffer

 * quickfix window is global, that means you can only have one quickfix window for entire session

 *  A location list is similar to a quickfix list, except that the first is local to a window and the second is global to your Vim instance. In other words, you can have multiple location lists available at the same time (one per window open), but you can only have access to one quickfix list

# Typers of Registers

* The unnamed register (") - Contain the last deleted, changed, or yanked content, even if one register was specified.
* The numbered registers (from 0 to 9)
* 0 contains the content of the last yank.
* 1 to 9 is a stack containing the content you’ve deleted or changed.
* Each time you delete or change some content, it will be added to the register 1.
* The previous content of the register 1 will be assigned to register 2, the previoius content of 2 to 3…
* When something is added to the register 1, the content of the register 9 is lost.
* None of these registers are written if you’ve specified one before with the keystroke ".
* The small delete register (-) Contains any deleted or changed content smaller than one line.

* nt’s not written if you specified a register with ".
* The named registers (range from a to z)
* nim will never write to them if you don’t specify them with the keystroke ".
* You can use the uppercase name of each register to append to it (instead of overwriting it).
* The read only registers (., % and :)
* . contains the last inserted text.
* % contains the name of the current file.
* : contains the most recent command line executed.
* The alternate buffer register (#) - Contain the alternate buffer for the current window.
* The expression register (=) - Store the result of an expression. More about this register below.
* The selection registers (+ and *)
* + is synchronized with the system clipboard.
* * is synchronized with the selection clipboard (only on *nix systems).
* The black hole register (_) - Everything written in there will disappear forever.
* The last search pattern register (/) - This register contains your last search.
* CTRL+R % in INSERT mode, you’ll put the content of the register % in your current buffer.

# Pattern replacement

* :s/pattern/replacement/ - Substitute the first occurrence of pattern on the current line with replacement.
* :s#pattern#replacement# - Equivalent substitution to the one just above. Handy if you have some URLs in your pattern or your replacement.
* :s/pattern/ - delete the first occurrence of pattern on the current line.
* :s/pattern/replacement/g - Substitute every occurrence of pattern on the current line.
* You can also add a range as prefix and a count as suffix:

* :%s/pattern/replacement/ - Substitute every first occurrence of pattern on each line of the current buffer.
* :%s/pattern/replacement/g - Substitute every occurrence of pattern on each line of the current buffer.
* :1,10s/pattern/replacement/ - Substitute every first occurrence of pattern on the first ten lines of the current buffer.
* :s/pattern/replacement/ 10 - Substitute every first occurrence of pattern for the current line and the 10 next lines.
* :1,10s/pattern/replacement/ 5 - Substitute every first occurrence of pattern on the first ten lines and on the five lines below the last line of the range.
* :s g 10 - Repeat the last substitution without its flag, and add a new flag g. It will affect the 10 lines after the last line of the last substitute command.
* :&& - Repeat the last substitute with its flags.
* :~ - Repeat the last substitute command with the same replacement, but with the last used search pattern.

# Redirections

* :redir > <file> - Write every command’s output to the file <file>.
* Use :redir! (with a bang !) to overwrite the file.
* Use >> instead of > to append to the file.
* :redir @<reg> - Write every command’s output to the register <reg>.
* :redir @<reg>>> - Append every command’s output to the register <reg>.
* :redir => <var> - Write every command’s output to the variable <var>.
* :redir END - End the redirection.
* :redir @A  --> Appending

# Filtering

* :filter /content/ buffers - Only output the buffers with part of the filepath matching content.
* :filter /archives/ oldfiles - Only output the marked files with part of the filepath matching archives.


# Vim Pseudo Variables

 Prefix	           Meaning

* & varname	A Vim option (local option if defined, otherwise global)

* &l: varname	A local Vim option

* &g: varname	A global Vim option

* @ varname	A Vim register

* $ varname	An environment variable

# Vim Variable scope

 Prefix	          Meaning

* g: varname	The variable is global

* s: varname	The variable is local to the current script file

* w: varname	The variable is local to the current editor window

* t: varname	The variable is local to the current editor tab

* b: varname	The variable is local to the current editor buffer

* l: varname	The variable is local to the current function

* a: varname	The variable is a parameter of the current function

* v: varname	The variable is one that Vim predefines
