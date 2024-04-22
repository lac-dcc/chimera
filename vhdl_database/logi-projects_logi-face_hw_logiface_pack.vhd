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

package logiface_pack is

	component compute_adc_mean is
	generic(NB_SAMPLES : positive := 512);
	port(
		clk, resetn : in std_logic ;

		sample_in : in std_logic_vector(9 downto 0);
		dv_in : in std_logic ;

		mean_val : out std_logic_vector(9 downto 0)
	);
	end component;
end logiface_pack;
