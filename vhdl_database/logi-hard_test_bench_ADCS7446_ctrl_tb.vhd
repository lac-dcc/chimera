--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:47:26 09/30/2014
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-hard/test_bench/ADCS7446_ctrl_tb.vhd
-- Project Name:  control_bot
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ADCS7476_ctrl
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
 
ENTITY ADCS7446_ctrl_tb IS
END ADCS7446_ctrl_tb;
 
ARCHITECTURE behavior OF ADCS7446_ctrl_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ADCS7476_ctrl
	 generic(clk_period_ns : positive := 10;
		  sclk_period_ns : positive := 40;
			time_between_sample_ns : positive :=20_833
	  );
    PORT(
         clk : IN  std_logic;
         resetn : IN  std_logic;
         sclk : OUT  std_logic;
         ss : OUT  std_logic;
         miso : IN  std_logic;
         sample_out : OUT  std_logic_vector(11 downto 0);
         sample_valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal miso : std_logic := '0';

 	--Outputs
   signal sclk : std_logic;
   signal ss : std_logic;
   signal sample_out : std_logic_vector(11 downto 0);
   signal sample_valid : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant sclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ADCS7476_ctrl 
	generic map(clk_period_ns => 10,
		  sclk_period_ns =>100,
			 time_between_sample_ns => 20833-- 48Khz ...
	)
	PORT MAP (
          clk => clk,
          resetn => resetn,
          sclk => sclk,
          ss => ss,
          miso => miso,
          sample_out => sample_out,
          sample_valid => sample_valid
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
		resetn <= '0' ;
      wait for 100 ns;	
		resetn <= '1' ;
		miso <= '1' ;
		for i in 0 to 16 loop
			wait until sclk = '0';
			miso <= not miso;
			wait until sclk = '1';
		end loop ;
      
		

      -- insert stimulus here 

      wait;
   end process;

END;
