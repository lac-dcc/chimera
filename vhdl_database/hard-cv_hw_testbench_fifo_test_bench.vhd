--------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com>
--
-- Create Date:   11:29:30 03/01/2012
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/projects/fpga-cam/hdl/fifo_test_bench.vhd
-- Project Name:  SPARTCAM
-- Target Device:  
-- Tool versions: ISE 14.1  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fifo_64x8
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
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY fifo_test_bench IS
END fifo_test_bench;
 
ARCHITECTURE behavior OF fifo_test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fifo_Nx8
	 GENERIC(N : natural := 64);
    PORT(
         clk : IN  std_logic;
         resetn : IN  std_logic;
         wr : IN  std_logic;
         rd : IN  std_logic;
         empty : OUT  std_logic;
         full : OUT  std_logic;
         data_rdy : OUT  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0);
         data_in : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal wr : std_logic := '0';
   signal rd : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal empty : std_logic;
   signal full : std_logic;
   signal data_rdy : std_logic;
   signal data_out : std_logic_vector(7 downto 0);
	
	signal data_stimuli : std_logic_vector(7 downto 0) := "00000000" ;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	constant loop_range : natural := 100;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fifo_Nx8 
			GENERIC MAP(N => 64)
			PORT MAP (
          clk => clk,
          resetn => resetn,
          wr => wr,
          rd => rd,
          empty => empty,
          full => full,
          data_rdy => data_rdy,
          data_out => data_out,
          data_in => data_in
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
		resetn <=  '0' ;
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		resetn <=  '1' ;
		wait for clk_period;
		FOR j IN 0 to loop_range LOOP
			data_in <= data_stimuli ;
			wr <= '1' ;
			WAIT FOR clk_period;
			data_stimuli <= data_stimuli + 1 ;
		END LOOP;
		wr <= '0' ;
		rd <= '1' ;
		wait for loop_range*clk_period;
      wait;
   end process;

END;
