---------------------------------------------------------------------
--	Filename:	gh_byte_control_reg_32.vhd
--
--	Description:
--		4 byte control register, this has 32 bits 
--			mode = "00" writes D to Q
--			mode = "01" sets D bits in Q
--			mode = "10" clears D bits in Q
--			mode = "11" inverts D bits in Q
--
--	Copyright (c) 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	01/21/06  	S A Dodd 	Initial revision
--	1.1      	06/24/06   	G Huber 	fix typo 
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ENTITY gh_4byte_control_reg_32 IS 
	port(
		clk  :  IN STD_LOGIC; -- sample clock
		rst  :  IN STD_LOGIC;
		WR   :  IN STD_LOGIC; -- Write signal
		BE   :  IN STD_LOGIC_vector(3 downto 0); -- byte enable
		MODE :  IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		D    :  IN STD_LOGIC_vector(31 downto 0);-- data bus in
		Q    :  out STD_LOGIC_VECTOR(31 downto 0)
		);
END entity;

ARCHITECTURE a OF gh_4byte_control_reg_32 IS 

COMPONENT gh_register_control_ce IS 
	GENERIC (size: INTEGER := 8);
	PORT(	
		clk  : IN		STD_LOGIC;
		rst  : IN		STD_LOGIC; 
		CE   : IN		STD_LOGIC; -- clock enable
		MODE : IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
		D    : IN		STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q    : OUT		STD_LOGIC_VECTOR(size-1 DOWNTO 0)
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

	U1 : gh_register_control_ce GENERIC MAP(8)-- 
	        PORT MAP (clk,rst,WR_BYTE(0),MODE,D(7 downto 0),iQ(7 downto 0));

	U2 : gh_register_control_ce GENERIC MAP(8)-- 
	        PORT MAP (clk,rst,WR_BYTE(1),MODE,D(15 downto 8),iQ(15 downto 8));

	U3 : gh_register_control_ce GENERIC MAP(8)-- 
	        PORT MAP (clk,rst,WR_BYTE(2),MODE,D(23 downto 16),iQ(23 downto 16));

	U4 : gh_register_control_ce GENERIC MAP(8)-- 
	        PORT MAP (clk,rst,WR_BYTE(3),MODE,D(31 downto 24),iQ(31 downto 24));

				
END; 
