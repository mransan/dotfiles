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

**Special keys**
* <space>
* <esc>

**Key Combination**
* <c-{a-z}> : CTRL-{a-z}
* <a-{a-z}> : ALT-{a-z}
* <s-{a-z}> : SHIFT-{a-z}
