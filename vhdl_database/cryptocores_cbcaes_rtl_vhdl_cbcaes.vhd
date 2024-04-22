-- ======================================================================
-- CBC-AES encryption/decryption
-- Copyright (C) 2021 Torsten Meissner
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



entity cbcaes is
  port (
    reset_i     : in  std_logic;                   -- low active async reset
    clk_i       : in  std_logic;                   -- clock
    start_i     : in  std_logic;                   -- start cbc
    mode_i      : in  std_logic;                   -- aes-modus: 0 = encrypt, 1 = decrypt
    key_i       : in  std_logic_vector(0 to 127);  -- key input
    iv_i        : in  std_logic_vector(0 to 127);  -- iv input
    data_i      : in  std_logic_vector(0 to 127);  -- data input
    valid_i     : in  std_logic;                   -- input key/data valid flag
    accept_o    : out std_logic;                   -- ready to encrypt/decrypt
    data_o      : out std_logic_vector(0 to 127);  -- data output
    valid_o     : out std_logic;                   -- output data valid flag
    accept_i    : in  std_logic
  );
end entity cbcaes;



architecture rtl of cbcaes is


  signal s_mode        : std_logic;
  signal s_aes_mode    : std_logic;
  signal s_start       : std_logic;
  signal s_key         : std_logic_vector(0 to 127);
  signal s_aes_key     : std_logic_vector(0 to 127);
  signal s_iv          : std_logic_vector(0 to 127);
  signal s_datain      : std_logic_vector(0 to 127);
  signal s_datain_d    : std_logic_vector(0 to 127);
  signal s_aes_datain  : std_logic_vector(0 to 127);
  signal s_aes_dataout : std_logic_vector(0 to 127);
  signal s_dataout     : std_logic_vector(0 to 127);


begin


  s_aes_datain <= iv_i      xor data_i when mode_i = '0' and start_i = '1' else
                  s_dataout xor data_i when s_mode = '0' and start_i = '0' else
                  data_i;
  data_o       <= s_iv       xor s_aes_dataout when s_mode = '1' and s_start = '1' else
                  s_datain_d xor s_aes_dataout when s_mode = '1' and s_start = '0' else
                  s_aes_dataout;
  s_aes_key    <= key_i  when start_i = '1' else s_key;
  s_aes_mode   <= mode_i when start_i = '1' else s_mode;


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
        s_dataout <= s_aes_dataout;
      end if;
    end if;
  end process outputregister;


  i_aes : entity work.aes
    generic map (
      design_type => "ITER"
    )
    port map (
      reset_i  => reset_i,
      clk_i    => clk_i,
      mode_i   => s_aes_mode,
      key_i    => s_aes_key,
      data_i   => s_aes_datain,
      valid_i  => valid_i,
      accept_o => accept_o,
      data_o   => s_aes_dataout,
      valid_o  => valid_o,
      accept_i => accept_i
    );


end architecture rtl;
