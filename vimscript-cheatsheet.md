Variables 
---------

**let binding** 
```vim
:let my_variable = 12
:let my_variable = "twelve"
```

**options as variables**

Vim option (like `wrap`) can work as variable, and for this they need to 
be prefixed with `&`.

```vim 
:echo &wrap
:let &textwidth = &textwidth + 10 
```
> In the second line, the textwidth option is actually a statement rather than
> an expression as it produces the side effect of modifying the `textwidth`
> option in vim. 

**types** 

* "int" 
* "string" 

> Note for boolean vim uses int. `> 0 `is `true` and `0` is `false`. 

**registers as variables **

Vim registers (ie see `:registers`) can also be used as variable.

```vim 
:let @a = "hello"
```
> This is also a statement since the register is a reference and it produces
> the side effect of modifying the register. 
