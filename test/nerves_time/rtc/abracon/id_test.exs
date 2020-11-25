defmodule NervesTime.RTC.Abracon.IDTest do
  use ExUnit.Case
  alias NervesTime.RTC.Abracon.ID

  test "decodes ID ibo5" do
    assert ID.decode(<<24, 5, 19, 49, 70, 89, 48>>) ==
             {:ok, %{id: :ab_rtcmc_32768khz_ibo5_s3, lot: 49, part_id: 18009, wafer: 12}}
  end

  test "decodes ID 0bx5" do
    assert ID.decode(<<8, 5, 19, 49, 70, 89, 48>>) ==
             {:ok, %{id: :ab_rtcmc_32768khz_08x5, lot: 49, part_id: 18009, wafer: 12}}
  end
end