---------------------------------------------------------------------
--	Filename:	gh_4byte_reg_512.vhd
--
--	Description:
--		This has 512 configuration bits  
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	10/29/05  	G Huber  	Initial revision
--
---------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 

ENTITY gh_4byte_reg_512 IS 
	port(
		clk  : IN STD_LOGIC; -- sample clock
		rst  : IN STD_LOGIC;
		CSn  : IN STD_LOGIC; -- chip select
		WR   : IN STD_LOGIC; -- Write signal
		BE   : IN STD_LOGIC_vector(3 downto 0); -- byte enables
		A    : IN STD_LOGIC_vector(3 downto 0); -- address bus
		D    : IN STD_LOGIC_vector(31 downto 0);-- data bus in
		RD   : out STD_LOGIC_VECTOR(31 downto 0); -- read data
		Q    : out STD_LOGIC_VECTOR(511 downto 0)
		);
END gh_4byte_reg_512;

ARCHITECTURE a OF gh_4byte_reg_512 IS 

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
	
	signal	iWR    :  STD_LOGIC_VECTOR(1 downto 0);
	signal	iRD1   :  STD_LOGIC_VECTOR(31 downto 0);
	signal	iRD2   :  STD_LOGIC_VECTOR(31 downto 0);
	signal	iQ     :  STD_LOGIC_VECTOR(511 downto 0);	

	
BEGIN 

--
-- OUTPUT 	   

	Q <= iQ;

--  read data
	RD <= iRD1 when (A(3) = '0') else
	      iRD2;

--  decode logic

	iWR <= "00" when ((CSn = '1') or (WR = '0')) else
	       "01" when (A(3) = '0') else
	       "10";
	
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--  Registers

	U1 : gh_4byte_reg_256 PORT MAP 
	     (clk,rst,CSn,iWR(0),BE,A(2 downto 0),D(31 downto 0),
	      iRD1,iQ(255 downto 0));

	U2 : gh_4byte_reg_256 PORT MAP 
	     (clk,rst,CSn,iWR(1),BE,A(2 downto 0),D(31 downto 0),
	      iRD2,iQ(511 downto 256));
				
END; 
