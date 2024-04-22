-- ======================================================================
-- CBC-MAC-DES testbench
-- Copyright (C) 2015 Torsten Meissner
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


entity tb_cbcmac_des is
end entity tb_cbcmac_des;


architecture sim of tb_cbcmac_des is


  type t_array is array (natural range <>) of std_logic_vector(0 to 63);



  signal s_reset     : std_logic := '0';
  signal s_clk       : std_logic := '0';
  signal s_start     : std_logic := '0';
  signal s_key       : std_logic_vector(0 to 63) := (others => '0');
  signal s_datain    : std_logic_vector(0 to 63) := (others => '0');
  signal s_validin   : std_logic := '0';
  signal s_acceptout : std_logic;
  signal s_dataout   : std_logic_vector(0 to 63);
  signal s_validout  : std_logic;
  signal s_acceptin  : std_logic;


  component cbcmac_des is
    port (
      reset_i     : in  std_logic;
      clk_i       : in  std_logic;
      start_i     : in  std_logic;
      key_i       : in  std_logic_vector(0 to 63);
      data_i      : in  std_logic_vector(0 to 63);
      valid_i     : in  std_logic;
      accept_o    : out std_logic;
      data_o      : out std_logic_vector(0 to 63);
      valid_o     : out std_logic;
      accept_i    : in  std_logic
    );
  end component cbcmac_des;


  -- key, plain & crypto stimuli values
  -- taken from NIST website:
  -- http://csrc.nist.gov/publications/fips/fips113/fips113.html

  constant C_KEY : std_logic_vector(0 to 63) := x"0123456789abcdef";

  constant C_PLAIN : t_array := (
    x"3736353433323120", x"4e6f772069732074",
    x"68652074696d6520", x"666f722000000000");

  constant C_CRYPT : t_array := (
    x"21fb193693a16c28", x"6c463f0cb7167a6f",
    x"956ee891e889d91e", x"f1d30f6849312ca4");


begin


  s_clk   <= not(s_clk) after 10 ns;
  s_reset <= '1' after 100 ns;


  StimuliP : process is
  begin
    s_start    <= '0';
    s_key      <= (others => '0');
    s_datain   <= (others => '0');
    s_validin  <= '0';
    wait until s_reset = '1';
    s_start <= '1';
    for i in C_PLAIN'range loop
      wait until rising_edge(s_clk);
      s_validin <= '1';
      s_key     <= C_KEY;
      s_datain  <= C_PLAIN(i);
      wait until rising_edge(s_clk) and s_acceptout = '1';
      s_start   <= '0';
      s_validin <= '0';
    end loop;
    wait;
  end process StimuliP;


  CheckerP : process is
  begin
    s_acceptin <= '0';
    wait until s_reset = '1';
    for i in C_CRYPT'range loop
      wait until rising_edge(s_clk);
      s_acceptin <= '1';
      wait until rising_edge(s_clk) and s_validout = '1';
      assert s_dataout = C_CRYPT(i)
        report "Encryption error"
        severity failure;
      s_acceptin <= '0';
    end loop;
    report "CBCMAC test successful :)";
    wait;
  end process CheckerP;


  i_cbcmac_des : cbcmac_des
  port map (
    reset_i  => s_reset,
    clk_i    => s_clk,
    start_i  => s_start,
    key_i    => s_key,
    data_i   => s_datain,
    valid_i  => s_validin,
    accept_o => s_acceptout,
    data_o   => s_dataout,
    valid_o  => s_validout,
    accept_i => s_acceptin
  );


end architecture sim;
