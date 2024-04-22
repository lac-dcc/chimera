--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:04:02 11/25/2013
-- Design Name:   
-- Module Name:   D:/Libraries/EE/FPGA/Basys 2/vgaText/tb_vgaText3.vhd
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

use IEEE.std_logic_textio.all;
use std.textio.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

 
ENTITY tb_vgaText3 IS
END tb_vgaText3;
 
ARCHITECTURE behavior OF tb_vgaText3 IS 
 
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
   constant clk_period : time := 20 ns;
 
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
	begin		
		-- hold reset state for 100 ns.
		wait for 100 ns;	

		wait for clk_period*10;

		-- insert stimulus here 
		reset <= '1';
		wait for 100 ns;
		reset <= '0';


		wait;
	end process;
	
	
	
	
	
	--Write process
	process (clk)
		file file_pointer: text is out "write.txt";
		variable line_el: line;
	begin
		
		if rising_edge(clk) then
			
			--line_el := "1";
			
			-- Write the time
			write(line_el, now); --write the line.
			write(line_el, ":"); --write the line.
			--writeline(file_pointer, line_el); --write the contents into the file.
			
			-- Write the hsync
			write(line_el, " ");
			write(line_el, hsync); --write the line.
			--writeline(file_pointer, line_el); --write the contents into the file.
			
			-- Write the vsync
			write(line_el, " ");
			write(line_el, vsync); --write the line.
			--writeline(file_pointer, line_el); --write the contents into the file.
			
			-- Write the red
			write(line_el, " ");
			write(line_el, Red); --write the line.
			--writeline(file_pointer, line_el); --write the contents into the file.
			
			-- Write the green
			write(line_el, " ");
			write(line_el, Green); --write the line.
			--writeline(file_pointer, line_el); --write the contents into the file.
			
			-- Write the blue
			write(line_el, " ");
			write(line_el, Blue); --write the line.
			
			writeline(file_pointer, line_el); --write the contents into the file.
			
			
		end if;
	end process;
	

END;
