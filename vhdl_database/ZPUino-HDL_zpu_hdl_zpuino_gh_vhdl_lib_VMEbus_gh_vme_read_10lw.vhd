---------------------------------------------------------------------
--	Filename:	gh_vme_read_10lw.vhd
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

entity gh_vme_read_10lw is
	GENERIC (
		CS0_dsize : integer :=32;
		CS1_dsize : integer :=32;
		CS2_dsize : integer :=32;
		CS3_dsize : integer :=32;
		CS4_dsize : integer :=32;
		CS5_dsize : integer :=32;
		CS6_dsize : integer :=32;
		CS7_dsize : integer :=32;
		CS8_dsize : integer :=32;
		CS9_dsize : integer :=32); 
	port (
		CSn    : in STD_LOGIC_VECTOR(9 downto 0);
		RD0    : in STD_LOGIC_VECTOR(CS0_dsize-1 downto 0);
		RD1    : in STD_LOGIC_VECTOR(CS1_dsize-1 downto 0);
		RD2    : in STD_LOGIC_VECTOR(CS2_dsize-1 downto 0);
		RD3    : in STD_LOGIC_VECTOR(CS3_dsize-1 downto 0);
		RD4    : in STD_LOGIC_VECTOR(CS4_dsize-1 downto 0);
		RD5    : in STD_LOGIC_VECTOR(CS5_dsize-1 downto 0);
		RD6    : in STD_LOGIC_VECTOR(CS6_dsize-1 downto 0);
		RD7    : in STD_LOGIC_VECTOR(CS7_dsize-1 downto 0);
		RD8    : in STD_LOGIC_VECTOR(CS8_dsize-1 downto 0);
		RD9    : in STD_LOGIC_VECTOR(CS9_dsize-1 downto 0);
		DATA_o : out STD_LOGIC_VECTOR(31 downto 0));
end entity;

architecture a of gh_vme_read_10lw is

	signal iRD0   : STD_LOGIC_VECTOR(32 downto 0);
	signal iRD1   : STD_LOGIC_VECTOR(32 downto 0);
	signal iRD2   : STD_LOGIC_VECTOR(32 downto 0);
	signal iRD3   : STD_LOGIC_VECTOR(32 downto 0);
	signal iRD4   : STD_LOGIC_VECTOR(32 downto 0);
	signal iRD5   : STD_LOGIC_VECTOR(32 downto 0);
	signal iRD6   : STD_LOGIC_VECTOR(32 downto 0);
	signal iRD7   : STD_LOGIC_VECTOR(32 downto 0);
	signal iRD8   : STD_LOGIC_VECTOR(32 downto 0);
	signal iRD9   : STD_LOGIC_VECTOR(32 downto 0);

begin
	
	iRD0(32 downto CS0_dsize) <= (others => '0');
	iRD0(CS0_dsize-1 downto 0) <= RD0;
	iRD1(32 downto CS1_dsize) <= (others => '0');
	iRD1(CS1_dsize-1 downto 0) <= RD1;
	iRD2(32 downto CS2_dsize) <= (others => '0');
	iRD2(CS2_dsize-1 downto 0) <= RD2;
	iRD3(32 downto CS3_dsize) <= (others => '0');
	iRD3(CS3_dsize-1 downto 0) <= RD3;
	iRD4(32 downto CS4_dsize) <= (others => '0');
	iRD4(CS4_dsize-1 downto 0) <= RD4;
	iRD5(32 downto CS5_dsize) <= (others => '0');
	iRD5(CS5_dsize-1 downto 0) <= RD5;
	iRD6(32 downto CS6_dsize) <= (others => '0');
	iRD6(CS6_dsize-1 downto 0) <= RD6;
	iRD7(32 downto CS7_dsize) <= (others => '0');
	iRD7(CS7_dsize-1 downto 0) <= RD7;
	iRD8(32 downto CS8_dsize) <= (others => '0');
	iRD8(CS8_dsize-1 downto 0) <= RD8;
	iRD9(32 downto CS9_dsize) <= (others => '0');
	iRD9(CS9_dsize-1 downto 0) <= RD9;
	
	DATA_o <= iRD0(31 downto 0)  when CSn(0) = '0' else
	          iRD1(31 downto 0)  when CSn(1) = '0' else
	          iRD2(31 downto 0)  when CSn(2) = '0' else
	          iRD3(31 downto 0)  when CSn(3) = '0' else
	          iRD4(31 downto 0)  when CSn(4) = '0' else
	          iRD5(31 downto 0)  when CSn(5) = '0' else
	          iRD6(31 downto 0)  when CSn(6) = '0' else
	          iRD7(31 downto 0)  when CSn(7) = '0' else
	          iRD8(31 downto 0)  when CSn(8) = '0' else
	          iRD9(31 downto 0);

end architecture;
