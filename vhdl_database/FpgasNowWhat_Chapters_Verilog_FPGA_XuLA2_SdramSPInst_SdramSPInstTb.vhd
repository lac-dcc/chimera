--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:37:43 01/03/2013
-- Design Name:   
-- Module Name:   C:/xesscorp/PRODUCTS/TUTORIALS/FpgasNowWhat/Chapters/Verilog/FPGA/SdramSPInst/SdramSPInstTb.vhd
-- Project Name:  SdramSPInst
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SdramSPInst
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
 
ENTITY SdramSPInstTb IS
END SdramSPInstTb;
 
ARCHITECTURE behavior OF SdramSPInstTb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SdramSPInst
    PORT(
         fpgaClk_i : IN  std_logic;
         sdClk_o : OUT  std_logic;
         sdClkFb_i : IN  std_logic;
         sdCke_o   : OUT   std_logic;  -- SDRAM clock enable.
         sdCe_bo   : OUT   std_logic;  -- SDRAM chip-enable.
         sdRas_bo : OUT  std_logic;
         sdCas_bo : OUT  std_logic;
         sdWe_bo : OUT  std_logic;
         sdBs_o    : OUT   std_logic_vector(1 downto 0);  -- 2-bit SDRAM bank-address.
         sdAddr_o : OUT  std_logic_vector(11 downto 0); -- 13-bit SDRAM address bus.
         sdData_io : INOUT  std_logic_vector(15 downto 0);
         sdDqmh_o  : OUT   std_logic;  -- SDRAM high-byte databus qualifier.
         sdDqml_o  : OUT   std_logic  -- SDRAM low-byte databus qualifier.
        );
    END COMPONENT;

    -- Take the SDRAM module I/O description from mt48lc8m16a2.v Verilog file
    --    module mt48lc8m16a2 (Dq, Addr, Ba, Clk, Cke, Cs_n, Ras_n, Cas_n, We_n, Dqm);
    -- and convert it into a VHDL component declaration like this:
    
    component mt48lc8m16a2 
    port(
      Dq : inout std_logic_vector(15 downto 0);
      Addr : in std_logic_vector(11 downto 0); 
      Ba : in std_logic_vector(1 downto 0); 
      Clk : in std_logic; 
      Cke : in std_logic;
      Cs_n : in std_logic;
      Ras_n : in std_logic;
      Cas_n : in std_logic;
      We_n : in std_logic;
      Dqm : in std_logic_vector(1 downto 0)
      );
    end component;
    

   --Inputs
   signal fpgaClk_i : std_logic := '0';
   signal sdClkFb_i : std_logic := '0';

	--BiDirs
   signal sdData_io : std_logic_vector(15 downto 0);

 	--Outputs
   signal sdClk_o : std_logic;
   signal sdCke_o : std_logic;
   signal sdCe_bo : std_logic;
   signal sdRas_bo : std_logic;
   signal sdCas_bo : std_logic;
   signal sdWe_bo : std_logic;
   signal sdBs_o : std_logic_vector(1 downto 0);
   signal sdAddr_o : std_logic_vector(11 downto 0);
   signal sdDqmh_o : std_logic;
   signal sdDqml_o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant fpgaClk_period : time := 83.3333 ns; -- 12 MHz XuLA clock.
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SdramSPInst PORT MAP (
          fpgaClk_i => fpgaClk_i, -- 12 MHz XuLA clock.
          sdClk_o => sdClk_o, -- 100 MHz clock from DCM.
          sdClkFb_i => sdClkFb_i, -- 100 MHz clock fed back into FPGA.
          sdCke_o => sdCke_o,  -- SDRAM clock enable.
          sdCe_bo => sdCe_bo,  -- SDRAM chip-enable.
          sdRas_bo => sdRas_bo, -- Row-address strobe.
          sdCas_bo => sdCas_bo, -- Column-address strobe.
          sdWe_bo => sdWe_bo, -- Write-enable.
          sdBs_o => sdBs_o, -- Bank-select.
          sdAddr_o => sdAddr_o, -- 12-bit address bus.
          sdData_io => sdData_io, -- 16-bit data bus.
          sdDqmh_o => sdDqmh_o,  -- SDRAM high-byte databus qualifier.
          sdDqml_o => sdDqml_o  -- SDRAM low-byte databus qualifier.
        );
   sdClkFb_i <= sdClk_o; -- Feedback 100 MHz clock to FPGA.
        
    -- Use the mt48lc8m16a2 declaration from above to instantiate
    -- the SDRAM here and connect it to the UUT.
   sdram: mt48lc8m16a2 port map(
     Dq => sdData_io,  -- 16-bit data bus.
     Addr => sdAddr_o,  -- 12-bit address bus.
     Ba => sdBs_o,  -- Bank-select pins.
     Clk => sdClk_o,  -- 100 MHz clock.
     Cke => sdCke_o,  -- Clock-enable.
     Cs_n => sdCe_bo, -- Chip-enable.
     Ras_n => sdRas_bo, -- Row-address strobe.
     Cas_n => sdCas_bo, -- Column-address strobe.
     We_n => sdWe_bo, -- Write-enable.
     Dqm(0) => sdDqml_o, -- Lower-byte databus qualifier.
     Dqm(1) => sdDqmh_o  -- Upper-byte databus qualifier.
     );

   -- Clock process definitions.
   -- This generates the 12 MHz clock.
   fpgaClk_process :process
   begin
		fpgaClk_i <= '0';
		wait for fpgaClk_period/2;
		fpgaClk_i <= '1';
		wait for fpgaClk_period/2;
   end process;
 

   -- Stimulus process.
   -- This is not used in this testbench. The FSM in the
   -- UUT steps through all the operations.
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for fpgaClk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
