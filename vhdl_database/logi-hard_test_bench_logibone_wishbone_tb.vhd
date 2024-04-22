--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:40:53 10/17/2013
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-projects/logi-wishbone/logibone-hw/logibonone_wishbone_tb.vhd
-- Project Name:  logibone-wishbone
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: logibone_wishbone
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
 
ENTITY logibone_wishbone_tb IS
END logibone_wishbone_tb;
 
ARCHITECTURE behavior OF logibone_wishbone_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT logibone_wishbone
    PORT(
         OSC_FPGA : IN  std_logic;
         PB : IN  std_logic_vector(1 downto 0);
         SW : IN  std_logic_vector(1 downto 0);
         LED : OUT  std_logic_vector(1 downto 0);
         PMOD1 : IN  std_logic_vector(7 downto 0);
         PMOD2 : OUT  std_logic_vector(7 downto 0);
         ARD_SCL : INOUT  std_logic;
         ARD_SDA : INOUT  std_logic;
         GPMC_CSN : IN  std_logic;
         GPMC_BEN : IN  std_logic_vector(1 downto 0);
         GPMC_WEN : IN  std_logic;
         GPMC_OEN : IN  std_logic;
         GPMC_ADVN : IN  std_logic;
         GPMC_CLK : IN  std_logic;
         GPMC_AD : INOUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OSC_FPGA : std_logic := '0';
   signal PB : std_logic_vector(1 downto 0) := (others => '1');
   signal SW : std_logic_vector(1 downto 0) := (others => '0');
   signal PMOD1 : std_logic_vector(7 downto 0) := (others => '0');
   signal GPMC_CSN : std_logic := '0';
   signal GPMC_BEN : std_logic_vector(1 downto 0) := (others => '0');
   signal GPMC_WEN : std_logic := '0';
   signal GPMC_OEN : std_logic := '0';
   signal GPMC_ADVN : std_logic := '0';
   signal GPMC_CLK : std_logic := '0';

	--BiDirs
   signal ARD_SCL : std_logic;
   signal ARD_SDA : std_logic;
   signal GPMC_AD : std_logic_vector(15 downto 0);

 	--Outputs
   signal LED : std_logic_vector(1 downto 0);
   signal PMOD2 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant GPMC_CLK_period : time := 20 ns;
	constant OSC_FPGA_period : time := 8 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: logibone_wishbone PORT MAP (
          OSC_FPGA => OSC_FPGA,
          PB => PB,
          SW => SW,
          LED => LED,
          PMOD1 => PMOD1,
          PMOD2 => PMOD2,
          ARD_SCL => ARD_SCL,
          ARD_SDA => ARD_SDA,
          GPMC_CSN => GPMC_CSN,
          GPMC_BEN => GPMC_BEN,
          GPMC_WEN => GPMC_WEN,
          GPMC_OEN => GPMC_OEN,
          GPMC_ADVN => GPMC_ADVN,
          GPMC_CLK => GPMC_CLK,
          GPMC_AD => GPMC_AD
        );

   -- Clock process definitions
   GPMC_CLK_process :process
   begin
		GPMC_CLK <= '1';
		wait for GPMC_CLK_period/2;
		GPMC_CLK <= '0';
		wait for GPMC_CLK_period/2;
   end process;
 
 
    -- Clock process definitions
   OSC_FPGA_process :process
   begin
		OSC_FPGA <= '0';
		wait for OSC_FPGA_period/2;
		OSC_FPGA <= '1';
		wait for OSC_FPGA_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		GPMC_ADVN <= '1' ;
		GPMC_CSN <= '1' ;
		GPMC_OEN <= '1' ;
		GPMC_WEN <= '1' ;
		GPMC_AD <= (others => 'Z') ;
      --wait for 112 ns;	
      wait for GPMC_CLK_period*10;
		GPMC_ADVN <= '0' ;
		GPMC_CSN <= '0' ;
		GPMC_OEN <= '1' ;
		GPMC_WEN <= '1' ;
		GPMC_AD <= "0000000000000000" ;
		wait for GPMC_CLK_period;
		GPMC_ADVN <= '1' ;
		GPMC_CSN <= '0' ;
		GPMC_OEN <= '0' ;
		GPMC_WEN <= '1' ;
		GPMC_AD <= (others => 'Z') ;
		wait for GPMC_CLK_period*16;
		GPMC_ADVN <= '1' ;
		GPMC_CSN <= '1' ;
		GPMC_OEN <= '1' ;
		GPMC_WEN <= '1' ;
		GPMC_AD <= (others => 'Z') ;
		wait for GPMC_CLK_period*4;
		
		
		
      -- insert stimulus here 

      wait;
   end process;

END;
