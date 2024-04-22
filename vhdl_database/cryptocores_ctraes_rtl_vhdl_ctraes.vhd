-- ======================================================================
-- CTR-AES
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



entity ctraes is
  generic (
    NONCE_WIDTH : natural range 64 to 96 := 96
  );
  port (
    reset_i     : in  std_logic;                             -- low active async reset
    clk_i       : in  std_logic;                             -- clock
    start_i     : in  std_logic;                             -- start ctr
    nonce_i     : in  std_logic_vector(0 to NONCE_WIDTH-1);  -- nonce
    key_i       : in  std_logic_vector(0 to 127);            -- key input
    data_i      : in  std_logic_vector(0 to 127);            -- data input
    valid_i     : in  std_logic;                             -- input key/data valid flag
    accept_o    : out std_logic;                             -- input accept
    data_o      : out std_logic_vector(0 tO 127);            -- data output
    valid_o     : out std_logic;                             -- output data valid flag
    accept_i    : in  std_logic                              -- output accept
  );
end entity ctraes;



architecture rtl of ctraes is


  signal s_aes_datain    : std_logic_vector(data_i'range);
  signal s_aes_dataout   : std_logic_vector(data_o'range);
  signal s_aes_key       : std_logic_vector(key_i'range);
  signal s_key           : std_logic_vector(key_i'range);
  signal s_nonce         : std_logic_vector(nonce_i'range);
  signal s_data_in       : std_logic_vector(data_i'range);
  signal s_counter       : unsigned(0 to 127-NONCE_WIDTH);


begin


  s_aes_key    <= key_i when start_i = '1' else s_key;
  s_aes_datain <= nonce_i & (s_counter'range => '0') when start_i = '1' else
                  s_nonce & std_logic_vector(s_counter);

  data_o   <= s_aes_dataout xor s_data_in;


  inputreg : process (clk_i, reset_i) is
  begin
    if (reset_i = '0') then
      s_key     <= (others => '0');
      s_nonce   <= (others => '0');
      s_data_in <= (others => '0');
    elsif (rising_edge(clk_i)) then
      if (valid_i = '1' and accept_o = '1') then
        s_data_in <= data_i;
        if (start_i = '1') then
          s_key   <= key_i;
          s_nonce <= nonce_i;
        end if;
      end if;
    end if;
  end process inputreg;


  counterreg : process (clk_i, reset_i) is
  begin
    if (reset_i = '0') then
      s_counter <= (others => '0');
    elsif (rising_edge(clk_i)) then
      if (valid_i = '1' and accept_o = '1') then
        if (start_i = '1') then
          s_counter <= (others => '0');
          s_counter(s_counter'high) <= '1';
        else
          s_counter <= s_counter + 1;
        end if;
      end if;
    end if;
  end process counterreg;


  i_aes_enc : entity work.aes_enc
    generic map (
      design_type => "ITER"
    )
    port map (
      reset_i  => reset_i,
      clk_i    => clk_i,
      key_i    => s_aes_key,
      data_i   => s_aes_datain,
      valid_i  => valid_i,
      accept_o => accept_o,
      data_o   => s_aes_dataout,
      valid_o  => valid_o,
      accept_i => accept_i
    );


end architecture rtl;
