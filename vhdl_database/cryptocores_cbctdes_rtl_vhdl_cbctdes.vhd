-- ======================================================================
-- CBC-DES encryption/decryption
-- algorithm according to FIPS 46-3 specification
-- Copyright (C) 2007 Torsten Meissner
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
use work.des_pkg.all;


entity cbctdes is
  port (
    reset_i     : in  std_logic;                  -- low active async reset
    clk_i       : in  std_logic;                  -- clock
    start_i     : in  std_logic;                  -- start cbc
    mode_i      : in  std_logic;                  -- des-modus: 0 = encrypt, 1 = decrypt
    key1_i      : in  std_logic_vector(0 TO 63);  -- key input
    key2_i      : in  std_logic_vector(0 TO 63);  -- key input
    key3_i      : in  std_logic_vector(0 TO 63);  -- key input
    iv_i        : in  std_logic_vector(0 to 63);  -- iv input
    data_i      : in  std_logic_vector(0 TO 63);  -- data input
    valid_i     : in  std_logic;                  -- input key/data valid flag
    ready_o     : out std_logic;                  -- ready to encrypt/decrypt
    data_o      : out std_logic_vector(0 TO 63);  -- data output
    valid_o     : out std_logic                   -- output data valid flag
  );
end entity cbctdes;


architecture rtl of cbctdes is


  component tdes is
    port (
      reset_i     : in  std_logic;                  -- async reset
      clk_i       : in  std_logic;                  -- clock
      mode_i      : in  std_logic;                  -- tdes-modus: 0 = encrypt, 1 = decrypt
      key1_i      : in  std_logic_vector(0 TO 63);  -- key input
      key2_i      : in  std_logic_vector(0 TO 63);  -- key input
      key3_i      : in  std_logic_vector(0 TO 63);  -- key input
      data_i      : in  std_logic_vector(0 TO 63);  -- data input
      valid_i     : in  std_logic;                  -- input key/data valid flag
      data_o      : out std_logic_vector(0 TO 63);  -- data output
      valid_o     : out std_logic;                  -- output data valid flag
      ready_o     : out std_logic
    );
  end component tdes;


  signal s_mode       : std_logic;
  signal s_des_mode   : std_logic;
  signal s_start      : std_logic;
  signal s_key1       : std_logic_vector(0 to 63);
  signal s_key2       : std_logic_vector(0 to 63);
  signal s_key3       : std_logic_vector(0 to 63);
  signal s_tdes_key1  : std_logic_vector(0 to 63);
  signal s_tdes_key2  : std_logic_vector(0 to 63);
  signal s_tdes_key3  : std_logic_vector(0 to 63);
  signal s_iv         : std_logic_vector(0 to 63);
  signal s_datain     : std_logic_vector(0 to 63);
  signal s_datain_d   : std_logic_vector(0 to 63);
  signal s_des_datain : std_logic_vector(0 to 63);
  signal s_validin    : std_logic;
  signal s_des_dataout : std_logic_vector(0 to 63);
  signal s_dataout    : std_logic_vector(0 to 63);
  signal s_validout   : std_logic;
  signal s_ready      : std_logic;
  signal s_readyout   : std_logic;


begin


  s_des_datain <= iv_i xor data_i      when mode_i = '0' and start_i = '1' else
                  s_dataout xor data_i when s_mode = '0' and start_i = '0' else
                  data_i;
  data_o       <= s_iv xor s_des_dataout       when s_mode = '1' and s_start = '1' else
                  s_datain_d xor s_des_dataout when s_mode = '1' and s_start = '0' else
                  s_des_dataout;
  s_tdes_key1  <= key1_i  when start_i = '1' else s_key1;
  s_tdes_key2  <= key2_i  when start_i = '1' else s_key2;
  s_tdes_key3  <= key3_i  when start_i = '1' else s_key3;
  s_des_mode   <= mode_i  when start_i = '1' else s_mode;

  ready_o     <= s_ready;
  s_validin   <= valid_i and s_ready;
  valid_o     <= s_validout;

  inputregister : process(clk_i, reset_i) is
  begin
    if(reset_i = '0') then
      s_mode     <= '0';
      s_start    <= '0';
      s_key1     <= (others => '0');
      s_key2     <= (others => '0');
      s_key3     <= (others => '0');
      s_iv       <= (others => '0');
      s_datain   <= (others => '0');
      s_datain_d <= (others => '0');
    elsif(rising_edge(clk_i)) then
      if(valid_i = '1' and s_ready = '1') then
        s_start  <= start_i;
        s_datain   <= data_i;
        s_datain_d <= s_datain;
      end if;
      if(valid_i = '1' and s_ready = '1' and start_i = '1') then
        s_mode   <= mode_i;
        s_key1   <= key1_i;
        s_key2   <= key2_i;
        s_key3   <= key3_i;
        s_iv     <= iv_i;
      end if;
    end if;
  end process inputregister;


  outputregister : process(clk_i, reset_i) is
  begin
    if(reset_i = '0') then
      s_ready   <= '1';
      s_dataout <= (others => '0');
    elsif(rising_edge(clk_i)) then
      if(valid_i = '1' and s_ready = '1' and s_readyout = '1') then
        s_ready <= '0';
      end if;
      if(s_validout = '1') then
        s_ready   <= '1';
        s_dataout <= s_des_dataout;
      end if;
    end if;
  end process outputregister;


  i_tdes : tdes
    port map (
      reset_i => reset_i,
      clk_i   => clk_i,
      mode_i  => s_des_mode,
      key1_i  => s_tdes_key1,
      key2_i  => s_tdes_key2,
      key3_i  => s_tdes_key3,
      data_i  => s_des_datain,
      valid_i => s_validin,
      data_o  => s_des_dataout,
      valid_o => s_validout,
      ready_o => s_readyout
    );


end architecture rtl;
