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
-- ©2011 - X Engineering Software Systems Corp. (www.xess.com)
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Module for generating a clock frequency from a master clock.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ClkGenPckg is

  component ClkGen is
    generic (
      BASE_FREQ_G : real                  := 12.0;  -- Input frequency in MHz.
      CLK_MUL_G   : natural range 1 to 32 := 25;    -- Frequency multiplier.
      CLK_DIV_G   : natural range 1 to 32 := 3      -- Frequency divider.
      );
    port (
      i : in  std_logic;  -- Clock input (12 MHz by default).
      o : out std_logic   -- Generated clock output (100 MHz by default).
      );
  end component;

end package;


library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ClkGen is
  generic (
    BASE_FREQ_G : real                  := 12.0;  -- Input frequency in MHz.
    CLK_MUL_G   : natural range 1 to 32 := 25;    -- Frequency multiplier.
    CLK_DIV_G   : natural range 1 to 32 := 3      -- Frequency divider.
    );
  port (
    i : in  std_logic;  -- Clock input (12 MHz by default).
    o : out std_logic   -- Generated clock output (100 MHz by default).
    );
end entity;

architecture arch of ClkGen is
begin

  u0 : DCM_SP
    generic map (
      CLKDV_DIVIDE          => 2.0,
      CLKFX_DIVIDE          => CLK_DIV_G,  --  Can be any interger from 1 to 32
      CLKFX_MULTIPLY        => CLK_MUL_G,  --  Can be any integer from 1 to 32
      CLKIN_DIVIDE_BY_2     => false,  --  TRUE/FALSE to enable CLKIN divide by two feature
      CLKIN_PERIOD          => 1000.0 / BASE_FREQ_G,  --  Specify period of input clock in ns
      CLKOUT_PHASE_SHIFT    => "NONE",  --  Specify phase shift of NONE, FIXED or VARIABLE
      CLK_FEEDBACK          => "NONE",  --  Specify clock feedback of NONE, 1X or 2X
      DESKEW_ADJUST         => "SYSTEM_SYNCHRONOUS",
      DLL_FREQUENCY_MODE    => "LOW",   --  HIGH or LOW frequency mode for DLL
      DUTY_CYCLE_CORRECTION => true,   --  Duty cycle correction, TRUE or FALSE
      PHASE_SHIFT           => 0,  --  Amount of fixed phase shift from -255 to 255
      STARTUP_WAIT          => false)  --  Delay configuration DONE until DCM LOCK, TRUE/FALSE
    port map (
      RST   => '0',                     -- DCM asynchronous reset input
      CLKIN => i,                       -- Clock input (from IBUFG, BUFG or DCM)
      CLKFX => o                        -- Generated clock output
      );

end architecture;
