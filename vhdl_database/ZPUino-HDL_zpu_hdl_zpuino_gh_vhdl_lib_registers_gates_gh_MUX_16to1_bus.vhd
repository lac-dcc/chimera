-----------------------------------------------------------------------------
--	Filename:	gh_MUX_16to1_bus.vhd
--
--	Description:
--		a 16 to 1 mux (data is bussed)	 
--
--	Copyright (c) 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	07/04/08  	G Huber  	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gh_MUX_16to1_bus IS	
	GENERIC (size: INTEGER := 8);
	PORT(	
		sel : IN  STD_LOGIC_VECTOR(3 downto 0); -- select control
		A   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0'); 
		B   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0');
		C   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0'); 
		D   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0');
		E   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0'); 
		F   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0');
		G   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0'); 
		H   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0');
		
		I   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0'); 
		J   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0');
		K   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0'); 
		L   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0');
		M   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0'); 
		N   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0');
		O   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0'); 
		P   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0');
		Y   : out STD_LOGIC_VECTOR(size-1 downto 0)	:= (others => '0')
		);
END entity;

ARCHITECTURE a OF gh_MUX_16to1_bus IS	  

BEGIN

	Y <= A when (sel = "0000") else
	     B when (sel = "0001") else
	     C when (sel = "0010") else
	     D when (sel = "0011") else
	     E when (sel = "0100") else
	     F when (sel = "0101") else
	     G when (sel = "0110") else
	     H when (sel = "0111") else
	     I when (sel = "1000") else
	     J when (sel = "1001") else
	     K when (sel = "1010") else
	     L when (sel = "1011") else
	     M when (sel = "1100") else
	     N when (sel = "1101") else
	     O when (sel = "1110") else
	     P;

END architecture;

