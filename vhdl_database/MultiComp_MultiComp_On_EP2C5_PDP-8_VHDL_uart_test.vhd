--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:04:36 04/21/2014
-- Design Name:   
-- Module Name:   /home/student/PDP8/uart_test.vhd
-- Project Name:  PDP8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UART
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
 
ENTITY uart_test IS
END uart_test;
 
ARCHITECTURE behavior OF uart_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UART
    PORT(
         clk : IN  std_logic;
         rx : IN  std_logic;
         tx : OUT  std_logic;
         clear_3 : IN  std_logic;
         load_3 : IN  std_logic;
         dataout_3 : IN  std_logic_vector(7 downto 0);
         ready_3 : OUT  std_logic;
         clearacc_3 : OUT  std_logic;
         datain_3 : OUT  std_logic_vector(7 downto 0);
         clear_4 : IN  std_logic;
         load_4 : IN  std_logic;
         dataout_4 : IN  std_logic_vector(7 downto 0);
         ready_4 : OUT  std_logic;
         clearacc_4 : OUT  std_logic;
         datain_4 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rx : std_logic;
   signal clear_3 : std_logic := '0';
   signal load_3 : std_logic := '0';
   signal dataout_3 : std_logic_vector(7 downto 0) := (others => '0');
   signal clear_4 : std_logic := '0';
   signal load_4 : std_logic := '0';
   signal dataout_4 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal tx : std_logic;
   signal ready_3 : std_logic;
   signal clearacc_3 : std_logic;
   signal datain_3 : std_logic_vector(7 downto 0);
   signal ready_4 : std_logic;
   signal clearacc_4 : std_logic;
   signal datain_4 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UART PORT MAP (
          clk => clk,
          rx => rx,
          tx => tx,
          clear_3 => clear_3,
          load_3 => load_3,
          dataout_3 => dataout_3,
          ready_3 => ready_3,
          clearacc_3 => clearacc_3,
          datain_3 => datain_3,
          clear_4 => clear_4,
          load_4 => load_4,
          dataout_4 => dataout_4,
          ready_4 => ready_4,
          clearacc_4 => clearacc_4,
          datain_4 => datain_4
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   rx <= tx;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		dataout_4 <= "10001110";
		clear_3 <= '1';
		clear_4 <= '1';
		wait for clk_period;
		clear_3 <= '0';
		clear_4 <= '0';
		load_4 <= '1';
		wait for clk_period;
		load_4 <= '0';
		wait until ready_3='1' and ready_4='1' and rising_edge(clk);
		wait for clk_period/2;
		clear_3 <= '1';
		clear_4 <= '1';
		wait for clk_period;
		clear_3 <= '0';
		clear_4 <= '0';
		load_3 <= '1';
		load_4 <= '1';
		dataout_4 <= "01110001";
		wait for clk_period;
		load_3 <= '0';
		load_4 <= '0';
		dataout_4 <= "00000000";
	   wait for 1.1 ms;
		wait;
   end process;

END;
