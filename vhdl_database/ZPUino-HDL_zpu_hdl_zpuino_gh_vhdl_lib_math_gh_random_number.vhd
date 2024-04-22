-----------------------------------------------------------------------------
--	Filename:	gh_random_number.vhd
--
--	Description:
--		A Random Number Generator
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	10/04/05  	h lefevre	Initial revision
--
-----------------------------------------------------------------------------
library ieee ;
use ieee.std_logic_1164.all ;
							 
entity gh_random_number is
	GENERIC(lfsr_size: INTEGER := 43; -- first feedback tap = size
	         lfsr_fb2: INTEGER := 42; -- if feedback taps
	         lfsr_fb3: INTEGER := 38;  --  are set to zero, that 
	         lfsr_fb4: INTEGER := 37); --  tap will be null (not used) 
	port(
		clk         : in std_logic; 
		rst         : in std_logic;
		casr_load : in STD_LOGIC := '0';
		casr_seed : in STD_LOGIC_VECTOR(37 DOWNTO 1) := "1111110000001111110000001111110001101";
		casr_Q    : out STD_LOGIC_VECTOR(32 downto 1);
		lfsr_Q    : out STD_LOGIC_VECTOR(32 downto 1);
		RN_Q    : out STD_LOGIC_VECTOR(32 downto 1)
		);
end gh_random_number;

architecture a of gh_random_number is

COMPONENT gh_casr_37 is
	port(
		CLK  : in STD_LOGIC;
		rst  : in STD_LOGIC;
		load : in STD_LOGIC := '0';
		seed : in STD_LOGIC_VECTOR(37 DOWNTO 1) := "1111110000001111110000001111110001101";
		Q    : out STD_LOGIC_VECTOR(37 downto 1)
	    );
END COMPONENT;

COMPONENT gh_lfsr_gfb4 is
	GENERIC(size: INTEGER := 43; -- first feedback tap = size
	         fb2: INTEGER := 42; -- if feedback taps
	         fb3: INTEGER := 38;  --  are set to zero, that 
	         fb4: INTEGER := 37); --  tap will be null (not used)
	 port(
		CLK : in STD_LOGIC;
		rst : in STD_LOGIC;
		Q   : out STD_LOGIC_VECTOR(size downto 1)
	    );
END COMPONENT;

COMPONENT gh_xor_bus is
	generic(size: INTEGER := 8);
	port(
		A : in STD_LOGIC_VECTOR(size downto 1);
		B : in STD_LOGIC_VECTOR(size downto 1);
		Q : out STD_LOGIC_VECTOR(size downto 1)
	    );
END COMPONENT;

	signal casr   : std_logic_vector(37 downto 1);
	signal lfsr   : std_logic_vector(lfsr_size downto 1);
	signal RN     : std_logic_vector(32 downto 1);

	
begin

	casr_Q <= casr(32 downto 1);
	lfsr_Q <= lfsr(32 downto 1);
	RN_Q <= RN;
	
U1 : gh_casr_37  
	PORT MAP(
		clk => clk,
		rst => rst,
		load => casr_load,
		seed => casr_seed,  
		Q => casr
		);
			   
U2 : gh_lfsr_gfb4 
	Generic Map(lfsr_size,lfsr_fb2,lfsr_fb3,lfsr_fb4) 
	PORT MAP(
		clk => clk,
		rst => rst,
		Q => lfsr
		);

U3 : gh_xor_bus
	Generic Map(size => 32)
	PORT MAP(
		A => casr(32 downto 1),
		B => lfsr(32 downto 1),
		Q => RN
		);
		
end a;

