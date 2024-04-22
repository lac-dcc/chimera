--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:53:46 07/25/2014
-- Design Name:   
-- Module Name:   C:/EE331Winter2014/PDP8_Nexys4/PDP8_Nexys4/pdp8_test.vhd
-- Project Name:  PDP8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pdp8
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY pdp8_test IS
END pdp8_test;
 
ARCHITECTURE behavior OF pdp8_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pdp8
    PORT(
         clk : IN  std_logic;
         sw : IN  std_logic_vector(15 downto 0);
         btnc : IN  std_logic;
         btnu : IN  std_logic;
         btnd : IN  std_logic;
         btnl : IN  std_logic;
         btnr : IN  std_logic;
         btnCpuReset : IN  std_logic;
         seg : OUT  std_logic_vector(7 downto 0);
         an : OUT  std_logic_vector(7 downto 0);
         led : OUT  std_logic_vector(15 downto 0);
         RsRx : IN  std_logic;
         RsTx : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal sw : std_logic_vector(15 downto 0) := (others => '0');
   signal btnc : std_logic := '0';
   signal btnu : std_logic := '0';
   signal btnd : std_logic := '0';
   signal btnl : std_logic := '0';
   signal btnr : std_logic := '0';
   signal btnCpuReset : std_logic := '1';
   signal RsRx : std_logic := '0';

 	--Outputs
   signal seg : std_logic_vector(7 downto 0);
   signal an : std_logic_vector(7 downto 0);
   signal led : std_logic_vector(15 downto 0);
   signal RsTx : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pdp8 PORT MAP (
          clk => clk,
          sw => sw,
          btnc => btnc,
          btnu => btnu,
          btnd => btnd,
          btnl => btnl,
          btnr => btnr,
          btnCpuReset => btnCpuReset,
          seg => seg,
          an => an,
          led => led,
          RsRx => RsRx,
          RsTx => RsTx
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*1000;

      -- insert stimulus here 

      wait;
   end process;

END;
