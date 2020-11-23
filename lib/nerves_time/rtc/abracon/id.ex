defmodule NervesTime.RTC.Abracon.ID do
  @moduledoc false

  @doc """
  Return a list of commands for reading the ID registers
  """

  use Bitwise

  def reads() do
    # Register 0x28-0x2E
    [{:write_read, <<0x28>>, 7}]
  end

  @spec decode(<<_::16>>) :: {:ok, map()} | {:error, any()}
  def decode(
        <<id0, id1, id2, lot::integer-8, lot9::integer-1, part_id::big-integer-15,
          lot8::integer-1, wafer::integer-5, _::integer-2>>
      ) do
    {:ok,
     %{
       id: <<id0 &&& 0x08, id1, id2>>,
       lot: lot9 * 512 + lot8 * 256 + lot,
       part_id: part_id,
       wafer: wafer
     }}
  end

  def decode(_other), do: {:error, :invalid}
end
