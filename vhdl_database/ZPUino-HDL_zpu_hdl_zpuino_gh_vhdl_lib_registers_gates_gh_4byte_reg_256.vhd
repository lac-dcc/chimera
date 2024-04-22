---------------------------------------------------------------------
--	Filename:	gh_4byte_reg_256.vhd
--
--	Description:
--		This has 256 configuration bits  
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
 

ENTITY gh_4byte_reg_256 IS 
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
END gh_4byte_reg_256;

ARCHITECTURE a OF gh_4byte_reg_256 IS 

COMPONENT gh_decode_3to8 IS 
	 port(
		A   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0); -- address
		G1  : IN  STD_LOGIC; -- enable positive
		G2n : IN  STD_LOGIC; -- enable negitive
		G3n : IN  STD_LOGIC; -- enable negitive
		Y   : out STD_LOGIC_VECTOR(7 downto 0)
		);
END COMPONENT;

COMPONENT gh_4byte_reg_32 IS 
	 port(
		clk       :  IN STD_LOGIC;	-- sample clock
		rst       :  IN STD_LOGIC;
		WR        :  IN STD_LOGIC; -- Write signal
		D         :  IN STD_LOGIC_vector(31 downto 0);-- data bus in
		BE        :  IN STD_LOGIC_vector(3 downto 0); -- byte enable
		Q         :  out STD_LOGIC_VECTOR(31 downto 0) -- 2nd register
		);
END COMPONENT;
	
	signal	iWR    :  STD_LOGIC_VECTOR(7 downto 0);
	signal	iQ     :  STD_LOGIC_VECTOR(255 downto 0);	

	
BEGIN 

--
-- OUTPUT 	   

	Q <= iQ;

--  read data
	RD <= iQ(31 downto 0) when (A = o"0") else
	      iQ(63 downto 32) when (A = o"1") else
	      iQ(95 downto 64) when (A = o"2") else
	      iQ(127 downto 96) when (A = o"3") else
	      iQ(159 downto 128) when (A = o"4") else
	      iQ(191 downto 160) when (A = o"5") else
	      iQ(223 downto 192) when (A = o"6") else
	      iQ(255 downto 224);

--  decode logic

	U1 : gh_decode_3to8 PORT MAP (A(2 downto 0),WR,'0',CSn,iWR);

----------------------------------------------------------------------------
----------------------------------------------------------------------------
--  Registers

	U2 : gh_4byte_reg_32 PORT MAP 
	     (clk,rst,iWR(0),D(31 downto 0),BE,
	      iQ(31 downto 0));

	U3 : gh_4byte_reg_32 PORT MAP 
	     (clk,rst,iWR(1),D(31 downto 0),BE,
	      iQ(63 downto 32));
	
	U4 : gh_4byte_reg_32 PORT MAP 
	     (clk,rst,iWR(2),D(31 downto 0),BE,
	      iQ(95 downto 64));
	
	U5 : gh_4byte_reg_32 PORT MAP 
	     (clk,rst,iWR(3),D(31 downto 0),BE,
	      iQ(127 downto 96));
	
	U6 : gh_4byte_reg_32 PORT MAP 
	     (clk,rst,iWR(4),D(31 downto 0),BE,
	      iQ(159 downto 128));
	
	U7 : gh_4byte_reg_32 PORT MAP 
	     (clk,rst,iWR(5),D(31 downto 0),BE,
	      iQ(191 downto 160));
	
	U8 : gh_4byte_reg_32 PORT MAP 
	     (clk,rst,iWR(6),D(31 downto 0),BE,
	      iQ(223 downto 192));

	U9 : gh_4byte_reg_32 PORT MAP 
	     (clk,rst,iWR(7),D(31 downto 0),BE,
	      iQ(255 downto 224));

				
END; 
