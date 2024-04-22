--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:42:29 05/23/2014
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-projects/logi-ugv/hw/logipi/hdl/l3gd20_tb.vhd
-- Project Name:  test_ugv
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: l3gd20_interface
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
 
ENTITY l3gd20_tb IS
END l3gd20_tb;
 
ARCHITECTURE behavior OF l3gd20_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT l3gd20_interface
	 GENERIC(CLK_DIV : positive := 100;
		  SAMPLING_DIV : positive := 1_000_000;
		  POL : std_logic := '0');
    PORT(
         clk : IN  std_logic;
         resetn : IN  std_logic;
         sample_x : OUT  std_logic_vector(15 downto 0);
         sample_y : OUT  std_logic_vector(15 downto 0);
         sample_z : OUT  std_logic_vector(15 downto 0);
         dv : OUT  std_logic;
         DOUT : OUT  std_logic;
         DIN : IN  std_logic;
         SCLK : OUT  std_logic;
         SSN : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal DIN : std_logic := '0';

 	--Outputs
   signal sample_x : std_logic_vector(15 downto 0);
   signal sample_y : std_logic_vector(15 downto 0);
   signal sample_z : std_logic_vector(15 downto 0);
   signal dv : std_logic;
   signal DOUT : std_logic;
   signal SCLK : std_logic;
   signal SSN : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: l3gd20_interface 
	GENERIC MAP(POL => '1')
	PORT MAP (
          clk => clk,
          resetn => resetn,
          sample_x => sample_x,
          sample_y => sample_y,
          sample_z => sample_z,
          dv => dv,
          DOUT => DOUT,
          DIN => DIN,
          SCLK => SCLK,
          SSN => SSN
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
	variable A : std_logic := '0' ;
   begin		
      -- hold reset state for 100 ns.
		resetn <= '0' ;
      wait for 100 ns;	
		resetn <= '1' ;
      wait for clk_period*10;

		-- config phase
		wait until SSN = '0' ;
		wait until SSN = '1' ;
		
		-- com phase
		wait until SSN = '0' ;
		wait until SCLK = '0' ;
		for i in 0 to 56 loop
			DIN <= A ;
			A := not A ;
			wait until SCLK = '1' ;
			wait until SCLK = '0' ;
		end loop ;
		
		
      -- insert stimulus here 

      wait;
   end process;

END;
