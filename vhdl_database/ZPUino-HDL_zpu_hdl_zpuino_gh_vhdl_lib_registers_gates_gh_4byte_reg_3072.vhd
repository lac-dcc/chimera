---------------------------------------------------------------------
--	Filename:	gh_4byte_reg_3072.vhd
--
--	Description:
--		This has 3072 configuration bits  
--
--	Copyright (c) 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	11/08/08  	H LeFevre	Initial revision
--
---------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 

ENTITY gh_4byte_reg_3072 IS 
	port(
		clk  : IN STD_LOGIC; -- sample clock
		rst  : IN STD_LOGIC;
		CSn  : IN STD_LOGIC; -- chip select
		WR   : IN STD_LOGIC; -- Write signal
		BE   : IN STD_LOGIC_vector(3 downto 0); -- byte enables
		A    : IN STD_LOGIC_vector(6 downto 0); -- address bus
		D    : IN STD_LOGIC_vector(31 downto 0);-- data bus in
		RD   : out STD_LOGIC_VECTOR(31 downto 0); -- read data
		Q    : out STD_LOGIC_VECTOR(3071 downto 0)
		);
END entity;

ARCHITECTURE a OF gh_4byte_reg_3072 IS 

COMPONENT gh_decode_2to4 IS 
	 port(
		A   : IN  STD_LOGIC_VECTOR(1 DOWNTO 0); -- address
		G1  : IN  STD_LOGIC; -- enable positive
		G2n : IN  STD_LOGIC; -- enable negitive
		G3n : IN  STD_LOGIC; -- enable negitive
		Y   : out STD_LOGIC_VECTOR(3 downto 0)
		);
END COMPONENT;

COMPONENT gh_4byte_reg_1024 IS 
	port(
		clk  : IN STD_LOGIC; -- sample clock
		rst  : IN STD_LOGIC;
		CSn  : IN STD_LOGIC; -- chip select
		WR   : IN STD_LOGIC; -- Write signal
		BE   : IN STD_LOGIC_vector(3 downto 0); -- byte enables
		A    : IN STD_LOGIC_vector(4 downto 0); -- address bus
		D    : IN STD_LOGIC_vector(31 downto 0);-- data bus in
		RD   : out STD_LOGIC_VECTOR(31 downto 0); -- read data
		Q    : out STD_LOGIC_VECTOR(1023 downto 0)
		);
END COMPONENT;
	
	signal	iWR    :  STD_LOGIC_VECTOR(3 downto 0);
	signal	iRD1   :  STD_LOGIC_VECTOR(31 downto 0);
	signal	iRD2   :  STD_LOGIC_VECTOR(31 downto 0);
	signal	iRD3   :  STD_LOGIC_VECTOR(31 downto 0);
	signal	iQ     :  STD_LOGIC_VECTOR(3071 downto 0);	

	
BEGIN 

--
-- OUTPUT 	   

	Q <= iQ;

--  read data
	RD <= iRD1 when (A(6 downto 5) = "00") else
	      iRD2 when (A(6 downto 5) = "01") else	
	      iRD3;

--  decode logic

	U1 : gh_decode_2to4 PORT MAP (A(6 downto 5),WR,'0',CSn,iWR);

----------------------------------------------------------------------------
----------------------------------------------------------------------------
--  Registers

	U2 : gh_4byte_reg_1024 PORT MAP 
	     (clk,rst,CSn,iWR(0),BE,A(4 downto 0),D(31 downto 0),
	      iRD1,iQ(1023 downto 0));

	U3 : gh_4byte_reg_1024 PORT MAP 
	     (clk,rst,CSn,iWR(1),BE,A(4 downto 0),D(31 downto 0),
	      iRD2,iQ(2047 downto 1024));

	U4 : gh_4byte_reg_1024 PORT MAP 
	     (clk,rst,CSn,iWR(2),BE,A(4 downto 0),D(31 downto 0),
	      iRD3,iQ(3071 downto 2048));

				
END; 
