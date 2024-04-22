---------------------------------------------------------------------------------------------------
-- TDC Encoder Testbench
-- Version: 1.0
--
-- Author: Michel Adamic
-- Created: 23.4.2019
-- Modified: 25.4.2019
--
-- Checks for proper LUT encoding of the 1's counter.
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.MyPkg.all;

---------------------------------------------------------------------------------------------------
entity encoderTb is
end encoderTb;
---------------------------------------------------------------------------------------------------
architecture behavior of encoderTb is 
   
   constant NTaps : integer := 132;  -- multiple of 12
   constant OUT_WIDTH : integer := bitSize(NTaps);
   
   --Inputs
   signal clk : sl := '0'; -- encoder clock
   signal thermo : unsigned(Ntaps-1 downto 0) := (others => '0'); -- thermometer code input

 	--Outputs
   signal sum : slv(OUT_WIDTH-1 downto 0);   -- encoder output

   -- Clock period definitions 
   constant T_C : time := 10.0 ns; -- Clock period constant
---------------------------------------------------------------------------------------------------
begin

   -- Instantiate the Unit Under Test (UUT)
   uut: entity work.encoder
      Generic map (
         NTaps => Ntaps
      )
      PORT MAP (
         clk => clk,
         thermo => std_logic_vector(thermo),
         ones => sum,
         validIn => '0',
         validOut => open
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

      wait for T_C * 10;
      for i in 1 to 63 loop   -- 6 bit LUT test (see Excel file)
         thermo <= thermo + 1;
         wait for T_C;
      end loop;
      
      wait for T_C*5;
      thermo <= (others => '0');
      wait for T_C*2;
      
      for i in 0 to NTaps loop   -- thermometer code test
         thermo <= thermo(thermo'left - 1 downto 0) & '1';   -- shift 1's into the code
         wait for T_C;
      end loop;
      
      wait for T_C*5;
      
      -- Stop simulation
      assert false report "SIMULATION COMPLETED" severity failure;
      
   end process;
end behavior;
---------------------------------------------------------------------------------------------------