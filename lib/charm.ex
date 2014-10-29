defmodule Charm.ANSI do
  require IO.ANSI.Sequence

  IO.ANSI.Sequence.defsequence :insert_true, "4", "h"
  IO.ANSI.Sequence.defsequence :insert_false, "l", ""
end

defmodule Charm do
@moduledoc "Charm, Colour your terminal!

Holy Grail: http://unixhelp.ed.ac.uk/CGI/man-cgi?console_codes+4
"
  import Charm.ANSI

  @doc "Writes control codes applying to the deplay"
  def display(item) do
    write apply IO.ANSI, item, []
  end

  @doc "Sets the TTY to the specified color foreground :blue"
  def foreground(item) do
    write apply IO.ANSI, item, []
  end

  @doc "Sets the TTY to the specified color background :blue"
  def background(item) do
    write apply IO.ANSI, :"#{item}_background", []
  end

  @doc "Set Insertion/Replacement Mode, set insert mode (VT102)"
  def insert() do
    write insert_true
  end

  @doc "Unset Insertion/Replacement Mode, set insert mode (VT102)"
  def insert(false) do
    write insert_false
  end

  def insert(atom) when is_atom(atom) do
    insert atom, 1
  end

  @doc "Insert the indicated # of blank lines."
  def insert(:line, n) do
    write IO.ANSI.format [ "\e[#{n}L" ]
  end

  @doc "Insert the indicated # of blank characters."
  def insert(:char, n) do
    write IO.ANSI.format [ "\e[#{n}@" ]
  end

  @doc "Set the cursor to visible (terminal default)"
  def cursor(true), do: write IO.ANSI.format [ "\e[25h" ]
  @doc "Set the cursor to hidden (terminal default)"
  def cursor(false), do: write IO.ANSI.format [ "\e[24l" ]

  @doc "Move cursor to the indicated absolute position: row, column."
  def position(x, y) do
    write IO.ANSI.format [ "\e[#{y};#{x}f" ]
  end

  @doc "Move cursor to the indicated relative position"
  def move(x, y) when y < 0 and x > 0 do
    up -y
    right x
  end

  def move(x, y) when y < 0 and x < 0 do
    up -y
    left -x
  end

  def move(x, y) when y > 0 and x > 0 do
    down y
    right x
  end

  def move(x, y) when y > 0 and x < 0 do
    down y
    left -x
  end

  def up(y \\ 1) do
    write IO.ANSI.format [ "\e[#{y}A" ]
  end

  def down(y \\ 1) do
    write IO.ANSI.format [ "\e[#{y}B" ]
  end

  def left(y \\ 1) do
    write IO.ANSI.format [ "\e[#{y}D" ]
  end

  def right(y \\ 1) do
    write IO.ANSI.format [ "\e[#{y}C" ]
  end

  @doc "Reset the terminal"
  def reset() do
    write IO.ANSI.format [ "\e[0m" ]
    write IO.ANSI.format [ "\e[2J" ]
    write IO.ANSI.format [ "\ec" ]
  end

  def write(esc) do
    IO.write esc
  end

end
