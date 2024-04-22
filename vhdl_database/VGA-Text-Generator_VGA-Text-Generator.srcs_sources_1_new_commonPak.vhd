--  Original Source from FP-V-GA-Text: https://github.com/MadLittleMods/FP-V-GA-Text
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

use ieee.math_real.all;

package commonPak is
	
	
	
	constant ADDR_WIDTH : integer := 11;
	constant DATA_WIDTH : integer := 8;
	
	constant FONT_WIDTH : integer := 8;
	constant FONT_HEIGHT : integer := 16;
	
	
------------------------------------------
	
	type point_2d is
	record
		x : integer;
		y : integer;
	end record;

	type type_textColorMap is array(natural range <>) of std_logic_vector(7 downto 0); 
	

------------------------------------------

	
	type type_drawElement is
	record
		pixelOn: boolean;
		rgb: std_logic_vector(7 downto 0);
	end record;
	constant init_type_drawElement: type_drawElement := (pixelOn => false, rgb => (others => '0'));
	type type_drawElementArray is array(natural range <>) of type_drawElement; 
	


------------------------------------------

	type type_inArbiterPort is
	record
		dataRequest: boolean;
		addr: std_logic_vector(ADDR_WIDTH-1 downto 0);
		writeRequest: boolean;
		writeData: std_logic_vector(DATA_WIDTH-1 downto 0);
	end record;
	constant init_type_inArbiterPort: type_inArbiterPort := (dataRequest => false, addr => (others => '0'), writeRequest => false, writeData  => (others => '0'));
	type type_inArbiterPortArray is array(natural range <>) of type_inArbiterPort;
	
	
	type type_outArbiterPort is
	record
		dataWaiting: boolean;
		data: std_logic_vector(DATA_WIDTH-1 downto 0);
		dataWritten: boolean;
	end record;
	constant init_type_outArbiterPort: type_outArbiterPort := (dataWaiting => false, data => (others => '0'), dataWritten => false);
	type type_outArbiterPortArray is array(natural range <>) of type_outArbiterPort;


----------------------

	function log2_float(val : positive) return natural;

end commonPak;

package body commonPak is
	function log2_float(val : positive) return natural is
	begin
		return integer(ceil(log2(real(val))));
	end function;
end commonPak;
