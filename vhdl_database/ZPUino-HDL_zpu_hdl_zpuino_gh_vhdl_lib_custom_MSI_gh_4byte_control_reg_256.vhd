---------------------------------------------------------------------
--	Filename:	gh_4byte_control_reg_256.vhd
--
--	Description:
--		4 byte control register, this has 128 bits 
--			mode = "00" writes D to Q
--			mode = "01" sets D bits in Q
--			mode = "10" clears D bits in Q
--			mode = "11" inverts D bits in Q
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	12/27/07  	S A Dodd 	Initial revision
--	
---------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ENTITY gh_4byte_control_reg_256 IS 
	port(
		clk  : IN STD_LOGIC; -- sample clock
		rst  : IN STD_LOGIC;
		CSn  : IN STD_LOGIC; -- chip select
		WR   : IN STD_LOGIC; -- Write signal
		BE   : IN STD_LOGIC_vector(3 downto 0); -- byte enables
		MODE : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		A    : IN STD_LOGIC_vector(2 downto 0); -- address bus
		D    : IN STD_LOGIC_vector(31 downto 0);-- data bus in
		RD   : out STD_LOGIC_VECTOR(31 downto 0); -- read data
		Q    : out STD_LOGIC_VECTOR(255 downto 0)
		);
END entity;

ARCHITECTURE a OF gh_4byte_control_reg_256 IS 

COMPONENT gh_decode_2to4 IS 
	 port(
		A   : IN  STD_LOGIC_VECTOR(1 DOWNTO 0); -- address
		G1  : IN  STD_LOGIC; -- enable positive
		G2n : IN  STD_LOGIC; -- enable negitive
		G3n : IN  STD_LOGIC; -- enable negitive
		Y   : out STD_LOGIC_VECTOR(3 downto 0)
		);
END COMPONENT;

COMPONENT gh_4byte_control_reg_128 IS 
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
END COMPONENT;
	
	signal	iWR    :  STD_LOGIC_VECTOR(1 downto 0);
	signal	iQ     :  STD_LOGIC_VECTOR(255 downto 0);	
	signal	RD1    :  STD_LOGIC_VECTOR(31 downto 0);
	signal	RD2    :  STD_LOGIC_VECTOR(31 downto 0);

	
BEGIN 

--
-- OUTPUT 	   

	Q <= iQ;

--  read data
	RD <= RD1 when (A(2) = '0') else
	      RD2;

--  decode logic

	iWR <= "00" when ((WR = '0') or (CSn = '1')) else
	       "01" when (A(2) = '0') else
	       "10";

----------------------------------------------------------------------------
----------------------------------------------------------------------------
--  Registers

	U1 : gh_4byte_control_reg_128 PORT MAP 
	     (clk,rst,CSn,iWR(0),BE,MODE,A(1 downto 0),D,
	      RD1,iQ(127 downto 0));

	U2 : gh_4byte_control_reg_128 PORT MAP 
	     (clk,rst,CSn,iWR(1),BE,MODE,A(1 downto 0),D,
	      RD2,iQ(255 downto 128));
				
END; 
