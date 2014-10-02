defmodule CharmTest do
  use ExUnit.Case
  import ExUnit.CaptureIO 

  test :display_bright do
    assert capture_io(fn -> Charm.display :bright end) == "\e[1m\n"
  end

  test :forground_color do
    assert capture_io(fn -> Charm.forground :red end) == "\e[31m\n"
  end

  test :background_color do
    assert capture_io(fn -> Charm.forground :black end) == "\e[30m\n"
  end
  
  test :insert do
    assert capture_io(fn -> Charm.insert end) == "\e[4h\n"
  end

  test :insert_false do
    assert capture_io(fn -> Charm.insert false end) == "\e[l\n"
  end

  test :insert_line do
    assert capture_io(fn -> Charm.insert :line, 1 end) == "\e[1L\n"
    assert capture_io(fn -> Charm.insert :line, 110 end) == "\e[110L\n"
    assert capture_io(fn -> Charm.insert :line, 61 end) == "\e[61L\n"
  end

  test :insert_char do
    assert capture_io(fn -> Charm.insert :char, 1 end) == "\e[1@\n"
    assert capture_io(fn -> Charm.insert :char, 110 end) == "\e[110@\n"
    assert capture_io(fn -> Charm.insert :char, 61 end) == "\e[61@\n"
    assert capture_io(fn -> Charm.insert :char end) == "\e[1@\n"
  end

  test :cursor_is_true do
    assert capture_io(fn -> Charm.cursor true end) == "\e[25h\n"
  end

  test :cursor_is_false do
    assert capture_io(fn -> Charm.cursor false end) == "\e[24l\n"
  end

  test :position do
    assert capture_io(fn -> Charm.position 1, 4 end) == "\e[4;1f\n"
  end

end
