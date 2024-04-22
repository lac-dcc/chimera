-----------------------------------------------------------------------------
--	Filename:	gh_MAC_ld.vhd
--
--	Description:
--		Multiply Accumulator with full generics
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	----------	--------	-----------
--	1.0      	06/30/07  	G Huber 	Initial revision  
--
-----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;

entity gh_MAC_ld is
	generic(size_A : INTEGER :=16;
	        size_B : INTEGER :=16;
	        xbits : INTEGER :=0);
	port(
		clk  : in STD_LOGIC;
		rst  : in STD_LOGIC;
		LOAD : in STD_LOGIC; -- "clears" old data/starts a new accumulation
		ce   : in STD_LOGIC; --  clock enable
		DA   : in STD_LOGIC_VECTOR(size_A-1 downto 0);
		DB   : in STD_LOGIC_VECTOR(size_B-1 downto 0);
		Q    : out STD_LOGIC_VECTOR(size_A+size_B+xbits-1 downto 0)
		);	
end entity;


architecture a of gh_MAC_ld is

	signal dce      : STD_LOGIC_VECTOR(2 downto 0);
	signal dload    : STD_LOGIC_VECTOR(2 downto 0);
	signal iDA      : STD_LOGIC_VECTOR(size_A-1 downto 0);
	signal iDB      : STD_LOGIC_VECTOR(size_B-1 downto 0);
	signal product  : STD_LOGIC_VECTOR(size_A+size_B-1 downto 0);
	signal xp       : STD_LOGIC_VECTOR(xbits downto 0);
	signal iQ       : STD_LOGIC_VECTOR(size_A+size_B+xbits downto 0);


begin
 
PROCESS (clk,rst)
BEGIN
	if (rst = '1') then	
		dce <= (others => '0');
		dload <= (others => '0');
		iDA <= (others => '0');
		iDB <= (others => '0');
		product <= (others => '0');
		iQ <= (others => '0');
	elsif (rising_edge (clk)) then
		dce(0) <= ce;
		dce(2 downto 1) <= dce(1 downto 0);
		dload(0) <= LOAD;
		dload(2 downto 1) <= dload(1 downto 0);
		if ((ce = '1') or (load = '1')) then
			iDA <= DA;
			iDB <= DB;
		else
			iDA <= iDA;
			iDB <= iDB;
		end if;
		if ((dce(0) = '1') or (dload(0) = '1')) then
			product <= iDA * iDB;
		else
			product <= product;
		end if;
		if (dload(1) = '1') then
			iQ <= xp & product;
		elsif (dce(1) = '1') then
			iQ <= iQ + (xp & product);
		else
			iQ <= iQ;
		end if;
	end if;
END PROCESS;	

	xp <= (others => product(size_A+size_B-1));
	Q <= iQ(size_A+size_B+xbits-1 downto 0);

		
end a;
