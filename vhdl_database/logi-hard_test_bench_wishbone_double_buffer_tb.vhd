--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:24:24 01/16/2014
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-hard/test_bench/wishbone_double_buffer_tb.vhd
-- Project Name:  logibone-wishbone
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: wishbone_double_buffer
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
 
ENTITY wishbone_double_buffer_tb IS
END wishbone_double_buffer_tb;
 
ARCHITECTURE behavior OF wishbone_double_buffer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT wishbone_double_buffer
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
         write_buffer : IN  std_logic;
         buffer_index : OUT  std_logic;
         buffer_full : OUT  std_logic;
         buffer_input : IN  std_logic_vector(15 downto 0)
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
   signal write_buffer : std_logic := '0';
   signal buffer_input : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal wbs_readdata : std_logic_vector(15 downto 0);
   signal wbs_ack : std_logic;
   signal buffer_index : std_logic;
   signal buffer_full : std_logic;

   -- Clock period definitions
   constant gls_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wishbone_double_buffer PORT MAP (
          gls_reset => gls_reset,
          gls_clk => gls_clk,
          wbs_address => wbs_address,
          wbs_writedata => wbs_writedata,
          wbs_readdata => wbs_readdata,
          wbs_strobe => wbs_strobe,
          wbs_cycle => wbs_cycle,
          wbs_write => wbs_write,
          wbs_ack => wbs_ack,
          write_buffer => write_buffer,
          buffer_index => buffer_index,
          buffer_full => buffer_full,
          buffer_input => buffer_input
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

		while true loop
			write_buffer <= '1' ;
			wait for gls_clk_period;
		end loop ;
			
      -- insert stimulus here 

      wait;
   end process;

END;
