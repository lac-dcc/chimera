-- ======================================================================
-- TDES encryption/decryption testbench
-- tests according to NIST 800-17 special publication
-- Copyright (C) 2011 Torsten Meissner
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

use std.env.all;



entity tb_tdes is
end entity tb_tdes;



architecture rtl of tb_tdes is


  type t_array is array (natural range <>) of std_logic_vector(0 to 63);

  constant c_table_test_plain : t_array(0 to 18) :=
    (x"01A1D6D039776742", x"5CD54CA83DEF57DA", x"0248D43806F67172",
     x"51454B582DDF440A", x"42FD443059577FA2", x"059B5E0851CF143A",
     x"0756D8E0774761D2", x"762514B829BF486A", x"3BDD119049372802",
     x"26955F6835AF609A", x"164D5E404F275232", x"6B056E18759F5CCA",
     x"004BD6EF09176062", x"480D39006EE762F2", x"437540C8698F3CFA",
     x"072D43A077075292", x"02FE55778117F12A", x"1D9D5C5018F728C2",
     x"305532286D6F295A");

  signal s_tdes_answers : t_array(0 to 19);

  signal s_reset    : std_logic := '0';
  signal s_clk      : std_logic := '0';
  signal s_mode     : std_logic := '0';
  signal s_key1     : std_logic_vector(0 to 63) := (others => '0');
  signal s_key2     : std_logic_vector(0 to 63) := (others => '0');
  signal s_key3     : std_logic_vector(0 to 63) := (others => '0');
  signal s_datain   : std_logic_vector(0 to 63) := (others => '0');
  signal s_validin  : std_logic := '0';
  signal s_acceptin : std_logic;

  signal s_dataout   : std_logic_vector(0 to 63);
  signal s_validout  : std_logic := '0';
  signal s_acceptout : std_logic := '0';


begin


  s_reset <= '1' after 100 ns;
  s_clk   <= not(s_clk) after 10 ns;


  teststimuliP : process is
  begin
    s_mode      <= '0';
    s_validin   <= '0';
    s_key1      <= (others => '0');
    s_key2      <= (others => '0');
    s_key3      <= (others => '0');
    s_datain    <= (others => '0');
    wait until s_reset = '1';
    -- ENCRYPTION TESTS
    -- cbc known answers test
    for index in c_table_test_plain'range loop
      wait until rising_edge(s_clk);
        s_key1    <= x"1111111111111111";
        s_key2    <= x"5555555555555555";
        s_key3    <= x"9999999999999999";
        s_validin <= '1';
        s_datain  <= c_table_test_plain(index);
      wait until s_acceptin = '1' and rising_edge(s_clk);
        s_validin <= '0';
    end loop;
    wait until rising_edge(s_clk);
    s_mode    <= '0';
    s_validin <= '0';
    s_key1    <= (others => '0');
    s_key2    <= (others => '0');
    s_key3    <= (others => '0');
    s_datain  <= (others => '0');
    wait for 1 us;
    -- DECRYPTION TESTS
    -- cbc known answer test
    for index in c_table_test_plain'range loop
      wait until rising_edge(s_clk);
        s_key1    <= x"1111111111111111";
        s_key2    <= x"5555555555555555";
        s_key3    <= x"9999999999999999";
        s_mode    <= '1';
        s_validin <= '1';
        s_datain  <= s_tdes_answers(index);
      wait until s_acceptin = '1' and rising_edge(s_clk);
        s_validin <= '0';
        s_mode    <= '0';
    end loop;
    wait until rising_edge(s_clk);
    s_mode      <= '0';
    s_validin   <= '0';
    s_key1      <= (others => '0');
    s_key2      <= (others => '0');
    s_key3      <= (others => '0');
    s_datain    <= (others => '0');
    wait;
  end process teststimuliP;


  testcheckerP : process is
  begin
    s_acceptout <= '1';
    report "# ENCRYPTION";
    for index in c_table_test_plain'range loop
      wait until rising_edge(s_clk) and s_validout = '1';
        s_tdes_answers(index) <= s_dataout;
        report "TDES enc: 0x" & to_hstring(c_table_test_plain(index)) & " -> " & to_hstring(s_dataout);
    end loop;
    report "# DECRYPTION TESTS";
    report "# tdes known answer test";
    for index in c_table_test_plain'range loop
      wait until rising_edge(s_clk) and s_validout = '1';
        report "TDES dec: 0x" & to_hstring(s_tdes_answers(index)) & " -> " & to_hstring(s_dataout);
        assert (s_dataout = c_table_test_plain(index))
          report "decryption error"
          severity error;
    end loop;
    report "# Successfully passed all tests";
    wait for 10 us;
    stop(0);
  end process testcheckerP;


  i_tdes : entity work.tdes
  port map (
    reset_i  => s_reset,
    clk_i    => s_clk,
    mode_i   => s_mode,
    key1_i   => s_key1,
    key2_i   => s_key2,
    key3_i   => s_key3,
    data_i   => s_datain,
    valid_i  => s_validin,
    accept_o => s_acceptin,
    data_o   => s_dataout,
    valid_o  => s_validout,
    accept_i => s_acceptout
  );


end architecture rtl;
