-- ======================================================================
-- TDES encryption/decryption
-- algorithm according to FIPS 46-3 specification
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
use work.des_pkg.all;


entity tdes is
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
end entity tdes;


architecture rtl of tdes is


  component des is
    port (
      reset_i     : in  std_logic;
      clk_i       : IN  std_logic;                  -- clock
      mode_i      : IN  std_logic;                  -- des-modus: 0 = encrypt, 1 = decrypt
      key_i       : IN  std_logic_vector(0 TO 63);  -- key input
      data_i      : IN  std_logic_vector(0 TO 63);  -- data input
      valid_i     : IN  std_logic;                  -- input key/data valid flag
      data_o      : OUT std_logic_vector(0 TO 63);  -- data output
      valid_o     : OUT std_logic                   -- output data valid flag
    );
  end component des;


  signal s_ready         : std_logic;
  signal s_mode          : std_logic;
  signal s_des2_mode     : std_logic;
  signal s_des1_validin  : std_logic := '0';
  signal s_des1_validout : std_logic;
  signal s_des2_validout : std_logic;
  signal s_des3_validout : std_logic;
  signal s_key1          : std_logic_vector(0 to 63);
  signal s_key2          : std_logic_vector(0 to 63);
  signal s_key3          : std_logic_vector(0 to 63);
  signal s_des1_key      : std_logic_vector(0 to 63);
  signal s_des3_key      : std_logic_vector(0 to 63);
  signal s_des1_dataout  : std_logic_vector(0 to 63);
  signal s_des2_dataout  : std_logic_vector(0 to 63);

begin


  ready_o        <= s_ready;
  valid_o        <= s_des3_validout;
  s_des2_mode    <= not(s_mode);
  s_des1_validin <= valid_i and s_ready;

  s_des1_key <= key1_i when mode_i = '0' else key3_i;
  s_des3_key <= s_key3 when s_mode = '0' else s_key1;


  inputregister : process(clk_i, reset_i) is
  begin
    if(reset_i = '0') then
      s_mode  <= '0';
      s_key1  <= (others => '0');
      s_key2  <= (others => '0');
      s_key3  <= (others => '0');
    elsif(rising_edge(clk_i)) then
      if(valid_i = '1' and s_ready = '1') then
        s_mode <= mode_i;
        s_key1 <= key1_i;
        s_key2 <= key2_i;
        s_key3 <= key3_i;
      end if;
    end if;
  end process inputregister;


  outputregister : process(clk_i, reset_i) is
  begin
    if(reset_i = '0') then
      s_ready   <= '1';
    elsif(rising_edge(clk_i)) then
      if(valid_i = '1' and s_ready = '1') then
        s_ready <= '0';
      end if;
      if(s_des3_validout = '1') then
        s_ready   <= '1';
      end if;
    end if;
  end process outputregister;


  i1_des : des
    port map (
      reset_i => reset_i,
      clk_i   => clk_i,
      mode_i  => mode_i,
      key_i   => s_des1_key,
      data_i  => data_i,
      valid_i => s_des1_validin,
      data_o  => s_des1_dataout,
      valid_o => s_des1_validout
    );


  i2_des : des
    port map (
      reset_i => reset_i,
      clk_i   => clk_i,
      mode_i  => s_des2_mode,
      key_i   => s_key2,
      data_i  => s_des1_dataout,
      valid_i => s_des1_validout,
      data_o  => s_des2_dataout,
      valid_o => s_des2_validout
    );


  i3_des : des
    port map (
      reset_i => reset_i,
      clk_i   => clk_i,
      mode_i  => s_mode,
      key_i   => s_des3_key,
      data_i  => s_des2_dataout,
      valid_i => s_des2_validout,
      data_o  => data_o,
      valid_o => s_des3_validout
    );


end architecture rtl;
