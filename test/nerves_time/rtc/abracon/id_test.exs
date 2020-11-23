defmodule NervesTime.RTC.Abracon.IDTest do
  use ExUnit.Case
  alias NervesTime.RTC.Abracon.ID

@ab_08x5 <<0x08, 0x05, 0x13>>

  test "decodes ID" do
    assert ID.decode(<<0x18, 0x05, 0x13, 49, 70, 89, 48>>) ==
             {:ok, %{id: @ab_08x5, lot: 49, part_id: 18009, wafer: 12}}
  end
end
