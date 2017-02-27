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

To set a local option (ie equivalent to `:set local ...`) then prefix with
`l:`. For instance:

```vim 
:let &l:wrap = 1
```

**types** 

* "int" 
* "string" 

> Note for boolean vim uses int. `> 0 `is `true` and `0` is `false`. 

**registers as variables**

Vim registers (ie see `:registers`) can also be used as variable.

```vim 
:let @a = "hello"
```
> This is also a statement since the register is a reference and it produces
> the side effect of modifying the register. 

Conditionals
------------

**if elesif else endif** 

```vim 
if <expr>
  <statement>
elseif <expr>
  <statement>
else 
  <statement>
endif  
```

> `if` syntax is line based for the `then` case. 

**boolean expressions**

One of the big problem with vim is the **case sensitivity** of the `==` 
operator. It depends on the vim option `ignorecase`. In order to avoid script
to have different runtime behavior based on a user setting, vim provide case
and non-case sensitive boolean operators. Suffix `#` means case-sensitive, 
while `?` means case-insensitive.

```
		            use 'ignorecase'    match case	   ignore case ~
equal			             ==		            ==#		          ==?
not equal		           !=		            !=#		          !=?
```

> for more operators see `:help ==#

Number coersion. Vim will try to coerse a type to a number in an arithmetic 
expression.

```vim 
:let a = "20hello" + 10
:echo a
```
will print 30

