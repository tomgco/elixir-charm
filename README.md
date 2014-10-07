Charm
=====

Use
[ansi terminal characters](http://www.termsys.demon.co.uk/vtansi.htm)
to write colors and cursor positions.

Port from [@substack](https://www.github.com/substack)

Example
=======

```elixr



```

Charm.reset()
-------------

Reset the entire screen, like the /usr/bin/reset command.

Charm.write\1
----------------

`Charm.write "Nom nom nom"`

Pass along `msg` to the output stream.

Charm.position\2
--------------------

Set the cursor position to the absolute coordinates `x, y`.

Charm.display\1
-------------------

`Charm.display :bright`

Set the display mode with the atom defined in `IO.ANSI`.

Charm.foreground\1
-----------------------

`Charm.foreground :blue`

Set the foreground color with the atom `:color`, which can be:

* :red
* :yellow
* :green
* :blue
* :cyan
* :magenta
* :black
* :white

Charm.background\1
-----------------------

`Charm.background :red`

Set the background color with the atom `:color`, which can be:

* :red
* :yellow
* :green
* :blue
* :cyan
* :magenta
* :black
* :white

Charm.cursor\1
---------------------

Set the cursor visibility with a boolean.

`Charm.cursor true`

install
=======

With [hex](http://hex.pm) do:

```
npm install charm
```
