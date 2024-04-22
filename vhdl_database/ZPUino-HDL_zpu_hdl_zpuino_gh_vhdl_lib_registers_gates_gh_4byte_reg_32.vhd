---------------------------------------------------------------------
--	Filename:	gh_byte_reg_32.vhd
--
--	Description:
--		4 byte register 
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	10/28/05  	G Huber  	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 

ENTITY gh_4byte_reg_32 IS 
	port(
		clk       :  IN STD_LOGIC;	-- sample clock
		rst       :  IN STD_LOGIC;
		WR        :  IN STD_LOGIC; -- Write signal
		BE        :  IN STD_LOGIC_vector(3 downto 0); -- byte enable
		D         :  IN STD_LOGIC_vector(31 downto 0);-- data bus in
		Q         :  out STD_LOGIC_VECTOR(31 downto 0)
		);
END gh_4byte_reg_32;

ARCHITECTURE a OF gh_4byte_reg_32 IS 

COMPONENT gh_register_ce IS 
	GENERIC (size: INTEGER := 8);
	PORT(	
		clk    : IN STD_LOGIC;
		rst    : IN STD_LOGIC;
		CE     : IN STD_LOGIC;
		D      : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q      : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END COMPONENT;

	signal	iQ      :  STD_LOGIC_VECTOR(31 downto 0);
	signal	WR_BYTE :  STD_LOGIC_VECTOR(3 downto 0);
	
BEGIN 

--
-- register OUTPUT 	   

	Q(31 downto 0) <= iQ(31 downto 0);

--  Registers

	WR_BYTE <= BE and (WR & WR & WR & WR);

	U1 : gh_register_ce GENERIC MAP(8)-- 
	            PORT MAP (clk,rst,WR_BYTE(0),D(7 downto 0),iQ(7 downto 0));

	U2 : gh_register_ce GENERIC MAP(8)-- 
	            PORT MAP (clk,rst,WR_BYTE(1),D(15 downto 8),iQ(15 downto 8));

	U3 : gh_register_ce GENERIC MAP(8)-- 
	            PORT MAP (clk,rst,WR_BYTE(2),D(23 downto 16),iQ(23 downto 16));

	U4 : gh_register_ce GENERIC MAP(8)-- 
	            PORT MAP (clk,rst,WR_BYTE(3),D(31 downto 24),iQ(31 downto 24));

				
END; 
