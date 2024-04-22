--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:24:54 06/03/2016
-- Design Name:   
-- Module Name:   /home/inmcm/Dev/speck/MUX_SYNCHRONIZER_TB.vhd
-- Project Name:  speck
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_SYNCHRONIZER
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
 
ENTITY MUX_SYNCHRONIZER_TB IS
END MUX_SYNCHRONIZER_TB;
 
ARCHITECTURE behavior OF MUX_SYNCHRONIZER_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_SYNCHRONIZER
    PORT(
         CLK_A : IN  std_logic;
         CLK_B : IN  std_logic;
         RST : IN  std_logic;
         DATA_BUS_A_IN : IN  std_logic_vector(127 downto 0);
         DATA_BUS_B_OUT : OUT  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_A : std_logic := '0';
   signal CLK_B : std_logic := '0';
   signal RST : std_logic := '0';
   signal DATA_BUS_A_IN : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal DATA_BUS_B_OUT_1 : std_logic_vector(127 downto 0);
	signal DATA_BUS_B_OUT_2 : std_logic_vector(127 downto 0);

   -- Clock period definitions
   constant CLK_A_period : time := 20 ns;
   constant CLK_B_period : time := 3500 ps;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut_1: MUX_SYNCHRONIZER PORT MAP (
          CLK_A => CLK_A,
          CLK_B => CLK_B,
          RST => RST,
          DATA_BUS_A_IN => DATA_BUS_A_IN,
          DATA_BUS_B_OUT => DATA_BUS_B_OUT_1
    );
	 
	 
	-- Instantiate the Unit Under Test (UUT)
   uut_2: MUX_SYNCHRONIZER PORT MAP (
          CLK_A => CLK_B,
          CLK_B => CLK_A,
          RST => RST,
          DATA_BUS_A_IN => DATA_BUS_A_IN,
          DATA_BUS_B_OUT => DATA_BUS_B_OUT_2
    );

   -- Clock process definitions
   CLK_A_process :process
   begin
		CLK_A <= '0';
		wait for CLK_A_period/2;
		CLK_A <= '1';
		wait for CLK_A_period/2;
   end process;
 
   CLK_B_process :process
   begin
		CLK_B <= '0';
		wait for CLK_B_period/2;
		CLK_B <= '1';
		wait for CLK_B_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 400 ns;	

		DATA_BUS_A_IN <= X"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";

      wait for CLK_A_period*10;
		
		RST <= '1';
		
		wait for CLK_A_period*10;
		
		DATA_BUS_A_IN <= X"123456789ABCDEF00FEDCBA987654321";
		
		wait for CLK_A_period*10;
		
		RST <= '0';
		
		wait for CLK_A_period*50;
		
		DATA_BUS_A_IN <= X"CACACACACACACACACACACACACACACACA";
		
		wait for CLK_A_period*50;
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
