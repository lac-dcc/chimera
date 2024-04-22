--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:58:59 03/05/2014
-- Design Name:   
-- Module Name:   C:/Users/Tim/Documents/Source/onebitdac/uart_rx_tb.vhd
-- Project Name:  onebitdac
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: uart_rx
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
 
ENTITY uart_rx_tb IS
END uart_rx_tb;
 
ARCHITECTURE behavior OF uart_rx_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart_rx
	 generic(
			baud_divider : integer := 434
		);
    PORT(
         clk : IN  std_logic;
         din : IN  std_logic;
         dout : OUT  std_logic_vector(7 downto 0);
         done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal din : std_logic := '0';

 	--Outputs
   signal dout : std_logic_vector(7 downto 0);
   signal done : std_logic;

	signal finished : boolean := false;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	constant bit_period : time := 0.00868055555555555555555555555556 ms;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uart_rx PORT MAP (
          clk => clk,
          din => din,
          dout => dout,
          done => done
        );

   -- Clock process definitions
	clk <= '0' when finished else not clk after clk_period / 2;

   -- Stimulus process
   stim_proc: process
   begin		
      wait for clk_period*10;
		
		-- start bit
		din <= '0';
		wait for bit_period ;
		
		-- bit 0
		din <= '1';
		wait for bit_period;
		
		-- 1
		din <= '1';
		wait for bit_period;
		
		-- 2
		din <= '1';
		wait for bit_period;
		
		-- 3
		din <= '1';
		wait for bit_period;

		-- 3
		din <= '0';
		wait for bit_period;

		-- 4
		din <= '1';
		wait for bit_period;

		-- 5
		din <= '1';
		wait for bit_period;

		-- 6
		din <= '0';
		wait for bit_period;

		-- 7
		din <= '0';
		wait for bit_period;

		-- stop
		din <= '1';
		wait for bit_period;

		finished <= true;
      wait;
   end process;

END;
