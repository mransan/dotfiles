Options Postfix
--------------

* `?`: output the value 
* `!`: flip a boolean value 
* `&`: reset to default value

```vim
:set wrap?
:set wrap!
:set wrap& 
```

External Commands 
-----------------

**Execute the current buffer/selection**

```vim
:.w !bash
```

**Pipe external command into the current buffer**

```vim 
:r!cmd 
```

Line Wrapping 
-------------

* **wrap**: enable line wrapping when window size is too small 
* **linebreak**: enable word wrapping rather in the middle of a word 
* **sidescroll**: when wrap is off, this control the side scrolling increment. 
  A value of 1 means that it will scroll at every character increment (ie fast)


Key Mapping
-----------

**Special characters**
* <bs>           Backspace
* <tab>          Tab
* <cr>           Enter
* <enter>        Enter
* <return>       Enter
* <esc>          Escape
* <space>        Space
* <up>           Up arrow
* <down>         Down arrow
* <left>         Left arrow
* <right>        Right arrow
* <f1> - <f12>   Function keys 1 to 12
* #1, #2..#9,#0  Function keys F1 to F9, F10
* <insert>       Insert
* <del>          Delete
* <home>         Home
* <end>          End
* <pageup>       Page-Up
* <pagedown>     Page-Down
* <bar>          the '|' character, which otherwise needs to be escaped '\|'

**Key escaping in string**
* \b	backspace <BS>
* \e	escape <Esc>
* \f	formfeed <FF>
* \n	newline <NL>
* \r	return <CR>
* \t	tab <Tab>
* \\	backslash
* \"	double quote
> additionally see :help expr-quote


**Key Combination**
* <c-{a-z}> : CTRL-{a-z}
* <a-{a-z}> : ALT-{a-z}
* <s-{a-z}> : SHIFT-{a-z}

Navigation
----------

* f{character} : move forward the next instance of character in the same line
* F{character} : move backward the next instance of character in the same line
* t{character} : move forward right before character in the same line
* T{character} : move backward right after character in the same line
* /{text} : forward search
* ?{text} : backward search
