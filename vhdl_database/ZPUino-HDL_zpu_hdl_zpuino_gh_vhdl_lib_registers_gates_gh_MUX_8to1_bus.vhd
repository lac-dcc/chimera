-----------------------------------------------------------------------------
--	Filename:	gh_MUX_8to1_bus.vhd
--
--	Description:
--		a 8 to 1 mux (data is bussed)	 
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

ENTITY gh_MUX_8to1_bus IS	
	GENERIC (size: INTEGER := 8);
	PORT(	
		sel : IN  STD_LOGIC_VECTOR(2 downto 0); -- select control
		A   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0'); 
		B   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0');
		C   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0'); 
		D   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0');
		E   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0'); 
		F   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0');
		G   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0'); 
		H   : IN  STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0');
		Y   : out STD_LOGIC_VECTOR(size-1 downto 0) := (others => '0')
		);
END entity;

ARCHITECTURE a OF gh_MUX_8to1_bus IS	  

BEGIN

	Y <= A when (sel = "000") else
	     B when (sel = "001") else
	     C when (sel = "010") else
	     D when (sel = "011") else
	     E when (sel = "100") else
	     F when (sel = "101") else
	     G when (sel = "110") else
	     H;

END architecture;

