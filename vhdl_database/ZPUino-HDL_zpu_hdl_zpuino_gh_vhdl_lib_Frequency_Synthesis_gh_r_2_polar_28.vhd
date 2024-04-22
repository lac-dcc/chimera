-----------------------------------------------------------------------------
--	Filename:	gh_r_2_polar_28.vhd
--
--	Description:
--		uses the cordic algorithm to preform rectangular to polar conversion 
--
--	Copyright (c) 2005, 2006, 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	09/03/05  	S A Dodd 	Initial revision
--	1.1      	09/10/05  	S A Dodd 	fix spelling of compare
--	2.0     	09/17/05  	h LeFevre	add gh_ to library parts
--	2.1      	02/18/06  	G Huber 	add gh_ to name
--	2.2     	10/11/08  	h lefevre	version with 28 bit atan function
--
-----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

entity gh_r_2_polar_28 is
	GENERIC (size: INTEGER := 16; -- size of x,y vectors
	         iterations: INTEGER :=15);	-- can not be larger than size
	port(
		clk  : in STD_LOGIC;
	 	rst  : in STD_LOGIC; 
		x_in : in STD_LOGIC_VECTOR(size-1 downto 0);
		y_in : in STD_LOGIC_VECTOR(size-1 downto 0);
		mag  : out STD_LOGIC_VECTOR(size-1 downto 0);
		ang  : out STD_LOGIC_VECTOR(size-1 downto 0)
		);
end entity;

architecture a of gh_r_2_polar_28 is

component gh_cordic_vectoring_28 is
	GENERIC (size: INTEGER := 16;
	         iterations: INTEGER := 15);
	PORT(
		clk  : IN  STD_LOGIC;
		rst  : in STD_LOGIC;
		x_in , y_in, z_in   : IN  STD_LOGIC_VECTOR (size-1 downto 0);
		x_out, y_out : OUT STD_LOGIC_VECTOR (size-1 downto 0);
		z_out : OUT STD_LOGIC_VECTOR (27 downto 0)
		);
end component gh_cordic_vectoring_28;

component gh_compare_abs is	
	GENERIC (size: INTEGER := 16);
	PORT(	
		A      : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		B      : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		AGB    : OUT STD_LOGIC;
		AEB    : OUT STD_LOGIC;
		ALB    : OUT STD_LOGIC;
		AS     : OUT STD_LOGIC; -- A sign bit
		BS     : OUT STD_LOGIC; -- B sign bit
		ABS_A  : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		ABS_B  : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component gh_compare_abs;

component gh_register is	
	GENERIC (size: INTEGER := 8);
	PORT(	
			clk  : IN		STD_LOGIC;
			rst  : IN		STD_LOGIC; 
			D  	 : IN		STD_LOGIC_VECTOR(size-1 DOWNTO 0);
			Q    : OUT		STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component gh_register;

component gh_shift_reg is	
	GENERIC (size: INTEGER := 16); 
	PORT(
		clk : IN STD_logic;
		rst : IN STD_logic;
		D   : IN STD_LOGIC;
		Q   : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component gh_shift_reg;

	signal XLY    : STD_LOGIC;
	signal dXLY   : STD_LOGIC_VECTOR(iterations DOWNTO 0);
	signal Xsign  : STD_LOGIC;
	signal dXS    : STD_LOGIC_VECTOR(iterations DOWNTO 0);
	signal Ysign  : STD_LOGIC;
	signal dYS    : STD_LOGIC_VECTOR(iterations DOWNTO 0);
	signal xin    : STD_LOGIC_VECTOR(size DOWNTO 0);
	signal yin    : STD_LOGIC_VECTOR(size DOWNTO 0);
	signal ix     : STD_LOGIC_VECTOR(size DOWNTO 0);
	signal iy     : STD_LOGIC_VECTOR(size DOWNTO 0);
	signal dix    : STD_LOGIC_VECTOR(size DOWNTO 0);
	signal diy    : STD_LOGIC_VECTOR(size DOWNTO 0);
	signal iix    : STD_LOGIC_VECTOR(size DOWNTO 0);
	signal iiy    : STD_LOGIC_VECTOR(size DOWNTO 0); 
	signal angle  : STD_LOGIC_VECTOR(27 DOWNTO 0);
	signal angle1 : STD_LOGIC_VECTOR(27 DOWNTO 0);
	signal angle2 : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal imag   : STD_LOGIC_VECTOR(size DOWNTO 0);
	signal mode   : STD_LOGIC_VECTOR(2 DOWNTO 0);
	
	signal aix    : STD_LOGIC_VECTOR(size DOWNTO 0);
	signal aiy    : STD_LOGIC_VECTOR(size DOWNTO 0);
	signal aXLY   : STD_LOGIC;
	signal aXsign : STD_LOGIC;
	signal aYsign : STD_LOGIC;
-------------------------------------------------------------------
------------- constants -------------------------------------------

	constant zero : STD_LOGIC_VECTOR(size DOWNTO 0) := (others => '0');
	constant half_pi : STD_LOGIC_VECTOR(27 DOWNTO 0) := x"4000000";	
	constant pi : STD_LOGIC_VECTOR(27 DOWNTO 0) := x"8000000";	
	constant pi_and_half : STD_LOGIC_VECTOR(27 DOWNTO 0) := x"C000000";	
	signal two_pi : STD_LOGIC_VECTOR(27 DOWNTO 0) := x"0000000";

--------------------------------------------------------------------

begin

---- here, the CORDIC is used from 0 to pi/4
---- this is used in the mapping

	xin <= (x_in(size-1) & x_in);
	yin <= (y_in(size-1) & y_in);

	u1: gh_compare_ABS generic map (size+1) 
	               port map(
	               A => xin,
	               B => yin,
	               ALB => aXLY,
				   AS => aXsign,
				   BS => aYsign,
	               ABS_A => aix,
	               ABS_B => aiy
	               );
				   
-----------------------------------------------------------
------------ add 10-17-07 ---------------------------------

process (clk,rst) 
begin
	if (rst = '1') then
		XLY <= '0';
		Xsign <= '0';
		Ysign <= '0';
		ix <= (others => '0');
		iy <= (others => '0');
	elsif (rising_edge(clk)) then
		XLY <= aXLY;
		Xsign <= aXsign;
		Ysign <= aYsign;
		ix <= aix;
		iy <= aiy;
	end if;
end process;

---------------------------------------------------------------

---- delay the mapping to match the CORDIC delay
	u2:	gh_shift_reg generic map (size => iterations+1)
	              port map(
	              clk => clk, 
	              rst => rst, 
	              D => XLY, 
	              Q => dXLY);
				  
	u3:	gh_shift_reg generic map (size => iterations+1)
	              port map(
	              clk => clk, 
	              rst => rst, 
	              D => Xsign, 
	              Q => dXS);
				  
	u4:	gh_shift_reg generic map (size => iterations+1)
	              port map(
	              clk => clk, 
	              rst => rst, 
	              D => Ysign, 
	              Q => dYS);

---- finish mapping of the CORDIC inputs
	u5: gh_register generic map (size+1) 
	           port map (clk,rst,ix,dix);

	u6: gh_register generic map (size+1) 
	           port map (clk,rst,iy,diy);		

	iix <= diy when (dXLY(0) = '1') else
	       dix;
		  
	iiy <= dix when (dXLY(0) = '1') else
	       diy;								 
	
		
	u7:	gh_cordic_vectoring_28  generic map(size+1,iterations)
	            port map(clk,rst,iix,iiy,zero,imag,open,angle);	

----  remap the output phase value to o to 2pi
	mode <= dXLY(iterations) & dXS(iterations) & dYS(iterations);
				
process (mode,angle) 
begin
case mode is
	when "000" =>  -- 0 to pi/4
		angle1 <= angle;
	when "001" => -- 7pi/4 to 2pi
		angle1 <= two_pi - angle;	
	when "010" => -- 3pi/4 to pi
		angle1 <= pi - angle;
	when "011" => -- pi to 5pi/4 
		angle1 <= pi + angle;
	when "100" => -- pi/4 to pi/2
		angle1 <= half_pi - angle;
	when "101" => -- 3pi/2 to 7pi/4
		angle1 <= pi_and_half + angle;	
	when "110" => -- pi/2 to 3pi/4 
		angle1 <= half_pi + angle;	
	when others => -- 5pi/4 to 3pi/2
		angle1 <= pi_and_half - angle;
end case;
end process;


	angle2 <= angle1(27 downto 28-size);

-- register the outputs

	u8: gh_register generic map (size) 
	           port map (clk,rst,angle2,ang);	

	u9: gh_register generic map (size) 
	           port map (clk,rst,imag(size downto 1),mag);	

			  
end a;
