---------------------------------------------------------------------
--	Filename:	gh_vme_read_5w.vhd
--
--			
--	Description:
--		a MUX to ease VME read interface design
--              
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 								 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	12/08/07  	G Huber  	Initial revision
--	
--------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity gh_vme_read_5w is
	GENERIC (
		CS0_dsize : integer :=16;
		CS1_dsize : integer :=16;
		CS2_dsize : integer :=16;
		CS3_dsize : integer :=16;
		CS4_dsize : integer :=16); 
	port (
		CSn    : in STD_LOGIC_VECTOR(4 downto 0);
		RD0    : in STD_LOGIC_VECTOR(CS0_dsize-1 downto 0);
		RD1    : in STD_LOGIC_VECTOR(CS1_dsize-1 downto 0);
		RD2    : in STD_LOGIC_VECTOR(CS2_dsize-1 downto 0);
		RD3    : in STD_LOGIC_VECTOR(CS3_dsize-1 downto 0);
		RD4    : in STD_LOGIC_VECTOR(CS4_dsize-1 downto 0);
		DATA_o : out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture a of gh_vme_read_5w is

	signal iRD0   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD1   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD2   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD3   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD4   : STD_LOGIC_VECTOR(16 downto 0);

begin
	
	iRD0(16 downto CS0_dsize) <= (others => '0');
	iRD0(CS0_dsize-1 downto 0) <= RD0;
	iRD1(16 downto CS1_dsize) <= (others => '0');
	iRD1(CS1_dsize-1 downto 0) <= RD1;
	iRD2(16 downto CS2_dsize) <= (others => '0');
	iRD2(CS2_dsize-1 downto 0) <= RD2;
	iRD3(16 downto CS3_dsize) <= (others => '0');
	iRD3(CS3_dsize-1 downto 0) <= RD3;
	iRD4(16 downto CS4_dsize) <= (others => '0');
	iRD4(CS4_dsize-1 downto 0) <= RD4;
	
	DATA_o <= iRD0(15 downto 0) when CSn(0) = '0' else
	          iRD1(15 downto 0) when CSn(1) = '0' else
	          iRD2(15 downto 0) when CSn(2) = '0' else
	          iRD3(15 downto 0) when CSn(3) = '0' else
	          iRD4(15 downto 0);

end architecture;
