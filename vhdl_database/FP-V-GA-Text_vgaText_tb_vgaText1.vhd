--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:04:49 07/12/2013
-- Design Name:   
-- Module Name:   D:/Libraries/EE/FPGA/Basys 2/vgaText/tb_vgaText1.vhd
-- Project Name:  vgaText
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vgaText_top
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
USE std.textio.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_vgaText1 IS
END tb_vgaText1;
 
ARCHITECTURE behavior OF tb_vgaText1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vgaText_top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         Led : OUT  std_logic_vector(7 downto 0);
         hsync : OUT  std_logic;
         vsync : OUT  std_logic;
         Red : OUT  std_logic_vector(2 downto 0);
         Green : OUT  std_logic_vector(2 downto 0);
         Blue : OUT  std_logic_vector(2 downto 1)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal Led : std_logic_vector(7 downto 0);
   signal hsync : std_logic;
   signal vsync : std_logic;
   signal Red : std_logic_vector(2 downto 0);
   signal Green : std_logic_vector(2 downto 0);
   signal Blue : std_logic_vector(2 downto 1);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vgaText_top PORT MAP (
          clk => clk,
          reset => reset,
          Led => Led,
          hsync => hsync,
          vsync => vsync,
          Red => Red,
          Green => Green,
          Blue => Blue
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
		--file textFile: text;
   begin		
		--file_open(textFile, "textMemory.txt,", write_mode);
	
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		--writeline(textFile, buf_in);
		reset <= '1';
		wait for 1 ms;
		reset <= '0';

      wait;
   end process;

END;
