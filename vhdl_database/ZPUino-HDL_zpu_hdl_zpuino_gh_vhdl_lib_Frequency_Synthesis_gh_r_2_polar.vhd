-----------------------------------------------------------------------------
--	Filename:	gh_r_2_polar.vhd
--
--	Description:
--		uses the cordic algorithm to preform rectangular to polar conversion 
--
--	Copyright (c) 2005, 2006, 2007, 2008 by George Huber 
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
--	2.2      	10/17/07  	G Huber 	add gh_ to architecture
--	3.0      	10/12/08  	h LeFevre	add iterations to GENERIC
--
-----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

entity gh_r_2_polar is
	GENERIC (size: INTEGER := 16; -- size of x,y vectors
	         iterations: INTEGER :=15);
	port(
		clk  : in STD_LOGIC;
	 	rst  : in STD_LOGIC; 
		x_in : in STD_LOGIC_VECTOR(size-1 downto 0);
		y_in : in STD_LOGIC_VECTOR(size-1 downto 0);
		mag  : out STD_LOGIC_VECTOR(size-1 downto 0);
		ang  : out STD_LOGIC_VECTOR(size-1 downto 0)
		);
end entity;

architecture a of gh_r_2_polar is

component gh_cordic_vectoring is
	GENERIC (size: INTEGER := 16;
	         iterations: INTEGER := 15);
	PORT(
		clk  : IN  STD_LOGIC;
		rst  : in STD_LOGIC;
		x_in , y_in, z_in   : IN  STD_LOGIC_VECTOR (size-1 downto 0);
		x_out, y_out : OUT STD_LOGIC_VECTOR (size-1 downto 0);
		z_out : OUT STD_LOGIC_VECTOR (19 downto 0)
		);
end component gh_cordic_vectoring;

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
	signal ix     : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iy     : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal dix    : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal diy    : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iix    : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iiy    : STD_LOGIC_VECTOR(size-1 DOWNTO 0); 
	signal angle  : STD_LOGIC_VECTOR(19 DOWNTO 0);
	signal angle1 : STD_LOGIC_VECTOR(19 DOWNTO 0);
	signal angle2 : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal imag   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal mode   : STD_LOGIC_VECTOR(2 DOWNTO 0);
	
-------------------------------------------------------------------
------------- constants -------------------------------------------

	constant zero : STD_LOGIC_VECTOR(size-1 DOWNTO 0) := (others => '0');
	constant half_pi : STD_LOGIC_VECTOR(19 DOWNTO 0) := x"40000";	
	constant pi : STD_LOGIC_VECTOR(19 DOWNTO 0) := x"80000";	
	constant pi_and_half : STD_LOGIC_VECTOR(19 DOWNTO 0) := x"C0000";	
	signal two_pi : STD_LOGIC_VECTOR(19 DOWNTO 0) := x"00000";

--------------------------------------------------------------------

begin

---- here, the CORDIC is used from 0 to pi/4
---- this is used in the mapping
	u1: gh_compare_ABS generic map (size) 
	               port map(
	               A => x_in,
	               B => y_in,
	               ALB => XLY,
				   AS => Xsign,
				   BS => Ysign,
	               ABS_A => ix,
	               ABS_B => iy
	               );

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
	u5: gh_register generic map (size) 
	           port map (clk,rst,ix,dix);

	u6: gh_register generic map (size) 
	           port map (clk,rst,iy,diy);		

	iix <= diy when (dXLY(0) = '1') else
	       dix;
		  
	iiy <= dix when (dXLY(0) = '1') else
	       diy;								 
	
		
	u7:	gh_cordic_vectoring  generic map(size,iterations)
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


	angle2 <= angle1(19 downto 20-size);

-- register the outputs

	u8: gh_register generic map (size) 
	           port map (clk,rst,angle2,ang);	

	u9: gh_register generic map (size) 
	           port map (clk,rst,imag,mag);	

			  
end architecture;
