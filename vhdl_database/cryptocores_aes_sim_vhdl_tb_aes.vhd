-- ======================================================================
-- AES encryption/decryption
-- Copyright (C) 2019 Torsten Meissner
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

use work.aes_pkg.all;



entity tb_aes is
end entity tb_aes;



architecture rtl of tb_aes is


  signal s_reset         : std_logic := '0';
  signal s_clk           : std_logic := '0';
  signal s_mode          : std_logic := '0';
  signal s_key           : std_logic_vector(0 to 127) := (others => '0');
  signal s_datain        : std_logic_vector(0 to 127) := (others => '0');
  signal s_validin_enc   : std_logic := '0';
  signal s_acceptout_enc : std_logic;
  signal s_dataout_enc   : std_logic_vector(0 to 127);
  signal s_validout_enc  : std_logic;
  signal s_acceptin_enc  : std_logic := '0';
  signal s_validin_dec   : std_logic := '0';
  signal s_acceptout_dec : std_logic;
  signal s_dataout_dec   : std_logic_vector(0 to 127);
  signal s_validout_dec  : std_logic;
  signal s_acceptin_dec  : std_logic := '0';

  procedure cryptData(datain  : in  std_logic_vector(0 to 127);
                      key     : in  std_logic_vector(0 to 127);
                      mode    : in  boolean;
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


  s_clk   <= not(s_clk) after 10 ns;
  s_reset <= '1' after 100 ns;


  i_aes_enc : aes_enc
  port map (
    reset_i  => s_reset,
    clk_i    => s_clk,
    key_i    => s_key,
    data_i   => s_datain,
    valid_i  => s_validin_enc,
    accept_o => s_acceptout_enc,
    data_o   => s_dataout_enc,
    valid_o  => s_validout_enc,
    accept_i => s_acceptin_enc
  );


  i_aes_dec : aes_dec
  port map (
    reset_i  => s_reset,
    clk_i    => s_clk,
    key_i    => s_key,
    data_i   => s_datain,
    valid_i  => s_validin_dec,
    accept_o => s_acceptout_dec,
    data_o   => s_dataout_dec,
    valid_o  => s_validout_dec,
    accept_i => s_acceptin_dec
  );


  process is
    variable v_key     : std_logic_vector(0 to 127);
    variable v_datain  : std_logic_vector(0 to 127);
    variable v_dataout : std_logic_vector(0 to 127);
    variable v_random  : RandomPType;
  begin
    v_random.InitSeed(v_random'instance_name);
    wait until s_reset = '1';
    -- ENCRYPTION TESTs
    report "Test encryption";
    for i in 0 to 63 loop
      wait until rising_edge(s_clk);
      s_validin_enc <= '1';
      v_key         := v_random.RandSlv(128);
      v_datain      := v_random.RandSlv(128);
      s_key         <= v_key;
      s_datain      <= v_datain;
      cryptData(swap(v_datain), swap(v_key), true, v_dataout, v_datain'length/8);
      wait until s_acceptout_enc = '1' and rising_edge(s_clk);
      s_validin_enc <= '0';
      wait until s_validout_enc = '1' and rising_edge(s_clk);
      s_acceptin_enc <= '1';
      assert s_dataout_enc = swap(v_dataout)
        report "Encryption error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin_enc <= '0';
    end loop;
    -- DECRYPTION TESTs
    report "Test decryption";
    for i in 0 to 63 loop
      wait until rising_edge(s_clk);
      s_validin_dec <= '1';
      v_key         := v_random.RandSlv(128);
      v_datain      := v_random.RandSlv(128);
      s_key         <= v_key;
      s_datain      <= v_datain;
      cryptData(swap(v_datain), swap(v_key), false, v_dataout, v_datain'length/8);
      wait until s_acceptout_dec = '1' and rising_edge(s_clk);
      s_validin_dec <= '0';
      wait until s_validout_dec = '1' and rising_edge(s_clk);
      s_acceptin_dec <= '1';
      assert s_dataout_dec = swap(v_dataout)
        report "Decryption error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin_dec <= '0';
    end loop;
    wait for 100 ns;
    report "Tests successful";
    finish(0);
  end process;


end architecture rtl;
