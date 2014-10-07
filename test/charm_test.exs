defmodule CharmTest do
  use ExUnit.Case
  import ExUnit.CaptureIO 

  test :display_bright do
    assert capture_io(fn -> Charm.display :bright end) == "\e[1m"
  end

  test :foreground_color do
    assert capture_io(fn -> Charm.foreground :red end) == "\e[31m"
  end

  test :background_color do
    assert capture_io(fn -> Charm.background :black end) == "\e[40m"
  end
  
  test :insert do
    assert capture_io(fn -> Charm.insert end) == "\e[4h"
  end

  test :insert_false do
    assert capture_io(fn -> Charm.insert false end) == "\e[l"
  end

  test :insert_line do
    assert capture_io(fn -> Charm.insert :line, 1 end) == "\e[1L"
    assert capture_io(fn -> Charm.insert :line, 110 end) == "\e[110L"
    assert capture_io(fn -> Charm.insert :line, 61 end) == "\e[61L"
  end

  test :insert_char do
    assert capture_io(fn -> Charm.insert :char, 1 end) == "\e[1@"
    assert capture_io(fn -> Charm.insert :char, 110 end) == "\e[110@"
    assert capture_io(fn -> Charm.insert :char, 61 end) == "\e[61@"
    assert capture_io(fn -> Charm.insert :char end) == "\e[1@"
  end

  test :cursor_is_true do
    assert capture_io(fn -> Charm.cursor true end) == "\e[25h"
  end

  test :cursor_is_false do
    assert capture_io(fn -> Charm.cursor false end) == "\e[24l"
  end

  test :position do
    assert capture_io(fn -> Charm.position 1, 4 end) == "\e[4;1f"
  end

end
