--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:25:33 06/13/2021
-- Design Name:   
-- Module Name:   F:/urjc/proyectos/jderobot/fpga-robot/Blocks/General_Blocks/spi/alhambra_ii/spi_controller/tb_testbtn.vhd
-- Project Name:  spi_controller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: btntest_spi_controller
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
 
ENTITY tb_testbtn IS
END tb_testbtn;
 
ARCHITECTURE behavior OF tb_testbtn IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT btntest_spi_controller
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         btn2 : IN  std_logic;
         sclk_o : OUT  std_logic;
         miso_i : IN  std_logic;
         mosi_o : OUT  std_logic;
         spi_ss_n : OUT  std_logic;
         rpi_running : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal btn2 : std_logic := '0';
   signal miso_i : std_logic := '0';

 	--Outputs
   signal sclk_o : std_logic;
   signal mosi_o : std_logic;
   signal spi_ss_n : std_logic;
   signal rpi_running : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: btntest_spi_controller PORT MAP (
          clk => clk,
          rst => rst,
          btn2 => btn2,
          sclk_o => sclk_o,
          miso_i => miso_i,
          mosi_o => mosi_o,
          spi_ss_n => spi_ss_n,
          rpi_running => rpi_running
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
      rst <= '1';
      wait for 103 ns;	
      rst <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
     wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
     wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
     wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
		     wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
     wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
     wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
     wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
     wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';
      wait for clk_period*10;
      btn2 <= '1';
      wait for clk_period*10;
      btn2 <= '0';



      wait;
   end process;

END;
