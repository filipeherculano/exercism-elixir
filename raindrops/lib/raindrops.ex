defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    primes = %{3 => "Pling", 5 => "Plang", 7 => "Plong"}

    {factors, result} =
      Enum.map_reduce([3, 5, 7], "", fn
        prime, acc ->
          case is_div(number, prime) do
            true -> {1, acc <> primes[prime]}
            false -> {0, acc}
          end
      end)

    factors
    |> Enum.any?(&Kernel.==(&1, 1))
    |> case do
      true -> result
      false -> Integer.to_string(number)
    end
  end

  defp is_div(number, prime) do
    number
    |> Integer.mod(prime)
    |> Kernel.==(0)
  end
end
