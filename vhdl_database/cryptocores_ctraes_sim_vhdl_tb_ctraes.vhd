-- ======================================================================
-- AES Counter mode testbench
-- Copyright (C) 2020 Torsten Meissner
-------------------------------------------------------------------------
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-- ======================================================================


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library osvvm;
  use osvvm.RandomPkg.all;

use std.env.all;


entity tb_ctraes is
end entity tb_ctraes;


architecture sim of tb_ctraes is


  constant C_NONCE_WIDTH : natural range 64 to 96 := 96;


  signal s_reset    : std_logic := '0';
  signal s_clk      : std_logic := '0';

  signal s_start    : std_logic := '0';
  signal s_nonce    : std_logic_vector(0 to C_NONCE_WIDTH-1) := (others => '0');
  signal s_key      : std_logic_vector(0 to 127) := (others => '0');
  signal s_datain   : std_logic_vector(0 to 127) := (others => '0');
  signal s_validin  : std_logic := '0';
  signal s_acceptin : std_logic;

  signal s_dataout   : std_logic_vector(0 to 127);
  signal s_validout  : std_logic := '0';
  signal s_acceptout : std_logic := '0';

  procedure cryptData(datain  : in  std_logic_vector(0 to 127);
                      key     : in  std_logic_vector(0 to 127);
                      iv      : in  std_logic_vector(0 to 127);
                      start   : in  boolean;
                      final   : in  boolean;
                      dataout : out std_logic_vector(0 to 127);
                      bytelen : in  integer) is
  begin
    report "VHPIDIRECT cryptData" severity failure;
  end procedure;

  attribute foreign of cryptData: procedure is "VHPIDIRECT cryptData";

  function swap (datain : std_logic_vector(0 to 127)) return std_logic_vector is
    variable v_data : std_logic_vector(0 to 127);
  begin
    for i in 0 to 15 loop
      for y in 0 to 7 loop
        v_data((i*8)+y) := datain((i*8)+7-y);
      end loop;
    end loop;
    return v_data;
  end function;

begin


  i_ctraes : entity work.ctraes
  generic map (
    NONCE_WIDTH => C_NONCE_WIDTH
  )
  port map (
    reset_i  => s_reset,
    clk_i    => s_clk,
    start_i  => s_start,
    nonce_i  => s_nonce,
    key_i    => s_key,
    data_i   => s_datain,
    valid_i  => s_validin,
    accept_o => s_acceptin,
    data_o   => s_dataout,
    valid_o  => s_validout,
    accept_i => s_acceptout
  );


  s_clk   <= not(s_clk) after 10 ns;
  s_reset <= '1' after 100 ns;


  process is
    variable v_key     : std_logic_vector(0 to 127);
    variable v_nonce   : std_logic_vector(0 to C_NONCE_WIDTH-1);
    variable v_datain  : std_logic_vector(0 to 127);
    variable v_dataout : std_logic_vector(0 to 127);
    variable v_random  : RandomPType;
  begin
    v_random.InitSeed(v_random'instance_name);
    wait until s_reset = '1' and rising_edge(s_clk);
    -- ENCRYPTION TESTs
    report "Test CTR-AES encryption";
    s_start <= '1';
    v_nonce := v_random.RandSlv(s_nonce'length);
    v_key   := v_random.RandSlv(128);
    for i in 0 to 31 loop
      v_datain  := v_random.RandSlv(128);
      s_validin <= '1';
      s_key     <= v_key;
      s_nonce   <= v_nonce;
      s_datain  <= v_datain;
      cryptData(swap(v_datain), swap(v_key), swap(v_nonce & 32x"0"), i = 0, i = 31, v_dataout, v_datain'length/8);
      wait until s_acceptin = '1' and rising_edge(s_clk);
      s_validin <= '0';
      s_start   <= '0';
      wait until s_validout = '1' and rising_edge(s_clk);
      s_acceptout <= '1';
      assert s_dataout = swap(v_dataout)
        report "Encryption error: Expected 0x" & to_hstring(swap(v_dataout)) & ", got 0x" & to_hstring(s_dataout)
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptout <= '0';
    end loop;
    -- Watchdog
    wait for 100 ns;
    report "Simulation finished without errors";
    finish(0);
  end process;


end architecture sim;
