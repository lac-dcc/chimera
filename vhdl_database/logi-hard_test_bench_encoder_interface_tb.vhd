--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:14:41 05/12/2014
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-hard/test_bench/encoder_interface_tb.vhd
-- Project Name:  test_ugv
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: encoder_interface
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
 
ENTITY encoder_interface_tb IS
END encoder_interface_tb;
 
ARCHITECTURE behavior OF encoder_interface_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT encoder_interface
	 generic(FREQ_DIV : positive := 100; SINGLE_CHANNEL : boolean := true);
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         channel_a : IN  std_logic;
         channel_b : IN  std_logic;
         period : OUT  std_logic_vector(15 downto 0);
         reset_count : IN  std_logic;
         count : OUT  std_logic_vector(15 downto 0);
         pv : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal channel_a : std_logic := '0';
   signal channel_b : std_logic := '0';
   signal reset_count : std_logic := '0';

 	--Outputs
   signal period : std_logic_vector(15 downto 0);
   signal count : std_logic_vector(15 downto 0);
   signal pv : std_logic;
   signal dir : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	constant enc_period : time := 10 us ;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: encoder_interface 
	generic map(SINGLE_CHANNEL => false)
	PORT MAP (
          clk => clk,
          reset => reset,
          channel_a => channel_a,
          channel_b => channel_b,
          period => period,
          reset_count => reset_count,
          count => count,
          pv => pv
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
		reset <= '1' ;
		channel_a <= '0' ;
		channel_b <= '0' ;
		reset_count <= '0' ;
      wait for 100 ns;	
		reset <= '0' ;
      wait for clk_period*10;
		for i in 0 to 10 loop
			channel_a <= '1' ;
			channel_b <= '0' ;
			wait for enc_period/4;
			channel_b <= '1' ;
			wait for enc_period/4;
			channel_a <= '0' ;
			wait for enc_period/4;
			channel_b <= '0' ;
			wait for enc_period/4;
		end loop ;
		
		wait for enc_period*2;
		
		for i in 0 to 10 loop
			channel_a <= '0' ;
			channel_b <= '1' ;
			wait for enc_period/4;
			channel_a <= '1' ;
			wait for enc_period/4;
			channel_b <= '0' ;
			wait for enc_period/4;
			channel_a <= '0' ;
			wait for enc_period/4;
		end loop ;

      -- insert stimulus here 

      wait;
   end process;

END;
