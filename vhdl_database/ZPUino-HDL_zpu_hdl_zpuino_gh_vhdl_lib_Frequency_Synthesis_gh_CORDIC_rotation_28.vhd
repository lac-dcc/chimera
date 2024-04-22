-----------------------------------------------------------------------------
--	Filename:	gh_cordic_rotation_28.vhd
--
--	Description:
--		The Cordic Rotation Algorithm
--
--	Copyright (c) 2005, 2006, 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	0.1     	2002      	dgroce   	class project 
--	0.2     	07/03/05  	h lefevre	working w/generics translation
--	1.0      	09/03/05  	S A Dodd 	Initial GH LIB revision
--	1.1      	02/18/06  	G Huber 	add gh_ to name
--	2.0     	10/11/08  	h lefevre	version with 28 bit atan function
--
-----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
use IEEE.std_logic_signed.all;

ENTITY gh_cordic_rotation_28 IS  
	GENERIC (size: INTEGER := 16; -- size of x,y vectors
	         iterations: INTEGER :=15);	-- can not be larger than size
	PORT(
		clk    : IN  STD_LOGIC;
		rst    : in STD_LOGIC;
		x_in   : IN  STD_LOGIC_VECTOR (size-1 downto 0);
		y_in   : IN  STD_LOGIC_VECTOR (size-1 downto 0) := (others => '0');
		z_in   : IN  STD_LOGIC_VECTOR (size-1 downto 0) := (others => '0');
		x_out  : OUT STD_LOGIC_VECTOR (size-1 downto 0);
		y_out  : OUT STD_LOGIC_VECTOR (size-1 downto 0);
		z_out  : OUT STD_LOGIC_VECTOR (27 downto 0)
		);
END entity;

ARCHITECTURE a OF gh_cordic_rotation_28 IS	  

	function ATAN(n :natural) return STD_LOGIC_VECTOR is -- atan(rad)
	variable result	:STD_LOGIC_VECTOR (27 downto 0);
	begin
		case n is
			when 0 => result := x"2000000"; -- (atan(1/(2^0)) * (2^28 / 2pi))
			when 1 => result := x"12E4052"; -- (atan(1/(2^1)) * (2^28 / 2pi))
			when 2 => result := x"09FB386"; -- (atan(1/(2^2)) * (2^28 / 2pi))
			when 3 => result := x"051111D"; -- (atan(1/(2^3)) * (2^28 / 2pi))
			when 4 => result := x"028B0D4"; -- (atan(1/(2^4)) * (2^28 / 2pi))
			when 5 => result := x"0145D7E"; -- (atan(1/(2^5)) * (2^28 / 2pi))
			when 6 => result := x"00A2F62"; -- (atan(1/(2^6)) * (2^28 / 2pi))
			when 7 => result := x"00517C5"; -- (atan(1/(2^7)) * (2^28 / 2pi))
			when 8 => result := x"0028BE5"; -- (atan(1/(2^8)) * (2^28 / 2pi))
			when 9 => result := x"00145F3"; -- (atan(1/(2^9)) * (2^28 / 2pi))
			when 10 => result := x"000A2fa"; -- (atan(1/(2^10)) * (2^28 / 2pi))
			when 11 => result := x"000517D"; -- (atan(1/(2^11)) * (2^28 / 2pi))
			when 12 => result := x"00028BE"; -- (atan(1/(2^12)) * (2^28 / 2pi))
			when 13 => result := x"000145F"; -- (atan(1/(2^13)) * (2^28 / 2pi))
			when 14 => result := x"0000A30"; -- (atan(1/(2^14)) * (2^28 / 2pi))
			when 15 => result := x"0000518"; -- (atan(1/(2^15)) * (2^28 / 2pi))
			when 16 => result := x"000028C"; -- (atan(1/(2^16)) * (2^28 / 2pi))
			when 17 => result := x"0000146"; -- (atan(1/(2^17)) * (2^28 / 2pi)) 
			when 18 => result := x"00000A3"; -- (atan(1/(2^18)) * (2^28 / 2pi))
			when 19 => result := x"0000051"; -- (atan(1/(2^19)) * (2^28 / 2pi))
			when 20 => result := x"0000029"; -- (atan(1/(2^20)) * (2^28 / 2pi))
			when 21 => result := x"0000014"; -- (atan(1/(2^21)) * (2^28 / 2pi))
			when 22 => result := x"000000A"; -- (atan(1/(2^22)) * (2^28 / 2pi))
			when 23 => result := x"0000005"; -- (atan(1/(2^23)) * (2^28 / 2pi))
			when 24 => result := x"0000003"; -- (atan(1/(2^24)) * (2^28 / 2pi))
			when 25 => result := x"0000001"; -- (atan(1/(2^25)) * (2^28 / 2pi))
			when others => result := x"0000000";
		end case;
		return result;
	end ATAN;
  
	type xyword_array is array (iterations downto 1) 
	                  of STD_LOGIC_VECTOR(size-1 downto 0);
	type zword_array is array (iterations downto 1) 
	                  of STD_LOGIC_VECTOR(27 downto 0);
	SIGNAL  x, y :  XYWORD_ARRAY; -- Intermediate values
	SIGNAL  z  :  ZWORD_ARRAY;
	SIGNAL iz : STD_LOGIC_VECTOR(27 downto 0);
	SIGNAL zero : STD_LOGIC_VECTOR(27 - size downto 0);
	
BEGIN 

	-- outputs
	x_out <= x(iterations-1);
	y_out <= y(iterations-1);
	z_out <= z(iterations-1);

	-- increase size of z vector to 28 bits
	zero <= (others => '0');
	iz <= z_in & zero;

PROCESS (clk,rst) 
BEGIN 	
	if (rst = '1') then
		for i in 1 to (iterations) loop
			x(i) <= (others => '0');
			y(i) <= (others => '0');
			z(i) <= (others => '0');
		end loop;
	elsif (rising_edge(clk)) THEN
		-- iteration loop
		for k in 2 to (iterations) loop	
			IF (z(k-1)(27) = '1') THEN
				x(k) <= x(k-1) + y(k-1)(size-1 downto k-1);
				y(k) <= y(k-1) - x(k-1)(size-1 downto k-1);
				z(k) <= z(k-1) + ATAN(k-1);
		    ELSE
				x(k) <= x(k-1) - y(k-1)(size-1 downto k-1);
				y(k) <= y(k-1) + x(k-1)(size-1 downto k-1);
				z(k) <= z(k-1) - ATAN(k-1);
			END IF;	
 		end loop; 			   
		-- here is the 1st iteration
		IF (iz(27) = '1') THEN 
			x(1) <= x_in + y_in;
			y(1) <= y_in - x_in;
			z(1) <= iz + ATAN(0);
	    ELSE
			x(1) <= x_in - y_in;
			y(1) <= y_in + x_in;
			z(1) <= iz - ATAN(0);	
		END IF;					
	END IF;
END PROCESS;

END a;
