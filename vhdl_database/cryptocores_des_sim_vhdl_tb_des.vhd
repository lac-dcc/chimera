-- ======================================================================
-- DES encryption/decryption testbench
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

library osvvm;
  use osvvm.RandomPkg.all;

use std.env.all;

use work.des_pkg.all;
use work.tb_des_pkg.all;


entity tb_des is
end entity tb_des;


architecture rtl of tb_des is


  signal s_reset     : std_logic := '0';
  signal s_clk       : std_logic := '0';
  signal s_mode      : std_logic := '0';
  signal s_key       : std_logic_vector(0 to 63) := (others => '0');
  signal s_datain    : std_logic_vector(0 to 63) := (others => '0');
  signal s_validin   : std_logic := '0';
  signal s_acceptout : std_logic;
  signal s_dataout   : std_logic_vector(0 to 63);
  signal s_validout  : std_logic;
  signal s_acceptin  : std_logic;


  procedure cryptData(datain  : in  std_logic_vector(0 to 63);
                      key     : in  std_logic_vector(0 to 63);
                      mode    : in  boolean;
                      dataout : out std_logic_vector(0 to 63);
                      bytelen : in  integer) is
  begin
    report "VHPIDIRECT cryptData" severity failure;
  end procedure;

  attribute foreign of cryptData: procedure is "VHPIDIRECT cryptData";

  function swap (datain : std_logic_vector(0 to 63)) return std_logic_vector is
    variable v_data : std_logic_vector(0 to 63);
  begin
    for i in 0 to 7 loop
      for y in 0 to 7 loop
        v_data((i*8)+y) := datain((i*8)+7-y);
      end loop;
    end loop;
    return v_data;
  end function;


begin


  s_clk   <= not(s_clk) after 10 ns;
  s_reset <= '1' after 100 ns;


  testP : process is
    variable v_key       : std_logic_vector(0 to 63);
    variable v_datain    : std_logic_vector(0 to 63);
    variable v_dataout   : std_logic_vector(0 to 63);
    variable v_plaintext : std_logic_vector(0 to 63) := x"8000000000000000";
    variable v_random    : RandomPType;
  begin
    -- ENCRYPTION TESTS
    s_validin  <= '0';
    s_acceptin <= '0';
    s_mode     <= '0';
    s_datain   <= (others => '0');
    s_key      <= (others => '0');
    wait until s_reset = '1';
    report "# ENCRYPTION TESTS";

    -- Variable plaintext known answer test
    report "# Variable plaintext known answer test";
    v_key     := x"0101010101010101";
    v_datain  := x"8000000000000000";
    for index in c_variable_plaintext_known_answers'range loop
      wait until rising_edge(s_clk);
      s_validin <= '1';
      s_key     <= v_key;
      s_datain  <= v_datain;
      cryptData(swap(v_datain), swap(v_key), true, v_dataout, v_datain'length/8);
      wait until rising_edge(s_clk) and s_acceptout = '1';
      s_validin <= '0';
      wait until rising_edge(s_clk) and s_validout = '1';
      s_acceptin <= '1';
      assert s_dataout = c_variable_plaintext_known_answers(index)
        report "Encryption error"
        severity failure;
      assert s_dataout = swap(v_dataout)
        report "Encryption openSSL reference error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin <= '0';
      v_datain  := '0' & v_datain(0 to 62);
    end loop;

    -- Inverse permutation known answer test
    report "# Inverse permutation known answer test";
    v_key := x"0101010101010101";
    for index in c_variable_plaintext_known_answers'range loop
      v_datain  := c_variable_plaintext_known_answers(index);
      s_validin <= '1';
      s_key     <= v_key;
      s_datain  <= v_datain;
      cryptData(swap(v_datain), swap(v_key), true, v_dataout, v_datain'length/8);
      wait until rising_edge(s_clk) and s_acceptout = '1';
      s_validin <= '0';
      wait until rising_edge(s_clk) and s_validout = '1';
      s_acceptin <= '1';
      assert s_dataout = v_plaintext
        report "Encryption error"
        severity failure;
      assert s_dataout = swap(v_dataout)
        report "Encryption openSSL reference error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin <= '0';
      v_plaintext := '0' & v_plaintext(0 to 62);
    end loop;

    -- Variable key known answer test
    report "# Variable key known answer test";
    v_key     := x"8000000000000000";
    v_datain  := (others => '0');
    for index in c_variable_key_known_answers'range loop
      s_validin <= '1';
      s_key     <= v_key;
      s_datain  <= v_datain;
      cryptData(swap(v_datain), swap(v_key), true, v_dataout, v_datain'length/8);
      wait until rising_edge(s_clk) and s_acceptout = '1';
      s_validin <= '0';
      wait until rising_edge(s_clk) and s_validout = '1';
      s_acceptin <= '1';
      assert s_dataout = c_variable_key_known_answers(index)
        report "Encryption error"
        severity failure;
      assert s_dataout = swap(v_dataout)
        report "Encryption openSSL reference error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin <= '0';
      if (index = 6 or index = 13 or index = 20 or index = 27 or index = 34 or
          index = 41 or index = 48) then
        v_key := "00" & v_key(0 to 61);
      else
        v_key := '0' & v_key(0 to 62);
      end if;
    end loop;

    -- Permutation operation known answer test
    report "# Permutation operation known answer test";
    v_datain  := (others => '0');
    for index in c_permutation_operation_known_answers_keys'range loop
      wait until rising_edge(s_clk);
      v_key     := c_permutation_operation_known_answers_keys(index);
      s_validin <= '1';
      s_key     <= v_key;
      s_datain  <= v_datain;
      cryptData(swap(v_datain), swap(v_key), true, v_dataout, v_datain'length/8);
      wait until rising_edge(s_clk) and s_acceptout = '1';
      s_validin <= '0';
      wait until rising_edge(s_clk) and s_validout = '1';
      s_acceptin <= '1';
      assert s_dataout = c_permutation_operation_known_answers_cipher(index)
        report "Encryption error"
        severity failure;
      assert s_dataout = swap(v_dataout)
        report "Encryption openSSL reference error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin <= '0';
    end loop;

    -- Substitution table known answer test
    report "# Substitution table known answer test";
    for index in c_substitution_table_test_keys'range loop
      wait until rising_edge(s_clk);
      v_key     := c_substitution_table_test_keys(index);
      v_datain  := c_substitution_table_test_plain(index);
      s_validin <= '1';
      s_key     <= v_key;
      s_datain  <= v_datain;
      cryptData(swap(v_datain), swap(v_key), true, v_dataout, v_datain'length/8);
      wait until rising_edge(s_clk) and s_acceptout = '1';
      s_validin <= '0';
      wait until rising_edge(s_clk) and s_validout = '1';
      s_acceptin <= '1';
      assert s_dataout = c_substitution_table_test_cipher(index)
        report "Encryption error"
        severity failure;
      assert s_dataout = swap(v_dataout)
        report "Encryption openSSL reference error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin <= '0';
    end loop;

    -- Random key & data openSSL reference test
    report "# Random key & data openSSL reference test";
    for index in 0 to 63 loop
      wait until rising_edge(s_clk);
      v_key    := v_random.RandSlv(64);
      v_datain := v_random.RandSlv(64);
      s_validin <= '1';
      s_key     <= v_key;
      s_datain  <= v_datain;
      cryptData(swap(v_datain), swap(v_key), true, v_dataout, v_datain'length/8);
      wait until rising_edge(s_clk) and s_acceptout = '1';
      s_validin <= '0';
      wait until rising_edge(s_clk) and s_validout = '1';
      s_acceptin <= '1';
      assert s_dataout = swap(v_dataout)
        report "Encryption openSSL reference error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin <= '0';
    end loop;

    -- DECRYPTION TESTS
    report "# DECRYPTION TESTS";
    s_mode <= '1';

    -- Variable ciphertext known answer test
    report "# Variable ciphertext known answer test";
    v_key       := x"0101010101010101";
    v_plaintext := x"8000000000000000";
    for index in c_variable_plaintext_known_answers'range loop
      wait until rising_edge(s_clk);
      v_datain  := c_variable_plaintext_known_answers(index);
      s_validin <= '1';
      s_key     <= v_key;
      s_datain  <= v_datain;
      cryptData(swap(v_datain), swap(v_key), false, v_dataout, v_datain'length/8);
      wait until rising_edge(s_clk) and s_acceptout = '1';
      s_validin <= '0';
      wait until rising_edge(s_clk) and s_validout = '1';
      s_acceptin <= '1';
      assert s_dataout = v_plaintext
        report "Encryption error"
        severity failure;
      assert s_dataout = swap(v_dataout)
        report "Encryption openSSL reference error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin <= '0';
      v_plaintext := '0' & v_plaintext(0 to 62);
    end loop;

    -- Initial permutation known answer test
    report "# Initial permutation known answer test";
    v_key     := x"0101010101010101";
    v_datain  := x"8000000000000000";
    for index in c_variable_plaintext_known_answers'range loop
      wait until rising_edge(s_clk);
      s_validin <= '1';
      s_key     <= v_key;
      s_datain  <= v_datain;
      cryptData(swap(v_datain), swap(v_key), false, v_dataout, v_datain'length/8);
      wait until rising_edge(s_clk) and s_acceptout = '1';
      s_validin <= '0';
      wait until rising_edge(s_clk) and s_validout = '1';
      s_acceptin <= '1';
      assert s_dataout = c_variable_plaintext_known_answers(index)
        report "Encryption error"
        severity failure;
      assert s_dataout = swap(v_dataout)
        report "Encryption openSSL reference error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin <= '0';
      v_datain  := '0' & v_datain(0 to 62);
    end loop;

    -- Variable key known answer test
    report "# Variable key known answer test";
    v_key     := x"8000000000000000";
    for index in c_variable_key_known_answers'range loop
      v_datain  := c_variable_key_known_answers(index);
      s_validin <= '1';
      s_key     <= v_key;
      s_datain  <= v_datain;
      cryptData(swap(v_datain), swap(v_key), false, v_dataout, v_datain'length/8);
      wait until rising_edge(s_clk) and s_acceptout = '1';
      s_validin <= '0';
      wait until rising_edge(s_clk) and s_validout = '1';
      s_acceptin <= '1';
      assert s_dataout = 64x"0"
        report "Encryption error"
        severity failure;
      assert s_dataout = swap(v_dataout)
        report "Encryption openSSL reference error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin <= '0';
      if (index = 6 or index = 13 or index = 20 or index = 27 or index = 34 or
          index = 41 or index = 48) then
        v_key := "00" & v_key(0 to 61);
      else
        v_key := '0' & v_key(0 to 62);
      end if;
    end loop;

    -- Permutation operation known answer test
    report "# Permutation operation known answer test";
    v_datain  := (others => '0');
    for index in c_permutation_operation_known_answers_keys'range loop
      wait until rising_edge(s_clk);
      v_key     := c_permutation_operation_known_answers_keys(index);
      v_datain  := c_permutation_operation_known_answers_cipher(index);
      s_validin <= '1';
      s_key     <= v_key;
      s_datain  <= v_datain;
      cryptData(swap(v_datain), swap(v_key), false, v_dataout, v_datain'length/8);
      wait until rising_edge(s_clk) and s_acceptout = '1';
      s_validin <= '0';
      wait until rising_edge(s_clk) and s_validout = '1';
      s_acceptin <= '1';
      assert s_dataout = 64x"0"
        report "Encryption error"
        severity failure;
      assert s_dataout = swap(v_dataout)
        report "Encryption openSSL reference error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin <= '0';
    end loop;

    -- Substitution table known answer test
    report "# Substitution table known answer test";
    for index in c_substitution_table_test_keys'range loop
      wait until rising_edge(s_clk);
      v_key     := c_substitution_table_test_keys(index);
      v_datain  := c_substitution_table_test_cipher(index);
      s_validin <= '1';
      s_key     <= v_key;
      s_datain  <= v_datain;
      cryptData(swap(v_datain), swap(v_key), false, v_dataout, v_datain'length/8);
      wait until rising_edge(s_clk) and s_acceptout = '1';
      s_validin <= '0';
      wait until rising_edge(s_clk) and s_validout = '1';
      s_acceptin <= '1';
      assert s_dataout = c_substitution_table_test_plain(index)
        report "Encryption error"
        severity failure;
      assert s_dataout = swap(v_dataout)
        report "Encryption openSSL reference error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin <= '0';
    end loop;

    -- Random key & data openSSL reference test
    report "# Random key & data openSSL reference test";
    for index in 0 to 63 loop
      wait until rising_edge(s_clk);
      v_key    := v_random.RandSlv(64);
      v_datain := v_random.RandSlv(64);
      s_validin <= '1';
      s_key     <= v_key;
      s_datain  <= v_datain;
      cryptData(swap(v_datain), swap(v_key), false, v_dataout, v_datain'length/8);
      wait until rising_edge(s_clk) and s_acceptout = '1';
      s_validin <= '0';
      wait until rising_edge(s_clk) and s_validout = '1';
      s_acceptin <= '1';
      assert s_dataout = swap(v_dataout)
        report "Encryption openSSL reference error"
        severity failure;
      wait until rising_edge(s_clk);
      s_acceptin <= '0';
    end loop;

    wait for 100 ns;
    report "# Successfully passed all tests";
    finish(0);
    wait;

  end process testP;



  i_des : des
  generic map (
    design_type => "ITER"
  )
  port map (
    reset_i  => s_reset,
    clk_i    => s_clk,
    mode_i   => s_mode,
    key_i    => s_key,
    data_i   => s_datain,
    valid_i  => s_validin,
    accept_o => s_acceptout,
    data_o   => s_dataout,
    valid_o  => s_validout,
    accept_i => s_acceptin
  );


end architecture rtl;
