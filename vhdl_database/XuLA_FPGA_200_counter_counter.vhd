----------------------------------------------------------------------------------
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
-- 02111-1307, USA.
--
-- ©1997-2010 - X Engineering Software Systems Corp. (www.xess.com)
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- A simple counter for testing purposes.
----------------------------------------------------------------------------------


library IEEE, XESS;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use XESS.ClkGenPckg.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity counter is
  port (
    fpgaClk_i : in  std_logic;          -- clock input
    chan_io   : out std_logic_vector(31 downto 0)
    );
end counter;


architecture Behavioral of counter is
  signal clk_s : std_logic;
  signal cnt_r : std_logic_vector(25 downto 0);
begin

  -- Multiply the clock from 12 MHz up to 100 MHz.
  u0 : ClkGen port map (I => fpgaClk_i, O => clk_s);

  process(clk_s)
  begin
    if rising_edge(clk_s) then
      cnt_r <= cnt_r + 1;
    end if;
  end process;

  -- Map the counter bits to the prototyping header pins.
  -- (This is complicated because some of the proto-header pins are input-only.)
  chan_io(1 downto 0)   <= cnt_r(1 downto 0);
  chan_io(8 downto 3)   <= cnt_r(7 downto 2);
  chan_io(11 downto 10) <= cnt_r(9 downto 8);
  chan_io(18 downto 13) <= cnt_r(15 downto 10);
  chan_io(23 downto 20) <= cnt_r(19 downto 16);
  chan_io(26 downto 25) <= cnt_r(21 downto 20);
  chan_io(31 downto 28) <= cnt_r(25 downto 22);

end Behavioral;
