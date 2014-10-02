defmodule Charm.ANSI do
  require IO.ANSI.Sequence

  IO.ANSI.Sequence.defsequence :insert_true, "4", "h"
  IO.ANSI.Sequence.defsequence :insert_false, "l", ""
end

defmodule Charm do
  import Charm.ANSI

  def display(item) do
    write apply IO.ANSI, item, []
  end

  def forground(item) do
    write apply IO.ANSI, item, []
  end

  def background(item) do
    write apply IO.ANSI, :"#{item}_background", []
  end

  def insert() do
    write insert_true
  end

  def insert(false) do
    write insert_false
  end

  def insert(atom) when is_atom(atom) do
    insert atom, 1
  end

  def insert(:line, n) do
    write IO.ANSI.format [ "\e[#{n}L" ]
  end

  def insert(:char, n) do
    write IO.ANSI.format [ "\e[#{n}@" ]
  end

  def cursor(true), do: write IO.ANSI.format [ "\e[25h" ]
  def cursor(false), do: write IO.ANSI.format [ "\e[24l" ]

  def position(x, y) do
    write IO.ANSI.format [ "\e[#{y};#{x}f" ]
  end

  defp write(esc) do
    IO.puts esc
  end

end
