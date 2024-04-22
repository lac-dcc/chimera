-- ======================================================================
-- CBC-MAC-DES
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
  use work.des_pkg.all;



entity cbcmac_des is
  port (
    reset_i     : in  std_logic;                  -- low active async reset
    clk_i       : in  std_logic;                  -- clock
    start_i     : in  std_logic;                  -- start cbc
    key_i       : in  std_logic_vector(0 to 63);  -- key input
    data_i      : in  std_logic_vector(0 to 63);  -- data input
    valid_i     : in  std_logic;                  -- input key/data valid flag
    accept_o    : out std_logic;                  -- input accept
    data_o      : out std_logic_vector(0 tO 63);  -- data output
    valid_o     : out std_logic;                  -- output data valid flag
    accept_i    : in  std_logic                   -- output accept
  );
end entity cbcmac_des;



architecture rtl of cbcmac_des is


  component des is
    generic (
      design_type : string := "ITER"
    );
    port (
      reset_i     : in  std_logic;
      clk_i       : in  std_logic;
      mode_i      : in  std_logic;
      key_i       : in  std_logic_vector(0 to 63);
      data_i      : in  std_logic_vector(0 to 63);
      valid_i     : in  std_logic;
      accept_o    : out std_logic;
      data_o      : out std_logic_vector(0 to 63);
      valid_o     : out std_logic;
      accept_i    : in  std_logic
    );
  end component des;

  -- CBCMAC must have fix IV for security reasons
  constant C_IV : std_logic_vector(0 to 63) := (others => '0');

  signal s_des_datain    : std_logic_vector(0 to 63);
  signal s_des_dataout   : std_logic_vector(0 to 63);
  signal s_des_dataout_d : std_logic_vector(0 to 63);
  signal s_des_key       : std_logic_vector(0 to 63);
  signal s_key           : std_logic_vector(0 to 63);
  signal s_des_accept    : std_logic;
  signal s_des_validout  : std_logic;


begin


  s_des_datain <= C_IV xor data_i when start_i = '1' else
                  s_des_dataout_d xor data_i;

  data_o <= s_des_dataout;

  s_des_key <= key_i when start_i = '1' else s_key;

  accept_o <= s_des_accept;

  valid_o <= s_des_validout;


  inputregister : process(clk_i, reset_i) is
  begin
    if(reset_i = '0') then
      s_key <= (others => '0');
    elsif(rising_edge(clk_i)) then
      if(valid_i = '1' and s_des_accept = '1' and start_i = '1') then
        s_key <= key_i;
      end if;
    end if;
  end process inputregister;


  outputregister : process(clk_i, reset_i) is
  begin
    if(reset_i = '0') then
      s_des_dataout_d <= (others => '0');
    elsif(rising_edge(clk_i)) then
      if(s_des_validout = '1') then
        s_des_dataout_d <= s_des_dataout;
      end if;
    end if;
  end process outputregister;


  i_des : des
    generic map (
      design_type => "ITER"
    )
    port map (
      reset_i  => reset_i,
      clk_i    => clk_i,
      mode_i   => '0',
      key_i    => s_des_key,
      data_i   => s_des_datain,
      valid_i  => valid_i,
      accept_o => s_des_accept,
      data_o   => s_des_dataout,
      valid_o  => s_des_validout,
      accept_i => accept_i
    );


end architecture rtl;
