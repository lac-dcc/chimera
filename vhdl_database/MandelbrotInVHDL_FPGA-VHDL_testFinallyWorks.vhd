--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:58:42 11/11/2018
-- Design Name:   
-- Module Name:   /home/ttsiod/Xilinx/KB/ZestSC1/Examples/Primes/FPGA-VHDL/testFinallyWorks.vhd
-- Project Name:  Example3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Example3
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
 
ENTITY testFinallyWorks IS
END testFinallyWorks;
 
ARCHITECTURE behavior OF testFinallyWorks IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Example3
    PORT(
         USB_StreamCLK : IN  std_logic;
         USB_StreamFIFOADDR : OUT  std_logic_vector(1 downto 0);
         USB_StreamPKTEND_n : OUT  std_logic;
         USB_StreamFlags_n : IN  std_logic_vector(2 downto 0);
         USB_StreamSLOE_n : OUT  std_logic;
         USB_StreamSLRD_n : OUT  std_logic;
         USB_StreamSLWR_n : OUT  std_logic;
         USB_StreamData : INOUT  std_logic_vector(15 downto 0);
         USB_StreamFX2Rdy : IN  std_logic;
         USB_RegCLK : IN  std_logic;
         USB_RegAddr : IN  std_logic_vector(15 downto 0);
         USB_RegData : INOUT  std_logic_vector(7 downto 0);
         USB_RegOE_n : IN  std_logic;
         USB_RegRD_n : IN  std_logic;
         USB_RegWR_n : IN  std_logic;
         USB_RegCS_n : IN  std_logic;
         USB_Interrupt : OUT  std_logic;
         User_Signals : INOUT  std_logic_vector(7 downto 0);
         S_CLK : OUT  std_logic;
         S_A : OUT  std_logic_vector(22 downto 0);
         S_DA : INOUT  std_logic_vector(8 downto 0);
         S_DB : INOUT  std_logic_vector(8 downto 0);
         S_ADV_LD_N : OUT  std_logic;
         S_BWA_N : OUT  std_logic;
         S_BWB_N : OUT  std_logic;
         S_OE_N : OUT  std_logic;
         S_WE_N : OUT  std_logic;
         IO_CLK_N : INOUT  std_logic;
         IO_CLK_P : INOUT  std_logic;
         IO : INOUT  std_logic_vector(46 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal USB_StreamCLK : std_logic := '0';
   signal USB_StreamFlags_n : std_logic_vector(2 downto 0) := (others => '0');
   signal USB_StreamFX2Rdy : std_logic := '0';
   signal USB_RegCLK : std_logic := '0';
   signal USB_RegAddr : std_logic_vector(15 downto 0) := (others => '0');
   signal USB_RegOE_n : std_logic := '0';
   signal USB_RegRD_n : std_logic := '0';
   signal USB_RegWR_n : std_logic := '0';
   signal USB_RegCS_n : std_logic := '0';

	--BiDirs
   signal USB_StreamData : std_logic_vector(15 downto 0);
   signal USB_RegData : std_logic_vector(7 downto 0);
   signal User_Signals : std_logic_vector(7 downto 0);
   signal S_DA : std_logic_vector(8 downto 0);
   signal S_DB : std_logic_vector(8 downto 0);
   signal IO_CLK_N : std_logic;
   signal IO_CLK_P : std_logic;
   signal IO : std_logic_vector(46 downto 0);

 	--Outputs
   signal USB_StreamFIFOADDR : std_logic_vector(1 downto 0);
   signal USB_StreamPKTEND_n : std_logic;
   signal USB_StreamSLOE_n : std_logic;
   signal USB_StreamSLRD_n : std_logic;
   signal USB_StreamSLWR_n : std_logic;
   signal USB_Interrupt : std_logic;
   signal S_CLK : std_logic;
   signal S_A : std_logic_vector(22 downto 0);
   signal S_ADV_LD_N : std_logic;
   signal S_BWA_N : std_logic;
   signal S_BWB_N : std_logic;
   signal S_OE_N : std_logic;
   signal S_WE_N : std_logic;

   -- Clock period definitions
   constant USB_StreamCLK_period : time := 20.833334 ns;
   constant USB_RegCLK_period : time := 20.833334 ns;
   constant S_CLK_period : time := 20.833334 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Example3 PORT MAP (
          USB_StreamCLK => USB_StreamCLK,
          USB_StreamFIFOADDR => USB_StreamFIFOADDR,
          USB_StreamPKTEND_n => USB_StreamPKTEND_n,
          USB_StreamFlags_n => USB_StreamFlags_n,
          USB_StreamSLOE_n => USB_StreamSLOE_n,
          USB_StreamSLRD_n => USB_StreamSLRD_n,
          USB_StreamSLWR_n => USB_StreamSLWR_n,
          USB_StreamData => USB_StreamData,
          USB_StreamFX2Rdy => USB_StreamFX2Rdy,
          USB_RegCLK => USB_RegCLK,
          USB_RegAddr => USB_RegAddr,
          USB_RegData => USB_RegData,
          USB_RegOE_n => USB_RegOE_n,
          USB_RegRD_n => USB_RegRD_n,
          USB_RegWR_n => USB_RegWR_n,
          USB_RegCS_n => USB_RegCS_n,
          USB_Interrupt => USB_Interrupt,
          User_Signals => User_Signals,
          S_CLK => S_CLK,
          S_A => S_A,
          S_DA => S_DA,
          S_DB => S_DB,
          S_ADV_LD_N => S_ADV_LD_N,
          S_BWA_N => S_BWA_N,
          S_BWB_N => S_BWB_N,
          S_OE_N => S_OE_N,
          S_WE_N => S_WE_N,
          IO_CLK_N => IO_CLK_N,
          IO_CLK_P => IO_CLK_P,
          IO => IO
        );

   -- Clock process definitions
   USB_StreamCLK_process :process
   begin
		USB_StreamCLK <= '0';
		wait for USB_StreamCLK_period/2;
		USB_StreamCLK <= '1';
		wait for USB_StreamCLK_period/2;
   end process;
 
   USB_RegCLK_process :process
   begin
		USB_RegCLK <= '0';
		wait for USB_RegCLK_period/2;
		USB_RegCLK <= '1';
		wait for USB_RegCLK_period/2;
   end process;
 
   S_CLK_process :process
   begin
		S_CLK <= '0';
		wait for S_CLK_period/2;
		S_CLK <= '1';
		wait for S_CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
       USB_RegOE_n <= '1';
       USB_RegRD_n <= '1';
       USB_RegWR_n <= '1';
       USB_RegCS_n <= '1';
       USB_RegAddr <= (others => '0');
       USB_RegData <= (others => 'Z');

       -- Wait for reset to complete
       wait for 1041.6667 ns;
       wait for S_CLK_period/2;

       -- insert stimulus here 
       USB_RegOE_n <= '1';
       USB_RegRD_n <= '1';
       USB_RegWR_n <= '1';
       USB_RegCS_n <= '0';

       -- Write X
       USB_RegAddr <= X"207B";
       USB_RegData <= X"00";
       USB_RegWR_n <= '1';
       wait for S_CLK_period;
       USB_RegWR_n <= '0';
       wait for S_CLK_period;
       wait for S_CLK_period;

       USB_RegAddr <= X"207B";
       USB_RegData <= X"00";
       USB_RegWR_n <= '1';
       wait for S_CLK_period;
       USB_RegWR_n <= '0';
       wait for S_CLK_period;
       wait for S_CLK_period;

       USB_RegAddr <= X"207B";
       USB_RegData <= X"70";
       USB_RegWR_n <= '1';
       wait for S_CLK_period;
       USB_RegWR_n <= '0';
       wait for S_CLK_period;
       wait for S_CLK_period;

       USB_RegAddr <= X"207B";
       USB_RegData <= X"a3";
       USB_RegWR_n <= '1';
       wait for S_CLK_period;
       USB_RegWR_n <= '0';
       wait for S_CLK_period;
       wait for S_CLK_period;


       -- Write X
       USB_RegAddr <= X"207c";
       USB_RegData <= X"00";
       USB_RegWR_n <= '1';
       wait for S_CLK_period;
       USB_RegWR_n <= '0';
       wait for S_CLK_period;
       wait for S_CLK_period;

       USB_RegAddr <= X"207c";
       USB_RegData <= X"00";
       USB_RegWR_n <= '1';
       wait for S_CLK_period;
       USB_RegWR_n <= '0';
       wait for S_CLK_period;
       wait for S_CLK_period;

       USB_RegAddr <= X"207c";
       USB_RegData <= X"3f";
       USB_RegWR_n <= '1';
       wait for S_CLK_period;
       USB_RegWR_n <= '0';
       wait for S_CLK_period;
       wait for S_CLK_period;

       USB_RegAddr <= X"207c";
       USB_RegData <= X"ff";
       USB_RegWR_n <= '1';
       wait for S_CLK_period;
       USB_RegWR_n <= '0';
       wait for S_CLK_period;
       wait for S_CLK_period;

       wait for 20*S_CLK_period;

       USB_RegAddr <= X"207C";
       USB_RegRD_n <= '0';
       wait for S_CLK_period;
       USB_RegRD_n <= '1';
       wait for S_CLK_period;
       wait for S_CLK_period;

       USB_RegAddr <= X"2000";
       USB_RegRD_n <= '0';
       wait for S_CLK_period;
       USB_RegRD_n <= '1';
       wait for S_CLK_period;
       wait for S_CLK_period;

       USB_RegAddr <= X"2001";
       USB_RegRD_n <= '0';
       wait for S_CLK_period;
       USB_RegRD_n <= '1';
       wait for S_CLK_period;
       wait for S_CLK_period;

       USB_RegAddr <= X"2002";
       USB_RegRD_n <= '0';
       wait for S_CLK_period;
       USB_RegRD_n <= '1';
       wait for S_CLK_period;
       wait for S_CLK_period;

       USB_RegAddr <= X"2003";
       USB_RegRD_n <= '0';
       wait for S_CLK_period;
       USB_RegRD_n <= '1';
       wait for S_CLK_period;
       wait for S_CLK_period;

       USB_RegWR_n <= '1';
       USB_RegCS_n <= '1';
       USB_RegData <= (others => 'Z');
       wait for S_CLK_period;

       wait;
   end process;

END;
