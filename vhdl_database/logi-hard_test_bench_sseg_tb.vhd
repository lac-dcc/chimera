--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:59:38 03/26/2014
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-hard/test_bench/sseg_tb.vhd
-- Project Name:  logi_edu_test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: wishbone_7seg4x
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
 
ENTITY sseg_tb IS
END sseg_tb;
 
ARCHITECTURE behavior OF sseg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT wishbone_7seg4x
    PORT(
         gls_reset : IN  std_logic;
         gls_clk : IN  std_logic;
         wbs_address : IN  std_logic_vector(15 downto 0);
         wbs_writedata : IN  std_logic_vector(15 downto 0);
         wbs_readdata : OUT  std_logic_vector(15 downto 0);
         wbs_strobe : IN  std_logic;
         wbs_cycle : IN  std_logic;
         wbs_write : IN  std_logic;
         wbs_ack : OUT  std_logic;
         sseg_edu_cathode_out : OUT  std_logic_vector(4 downto 0);
         sseg_edu_anode_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal gls_reset : std_logic := '0';
   signal gls_clk : std_logic := '0';
   signal wbs_address : std_logic_vector(15 downto 0) := (others => '0');
   signal wbs_writedata : std_logic_vector(15 downto 0) := (others => '0');
   signal wbs_strobe : std_logic := '0';
   signal wbs_cycle : std_logic := '0';
   signal wbs_write : std_logic := '0';

 	--Outputs
   signal wbs_readdata : std_logic_vector(15 downto 0);
   signal wbs_ack : std_logic;
   signal sseg_edu_cathode_out : std_logic_vector(4 downto 0);
   signal sseg_edu_anode_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant gls_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wishbone_7seg4x PORT MAP (
          gls_reset => gls_reset,
          gls_clk => gls_clk,
          wbs_address => wbs_address,
          wbs_writedata => wbs_writedata,
          wbs_readdata => wbs_readdata,
          wbs_strobe => wbs_strobe,
          wbs_cycle => wbs_cycle,
          wbs_write => wbs_write,
          wbs_ack => wbs_ack,
          sseg_edu_cathode_out => sseg_edu_cathode_out,
          sseg_edu_anode_out => sseg_edu_anode_out
        );

   -- Clock process definitions
   gls_clk_process :process
   begin
		gls_clk <= '0';
		wait for gls_clk_period/2;
		gls_clk <= '1';
		wait for gls_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		gls_reset <= '1' ;
      wait for 100 ns;	
		gls_reset <= '0' ;
      wait for gls_clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
