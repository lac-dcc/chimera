--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package com_pack is

component send_picture is
	port(
 		clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
 		pixel_in_data : in std_logic_vector(7 downto 0 ); 
 		data_out : out std_logic_vector(7 downto 0 ); 
		output_ready : in std_logic;
 		send : out std_logic
	); 
end component;

end com_pack;

package body com_pack is

end com_pack;
