-----------------------------------------------------------------------------
--	Filename:	gh_sincos.vhd
--
--	Description:
--		uses the cordic algorithm to generate sin/cos 
--
--	Copyright (c) 2005, 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	09/03/05  	S A Dodd 	Initial revision
--	2.0     	09/18/05  	h LeFevre	add gh_ to library parts
--	3.0     	03/25/06  	S A Dodd 	mod to use only +/- 45 deg of cordec
--
-----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

entity gh_sincos is
	GENERIC (size: INTEGER := 16);	-- max value for width is 16
	port(
		clk  : in STD_LOGIC;
	 	rst  : in STD_LOGIC; 
		add  : in STD_LOGIC_VECTOR(size-1 downto 0);
		sin  : out STD_LOGIC_VECTOR(size-1 downto 0);
		cos  : out STD_LOGIC_VECTOR(size-1 downto 0)
		);
end entity;

architecture a of gh_sincos is

component gh_cordic_rotation is
	GENERIC (size: INTEGER := 16;
	         iterations: INTEGER := 15);
	PORT(
		clk  : IN  STD_LOGIC;
		rst : in STD_LOGIC;
		x_in , y_in, z_in   : IN  STD_LOGIC_VECTOR (size-1 downto 0);
		x_out, y_out : OUT STD_LOGIC_VECTOR (size-1 downto 0);
		z_out : OUT STD_LOGIC_VECTOR (19 downto 0)
		);
end component;

component gh_delay_bus IS
	GENERIC (clock_delays : INTEGER := 16;
	         size : INTEGER := 8); 
	PORT(
		clk  : IN STD_logic;
		rst  : IN STD_logic;
		srst : IN STD_logic := '0';
		D    : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q    : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component;

component gh_register is	
	GENERIC (size: INTEGER := 8);
	PORT(	
		clk : IN		STD_LOGIC;
		rst : IN		STD_LOGIC; 
		D   : IN		STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q   : OUT		STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component;

	constant iterations : INTEGER := size;

	signal iadd   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal csin   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal ccos   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal isin   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal icos   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal adj_C  : std_logic_VECTOR(2 DOWNTO 0);
	signal iadj_C : std_logic_VECTOR(2 DOWNTO 0);




-------------------------------------------------------------------
------------- constants -------------------------------------------

	constant ipi : STD_LOGIC_VECTOR(15 DOWNTO 0) := x"8000";
	constant pi : STD_LOGIC_VECTOR(size-1 DOWNTO 0) := ipi(15 downto 16 - size);
	constant ihalf_pi : STD_LOGIC_VECTOR(15 DOWNTO 0) := x"4000";
	constant half_pi : STD_LOGIC_VECTOR(size-1 DOWNTO 0) 
	         := ihalf_pi(15 downto 16 - size);
	constant ipi_and_half : STD_LOGIC_VECTOR(15 DOWNTO 0) := x"C000";
	constant pi_and_half : STD_LOGIC_VECTOR(size-1 DOWNTO 0) 
	         := ipi_and_half(15 downto 16 - size);	
	constant zero : STD_LOGIC_VECTOR(size-1 DOWNTO 0) := (others => '0');
	-- mag and scale adjust the output level to prevent 
	-- the CORDIC gain from causing an overflow
	constant mag : STD_LOGIC_VECTOR(15 DOWNTO 0) := x"4dba";
	constant scale : STD_LOGIC_VECTOR(size-1 DOWNTO 0) := mag(15 downto 16 - size) - x"03";

-------------------------------------------------------------------	
	
begin

------ the CORDIC is used from -pi/4 to +pi/4 
------  the 3 MSB's are used to determine octant

	iadj_C <= (add(size-1 downto size-3));

------ the CORDIC phase input (add)
------ is addjusted when it is outside range of -pi/4 to +pi/4 

process (iadj_C,add)
begin
case iadj_C is
	when o"0" => 
		iadd <= add;
	when o"1" => 
		iadd <= (half_pi - add);
	when o"2" =>
		iadd <= (add - half_pi);
	when o"3" =>
		iadd <= (pi - add);
	when o"4" =>
		iadd <= (pi - add);
	when o"5" =>
		iadd <= (add - pi_and_half);
	when o"6" =>
		iadd <= (pi_and_half - add);
	when others => 
		iadd <= add;	
end case;	
end process;

----------------------------------

	u1:	gh_cordic_rotation  generic map(size,iterations)
		port map(
			clk => clk,
			rst => rst,
			x_in => scale,
			y_in => zero,
			z_in => iadd,
			x_out => ccos,
			y_out => csin,
			z_out => open);	
	
----- delay iadj_c to line up with CORDIC output 

	u3:	gh_delay_bus generic map (clock_delays => iterations-1, size => 3)
	              port map(
	              clk => clk, 
	              rst => rst, 
	              D => iadj_C, 
	              Q => adj_C);
	
----- adjust output to cover full 2 pi range

process (adj_C,ccos,csin)
begin
case adj_C is
	when o"0" => 
		icos <= ccos;          
		isin <= csin;
	when o"1" => 
		icos <= csin;          
		isin <= ccos;
	when o"2" => 
		icos <= (x"0" - csin); 
		isin <= ccos;
	when o"3" => 
		icos <= (x"0" - ccos); 
		isin <= csin;
	when o"4" => 
		icos <= (x"0" - ccos); 
		isin <= csin;
	when o"5" => 
		icos <= csin;          
		isin <= (x"0" - ccos);
	when o"6" => 
		icos <= (x"0" - csin); 
		isin <= (x"0" - ccos);
--	when o"7" => 
	when others => 
		icos <= ccos;          
		isin <= csin;	
end case;	
end process;

------------------- register output 

	u4: gh_register generic map (size) 
	           port map (clk,rst,isin,sin);

	u5: gh_register generic map (size) 
	           port map (clk,rst,icos,cos);
	
end a;
