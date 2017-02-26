Special Variables
-----------------

* `$@`: filename of the target 
* `$<`: filename of the first prerequisite
* `$^`: names of all the prerequisite (with space between them)
* `$?`: filename of the prerequisite which are newer than target

Conditionals
------------

**Outside of rules** 

```make
LIB_DEPS=raft,ocaml-protoc,ocplib-endian

ifneq ($(LIB_DEPS),)
	LIB_DEPS:=-pkgs $(LIB_DEPS)
endif
```

or with variable values 

```make
OCB_LDFLAGS+= -lflags "-cclib -lz "
ifeq ($(shell uname), Linux)
  OCB_LDFLAGS+= -lflags "-cclib -lzstd"
endif
```

else statement are also possible 

```make
OCB_LDFLAGS+= -lflags "-cclib -lz "
ifeq ($(shell uname), Linux)
  OCB_LDFLAGS+= -lflags "-cclib -lzstd"
else 
  OCB_LDFLAGS+= -lflags "-cclib -lzstd2"
endif
```

Other test includes:
* `ifneq`
* `ifdef`
