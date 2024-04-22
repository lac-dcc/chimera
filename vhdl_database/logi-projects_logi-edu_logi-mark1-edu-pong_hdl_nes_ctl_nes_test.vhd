----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:23:48 05/28/2013 
-- Design Name: 
-- Module Name:    nes_test - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nes_test is
	port(
			clk : in std_logic;
			n_reset : in std_logic;
			--nes1_dat : in std_logic;
			nes2_dat : in std_logic;
			nes_lat : out std_logic;
			nes_clk : out std_logic;	
			led: out std_logic_vector(7 downto 0)
			);
end nes_test;

architecture arch of nes_test is
	signal nes_a, nes_b, nes_sel, nes_start, nes_up, nes_down, nes_left, nes_right: std_logic;
	signal nes_clk_buf, nes_lat_buf:std_logic;
	signal reset: std_logic;
begin
	reset <= not(n_reset);

	nes_lat <= nes_lat_buf;
	nes_clk <= nes_clk_buf;


	led(0) <= nes_clk_buf;
	led(1) <= nes_a;
	led(2) <= nes_b;
	led(3) <= nes_start;
	led(4) <= nes_sel;
	led(5) <= nes_up;
	led(6) <= nes_down;
	led(7) <= nes_lat_buf;


	
	nes_unit: entity work.nes_ctl(arch)
		generic map( N=>17)--17 bit overflow 131k
		port map(
				clk=>clk,
				reset=>reset,
				--nes_dat=>nes1_dat,
				nes_dat=>nes2_dat,
				nes_lat=>nes_lat_buf,
				nes_clk=>nes_clk_buf,	
				nes_a=>nes_a, 
				nes_b=>nes_b, 
				nes_sel=>nes_sel, 
				nes_start=>nes_start,
				nes_up=>nes_up, 
				nes_down=>nes_down, 
				nes_left=>nes_left, 
				nes_right=>nes_right			
		);



end arch;

