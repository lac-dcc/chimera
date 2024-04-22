--**********************************************************************
-- Copyright 2014 by XESS Corp <http://www.xess.com>.
-- All rights reserved.

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--**********************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity fast_blinker is
  port (clk_i      : in  std_logic;
         blinker_o : out std_logic);
end fast_blinker;

architecture Behavioral of fast_blinker is
  signal clk_fast : std_logic;
  signal cnt_r    : std_logic_vector(22 downto 0) := (others => '0');
begin

  DCM_SP_inst : DCM_SP
    generic map (
      CLKFX_DIVIDE   => 1,              --  Can be any interger from 1 to 32
      CLKFX_MULTIPLY => 4               --  Can be any integer from 1 to 32
      )
    port map (
      CLKFX => clk_fast,                -- DCM CLK synthesis out (M/D)
      CLKIN => clk_i,       -- Clock input (from IBUFG, BUFG or DCM)
      RST   => '0'                      -- No reset
      );

  process(clk_fast) is
  begin
    if rising_edge(clk_fast) then
      cnt_r <= cnt_r + 1;
    end if;
  end process;

  blinker_o <= cnt_r(22);

end Behavioral;

