---------------------------------------------------------------------
--	Filename:	gh_4byte_control_reg_128.vhd
--
--	Description:
--		4 byte control register, this has 128 bits 
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
---------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ENTITY gh_4byte_control_reg_128 IS 
	port(
		clk  : IN STD_LOGIC; -- sample clock
		rst  : IN STD_LOGIC;
		CSn  : IN STD_LOGIC; -- chip select
		WR   : IN STD_LOGIC; -- Write signal
		BE   : IN STD_LOGIC_vector(3 downto 0); -- byte enables
		MODE : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		A    : IN STD_LOGIC_vector(1 downto 0); -- address bus
		D    : IN STD_LOGIC_vector(31 downto 0);-- data bus in
		RD   : out STD_LOGIC_VECTOR(31 downto 0); -- read data
		Q    : out STD_LOGIC_VECTOR(127 downto 0)
		);
END entity;

ARCHITECTURE a OF gh_4byte_control_reg_128 IS 

COMPONENT gh_decode_2to4 IS 
	 port(
		A   : IN  STD_LOGIC_VECTOR(1 DOWNTO 0); -- address
		G1  : IN  STD_LOGIC; -- enable positive
		G2n : IN  STD_LOGIC; -- enable negitive
		G3n : IN  STD_LOGIC; -- enable negitive
		Y   : out STD_LOGIC_VECTOR(3 downto 0)
		);
END COMPONENT;

COMPONENT gh_4byte_control_reg_32 IS 
	 port(
		clk  :  IN STD_LOGIC; -- sample clock
		rst  :  IN STD_LOGIC;
		WR   :  IN STD_LOGIC; -- Write signal
		BE   :  IN STD_LOGIC_vector(3 downto 0); -- byte enable
		MODE :  IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		D    :  IN STD_LOGIC_vector(31 downto 0);-- data bus in
		Q    :  out STD_LOGIC_VECTOR(31 downto 0)
		);
END COMPONENT;
	
	signal	iWR    :  STD_LOGIC_VECTOR(3 downto 0);
	signal	iQ     :  STD_LOGIC_VECTOR(127 downto 0);	

	
BEGIN 

--
-- OUTPUT 	   

	Q <= iQ;

--  read data
	RD <= iQ(31 downto 0) when (A = "00") else
	      iQ(63 downto 32) when (A = "01") else
	      iQ(95 downto 64) when (A = "10") else
	      iQ(127 downto 96);

--  decode logic

	U1 : gh_decode_2to4 PORT MAP (A,WR,'0',CSn,iWR);

----------------------------------------------------------------------------
----------------------------------------------------------------------------
--  Registers

	U2 : gh_4byte_control_reg_32 PORT MAP 
	     (clk,rst,iWR(0),BE,MODE,D(31 downto 0),
	      iQ(31 downto 0));

	U3 : gh_4byte_control_reg_32 PORT MAP 
	     (clk,rst,iWR(1),BE,MODE,D(31 downto 0),
	      iQ(63 downto 32));
	
	U4 : gh_4byte_control_reg_32 PORT MAP 
	     (clk,rst,iWR(2),BE,MODE,D(31 downto 0),
	      iQ(95 downto 64));
	
	U5 : gh_4byte_control_reg_32 PORT MAP 
	     (clk,rst,iWR(3),BE,MODE,D(31 downto 0),
	      iQ(127 downto 96));
	
				
END; 
