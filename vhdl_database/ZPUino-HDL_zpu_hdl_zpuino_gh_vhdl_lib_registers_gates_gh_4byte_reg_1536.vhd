---------------------------------------------------------------------
--	Filename:	gh_4byte_reg_1536.vhd
--
--	Description:
--		This has 1536 configuration bits  
--
--	Copyright (c) 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	05/13/06  	G Huber  	Initial revision
--
---------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 

ENTITY gh_4byte_reg_1536 IS 
	port(
		clk  : IN STD_LOGIC; -- sample clock
		rst  : IN STD_LOGIC;
		CSn  : IN STD_LOGIC; -- chip select
		WR   : IN STD_LOGIC; -- Write signal
		BE   : IN STD_LOGIC_vector(3 downto 0); -- byte enables
		A    : IN STD_LOGIC_vector(5 downto 0); -- address bus
		D    : IN STD_LOGIC_vector(31 downto 0);-- data bus in
		RD   : out STD_LOGIC_VECTOR(31 downto 0); -- read data
		Q    : out STD_LOGIC_VECTOR(1535 downto 0)
		);
END entity;

ARCHITECTURE a OF gh_4byte_reg_1536 IS 

COMPONENT gh_decode_3to8 IS 
	PORT(	
		A   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0); -- address
		G1  : IN  STD_LOGIC; -- enable positive
		G2n : IN  STD_LOGIC; -- enable negitive
		G3n : IN  STD_LOGIC; -- enable negitive
		Y   : out STD_LOGIC_VECTOR(7 downto 0)
		);
END COMPONENT;

COMPONENT gh_4byte_reg_256 IS 
	port(
		clk  : IN STD_LOGIC; -- sample clock
		rst  : IN STD_LOGIC;
		CSn  : IN STD_LOGIC; -- chip select
		WR   : IN STD_LOGIC; -- Write signal
		BE   : IN STD_LOGIC_vector(3 downto 0); -- byte enables
		A    : IN STD_LOGIC_vector(2 downto 0); -- address bus
		D    : IN STD_LOGIC_vector(31 downto 0);-- data bus in
		RD   : out STD_LOGIC_VECTOR(31 downto 0); -- read data
		Q    : out STD_LOGIC_VECTOR(255 downto 0)
		);
END COMPONENT;
	
	signal	iWR    :  STD_LOGIC_VECTOR(7 downto 0);
	signal	iRD1   :  STD_LOGIC_VECTOR(31 downto 0);
	signal	iRD2   :  STD_LOGIC_VECTOR(31 downto 0);
	signal	iRD3   :  STD_LOGIC_VECTOR(31 downto 0);
	signal	iRD4   :  STD_LOGIC_VECTOR(31 downto 0);
	signal	iRD5   :  STD_LOGIC_VECTOR(31 downto 0);
	signal	iRD6   :  STD_LOGIC_VECTOR(31 downto 0);
	signal	iQ     :  STD_LOGIC_VECTOR(1535 downto 0);	

	
BEGIN 

--
-- OUTPUT 	   

	Q <= iQ;

--  read data
	RD <= iRD1 when (A(5 downto 3) = "000") else
	      iRD2 when (A(5 downto 3) = "001") else	
	      iRD3 when (A(5 downto 3) = "010") else
	      iRD4 when (A(5 downto 3) = "011") else
	      iRD5 when (A(5 downto 3) = "100") else
	      iRD6;

--  decode logic

	U1 : gh_decode_3to8 PORT MAP (A(5 downto 3),WR,'0',CSn,iWR);

----------------------------------------------------------------------------
----------------------------------------------------------------------------
--  Registers

	U2 : gh_4byte_reg_256 PORT MAP 
	     (clk,rst,CSn,iWR(0),BE,A(2 downto 0),D(31 downto 0),
	      iRD1,iQ(255 downto 0));

	U3 : gh_4byte_reg_256 PORT MAP 
	     (clk,rst,CSn,iWR(1),BE,A(2 downto 0),D(31 downto 0),
	      iRD2,iQ(511 downto 256));

	U4 : gh_4byte_reg_256 PORT MAP 
	     (clk,rst,CSn,iWR(2),BE,A(2 downto 0),D(31 downto 0),
	      iRD3,iQ(767 downto 512));

	U5 : gh_4byte_reg_256 PORT MAP 
	     (clk,rst,CSn,iWR(3),BE,A(2 downto 0),D(31 downto 0),
	      iRD4,iQ(1023 downto 768));

	U6 : gh_4byte_reg_256 PORT MAP 
	     (clk,rst,CSn,iWR(4),BE,A(2 downto 0),D(31 downto 0),
	      iRD5,iQ(1279 downto 1024));

	U7 : gh_4byte_reg_256 PORT MAP 
	     (clk,rst,CSn,iWR(5),BE,A(2 downto 0),D(31 downto 0),
	      iRD6,iQ(1535 downto 1280));

		 
END; 
