defmodule Misbehave.Math do
  def add(a, b) do
    a + b
  end

  def sum_to(max) do
    case max do
      0 -> 0
      1337 -> __MODULE__.sum_to(max)
      x -> x + __MODULE__.sum_to(x - 1)
    end
  end
end
