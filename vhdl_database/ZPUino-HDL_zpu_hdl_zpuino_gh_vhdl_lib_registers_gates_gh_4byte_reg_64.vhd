---------------------------------------------------------------------
--	Filename:	gh_4byte_reg_64.vhd
--
--	Description:
--		This has 64 configuration bits  
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
 

ENTITY gh_4byte_reg_64 IS 
	port(
		clk  : IN STD_LOGIC; -- sample clock
		rst  : IN STD_LOGIC;
		CSn  : IN STD_LOGIC; -- chip select
		WR   : IN STD_LOGIC; -- Write signal
		BE   : IN STD_LOGIC_vector(3 downto 0); -- byte enables
		A    : IN STD_LOGIC; -- address bus
		D    : IN STD_LOGIC_vector(31 downto 0);-- data bus in
		RD   : out STD_LOGIC_VECTOR(31 downto 0); -- read data
		Q    : out STD_LOGIC_VECTOR(63 downto 0)
		);
END gh_4byte_reg_64;

ARCHITECTURE a OF gh_4byte_reg_64 IS 

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
	
	signal	iWR    :  STD_LOGIC_VECTOR(1 downto 0);
	signal	iQ     :  STD_LOGIC_VECTOR(63 downto 0);	

	
BEGIN 

--
-- OUTPUT 	   

	Q <= iQ;

--  read data
	RD <= iQ(31 downto 0) when (A = '0') else
	      iQ(63 downto 32);

	iWR <= (A and WR) & ((not A) and WR);
		  
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--  Registers

	U1 : gh_4byte_reg_32 PORT MAP 
	     (clk,rst,iWR(0),D(31 downto 0),BE,
	      iQ(31 downto 0));

	U2 : gh_4byte_reg_32 PORT MAP 
	     (clk,rst,iWR(1),D(31 downto 0),BE,
	      iQ(63 downto 32));
	

END; 
