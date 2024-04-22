-- ======================================================================
-- AES encryption/decryption
-- algorithm according to FIPS 197 specification
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

use work.aes_pkg.all;



entity aes is
  generic (
    design_type : string := "ITER"
  );
  port (
    reset_i     : in  std_logic;                   -- async reset
    clk_i       : in  std_logic;                   -- clock
    mode_i      : in  std_logic;                   -- mode: 0 = encrypt, 1 = decrypt
    key_i       : in  std_logic_vector(0 to 127);  -- key input
    data_i      : in  std_logic_vector(0 to 127);  -- data input
    valid_i     : in  std_logic;                   -- input key/data valid flag
    accept_o    : out std_logic;
    data_o      : out std_logic_vector(0 to 127);  -- data output
    valid_o     : out std_logic;                   -- output data valid flag
    accept_i    : in  std_logic
  );
end entity aes;



architecture rtl of aes is


  signal s_mode       : std_logic;
  signal s_accept_enc : std_logic;
  signal s_valid_enc  : std_logic;
  signal s_data_enc   : std_logic_vector(data_o'range);
  signal s_accept_dec : std_logic;
  signal s_valid_dec  : std_logic;
  signal s_data_dec   : std_logic_vector(data_o'range);


begin


  inputregister : process (clk_i, reset_i) is
  begin
    if (reset_i = '0') then
      s_mode  <= '0';
    elsif(rising_edge(clk_i)) then
      if (valid_i = '1' and accept_o = '1') then
        s_mode <= mode_i;
      end if;
    end if;
  end process inputregister;


  accept_o <= s_accept_enc and s_accept_dec;
  data_o   <= s_data_enc  when s_mode = '0' else s_data_dec;
  valid_o  <= s_valid_enc when s_mode = '0' else s_valid_dec;


  i_aes_enc : entity work.aes_enc
  generic map (
    design_type => design_type
  )
  port map (
    reset_i  => reset_i,
    clk_i    => clk_i,
    key_i    => key_i,
    data_i   => data_i,
    valid_i  => valid_i and not mode_i,
    accept_o => s_accept_enc,
    data_o   => s_data_enc,
    valid_o  => s_valid_enc,
    accept_i => accept_i
  );


  i_aes_dec : entity work.aes_dec
  generic map (
    design_type => design_type
  )
  port map (
    reset_i  => reset_i,
    clk_i    => clk_i,
    key_i    => key_i,
    data_i   => data_i,
    valid_i  => valid_i and mode_i,
    accept_o => s_accept_dec,
    data_o   => s_data_dec,
    valid_o  => s_valid_dec,
    accept_i => accept_i
  );


end architecture rtl;
