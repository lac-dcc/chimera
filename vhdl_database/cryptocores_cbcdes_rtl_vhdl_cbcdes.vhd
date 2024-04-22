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


-- Revision 0.1  2011/09/23
-- Initial release, incomplete and may contain bugs
-- Revision 0.2  2011/10/06
-- corrected some bugs which were found while testing cbc ability


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.des_pkg.all;


entity cbcdes is
  port (
    reset_i     : in  std_logic;                  -- low active async reset
    clk_i       : in  std_logic;                  -- clock
    start_i     : in  std_logic;                  -- start cbc
    mode_i      : in  std_logic;                  -- des-modus: 0 = encrypt, 1 = decrypt
    key_i       : in  std_logic_vector(0 to 63);  -- key input
    iv_i        : in  std_logic_vector(0 to 63);  -- iv input
    data_i      : in  std_logic_vector(0 to 63);  -- data input
    valid_i     : in  std_logic;                  -- input key/data valid flag
    accept_o    : out std_logic;                  -- ready to encrypt/decrypt
    data_o      : out std_logic_vector(0 to 63);  -- data output
    valid_o     : out std_logic;                   -- output data valid flag
    accept_i    : in  std_logic
  );
end entity cbcdes;


architecture rtl of cbcdes is


  signal s_mode       : std_logic;
  signal s_des_mode   : std_logic;
  signal s_start      : std_logic;
  signal s_key        : std_logic_vector(0 to 63);
  signal s_des_key    : std_logic_vector(0 to 63);
  signal s_iv         : std_logic_vector(0 to 63);
  signal s_datain     : std_logic_vector(0 to 63);
  signal s_datain_d   : std_logic_vector(0 to 63);
  signal s_des_datain : std_logic_vector(0 to 63);
  signal s_des_dataout : std_logic_vector(0 to 63);
  signal s_dataout    : std_logic_vector(0 to 63);


begin


  s_des_datain <= iv_i      xor data_i when mode_i = '0' and start_i = '1' else
                  s_dataout xor data_i when s_mode = '0' and start_i = '0' else
                  data_i;
  data_o       <= s_iv       xor s_des_dataout when s_mode = '1' and s_start = '1' else
                  s_datain_d xor s_des_dataout when s_mode = '1' and s_start = '0' else
                  s_des_dataout;
  s_des_key    <= key_i  when start_i = '1' else s_key;
  s_des_mode   <= mode_i when start_i = '1' else s_mode;


  inputregister : process (clk_i, reset_i) is
  begin
    if (reset_i = '0') then
      s_mode     <= '0';
      s_start    <= '0';
      s_key      <= (others => '0');
      s_iv       <= (others => '0');
      s_datain   <= (others => '0');
      s_datain_d <= (others => '0');
    elsif (rising_edge(clk_i)) then
      if (valid_i = '1' and accept_o = '1') then
        s_start    <= start_i;
        s_datain   <= data_i;
        s_datain_d <= s_datain;
        if (start_i = '1') then
          s_mode <= mode_i;
          s_key  <= key_i;
          s_iv   <= iv_i;
        end if;
      end if;
    end if;
  end process inputregister;


  outputregister : process (clk_i, reset_i) is
  begin
    if (reset_i = '0') then
      s_dataout <= (others => '0');
    elsif (rising_edge(clk_i)) then
      if (valid_o = '1' and accept_i = '1') then
        s_dataout <= s_des_dataout;
      end if;
    end if;
  end process outputregister;


  i_des : entity work.des
    port map (
      reset_i  => reset_i,
      clk_i    => clk_i,
      mode_i   => s_des_mode,
      key_i    => s_des_key,
      data_i   => s_des_datain,
      valid_i  => valid_i,
      accept_o => accept_o,
      data_o   => s_des_dataout,
      valid_o  => valid_o,
      accept_i => accept_i
    );


end architecture rtl;
