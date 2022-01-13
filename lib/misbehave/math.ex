defmodule Misbehave.Math do
  def add(a, b) do
    a + b
  end

  def sum_to(max) do
    case max do
      0 -> 0
      1337 -> sum_to(max)
      x -> x + sum_to(x - 1)
    end
  end
end
