---------------------------------------------------------------------------------------------------
-- TDC Coarse counter testbench
-- Version: 1.0
--
-- Author: Michel Adamic
-- Created: 6.5.2019
-- Modified: 6.5.2019
--
-- Checks if the counter runs smoothly.
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counterTb is
end counterTb;

architecture Behavioral of counterTb is

   --Inputs
   signal clk : std_logic := '0';
   
   --Outputs
   constant BITS : integer := 8;    -- counter bit range
   signal coarse : std_logic_vector(BITS-1 downto 0);

   -- Clock period definitions 
   constant T_C : time := 10.0 ns; -- Clock period constant
   
begin

   -- Instantiate the Unit Under Test (UUT)
   uut: entity work.counter
      Generic map (
         BITS => BITS
      )
      PORT MAP (
         clk => clk,
         coarse => coarse
      );
      
   -- Clock generation
      p_SyncClkGen : process
      begin
         clk <= '0';
         wait for T_C/2;
         clk <= '1';
         wait for T_C/2;
      end process;

   -- Simulation
   p_Sim: process
   begin

      wait for T_C * 2**(BITS+1);   -- Take me around the world one more time, James
      
      -- Stop simulation
      assert false report "SIMULATION COMPLETED" severity failure;
      
   end process;
end Behavioral;
