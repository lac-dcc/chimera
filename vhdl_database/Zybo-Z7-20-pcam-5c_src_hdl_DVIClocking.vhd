----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/19/2017 01:46:26 PM
-- Design Name: 
-- Module Name: DVIClocking - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity DVIClocking is
    Port ( PixelClk5X : in STD_LOGIC;
           PixelClk : out STD_LOGIC;
           SerialClk : out STD_LOGIC;
           aLockedIn : in STD_LOGIC;
           aLockedOut : out STD_LOGIC);
end DVIClocking;

architecture Behavioral of DVIClocking is
signal aNotLocked, PixelClkInt : std_logic;
begin

-- 5x fast serial clock
SerialClkBuffer: BUFIO
   port map (
      O => SerialClk, -- 1-bit output: Clock output (connect to I/O clock loads).
      I => PixelClk5X  -- 1-bit input: Clock input (connect to an IBUF or BUFMR).
   );
-- 1x slow parallel clock
PixelClkBuffer: BUFR
   generic map (
      BUFR_DIVIDE => "5",   -- Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8" 
      SIM_DEVICE => "7SERIES"  -- Must be set to "7SERIES" 
   )
   port map (
      O => PixelClkInt,     -- 1-bit output: Clock output port
      CE => '1',   -- 1-bit input: Active high, clock enable (Divided modes only)
      CLR => aNotLocked, -- 1-bit input: Active high, asynchronous clear (Divided modes only)        
      I => PixelClk5X      -- 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
   );     

aNotLocked <= not aLockedIn;

SyncLockedOut: entity work.ResetBridge
   generic map (
      kPolarity => '0')
   port map (
      aRst => aLockedIn,
      OutClk => PixelClkInt,
      oRst => aLockedOut);

PixelClk <= PixelClkInt;
   
end Behavioral;
