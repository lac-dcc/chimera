----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:23:33 02/02/2011 
-- Design Name: 
-- Module Name:    wingbutled - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;
entity wingbutled is
	Port (
		io : inout  STD_LOGIC_VECTOR (7 downto 0);
		buttons : out  STD_LOGIC_VECTOR (3 downto 0);
		leds : in  STD_LOGIC_VECTOR (3 downto 0)
	);
end wingbutled;
architecture Behavioral of wingbutled is
begin
	io(0) <= leds(3);
	io(2) <= leds(2);
	io(4) <= leds(1);
	io(6) <= leds(0);
	io(1) <= 'Z';
	io(3) <= 'Z';
	io(5) <= 'Z';
	io(7) <= 'Z';
	buttons(3) <= io(1);
	buttons(2) <= io(3);
	buttons(1) <= io(5);
	buttons(0) <= io(7);
end Behavioral;
