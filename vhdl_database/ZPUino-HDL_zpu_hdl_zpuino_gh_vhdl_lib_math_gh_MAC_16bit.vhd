-----------------------------------------------------------------------------
--	Filename:	gh_MAC_16bit.vhd
--
--	Description:
--		Multiply Accumulator
--			the total gain must be 1 or less
--			any two multiplies, added together, may be greater than 1
--
--	Copyright (c) 2005, 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	----------	--------	-----------
--	1.0      	09/03/05  	G Huber 	Initial revision
--	2.0     	09/17/05  	h lefevre	name change to avoid conflict
--	        	          	         	  with other librarys
--	2.1     	02/18/06  	G Huber 	name change for gh_Mult_g16
--	2.2      	06/24/06  	G Huber 	fix typo's
--
-----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity gh_MAC_16bit is
	port(
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		srst : in STD_LOGIC;
		ce : in STD_LOGIC;
		DA : in STD_LOGIC_VECTOR(15 downto 0);
		DB : in STD_LOGIC_VECTOR(15 downto 0);
		Q : out STD_LOGIC_VECTOR(15 downto 0)
		);	
end gh_MAC_16bit;



architecture a of gh_MAC_16bit is

component gh_Mult_g16
	port (
		clk : in STD_LOGIC;
		DA : in STD_LOGIC_VECTOR(15 downto 0);
		DB : in STD_LOGIC_VECTOR(15 downto 0);
		Q : out STD_LOGIC_VECTOR(31 downto 0)
		);
end component;

component gh_acc
	generic(size : INTEGER := 16);
	port (
		CLK : in STD_LOGIC;
		rst : in STD_LOGIC := '1';
		srst : in STD_LOGIC := '1';
		CE : in STD_LOGIC := '1';
		D : in STD_LOGIC_VECTOR(size-1 downto 0);
		Q : out STD_LOGIC_VECTOR(size-1 downto 0)
		);
end component;

component gh_shift_reg
	GENERIC (size: INTEGER := 16); 
	PORT (
		clk      : IN STD_logic;
		rst     : IN STD_logic;
		D        : IN STD_LOGIC;
		Q        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component;

	signal data  : STD_LOGIC_VECTOR(31 downto 0);
	signal idata : STD_LOGIC_VECTOR(31 downto 0);
	signal iQ    : STD_LOGIC_VECTOR(31 downto 0);
	signal Delay : STD_LOGIC_VECTOR(2 downto 1);

begin
 
	Q <= iQ(25 downto 10);
  
U1 : gh_Mult_g16
	port map(
		CLK => CLK,
		DA => DA,
		DB => DB,
		Q => idata
		);

	data(31 downto 26) <= (others =>idata(31));
	data(25 downto 0) <= idata(30 downto 5);
		
U2 : gh_acc
	generic map (size => 32)
	port map(
		CLK => CLK,
		rst => rst,
		srst => srst,
		CE => DELAY(2),
		D => data,
		Q => iQ
		);  
	
------------------------------------------
------- match clock delay of mult  -------
------------------------------------------

U3 : gh_shift_reg generic map (size => 2)
	port map(
		CLK => CLK,
		rst => rst,
		D => CE,
		Q => DELAY
		);
	
		
end a;
