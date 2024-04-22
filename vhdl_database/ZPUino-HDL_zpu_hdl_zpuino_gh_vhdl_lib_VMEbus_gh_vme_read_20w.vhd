---------------------------------------------------------------------
--	Filename:	gh_vme_read_20w.vhd
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

entity gh_vme_read_20w is
	GENERIC (
		CS0_dsize : integer :=16;
		CS1_dsize : integer :=16;
		CS2_dsize : integer :=16;
		CS3_dsize : integer :=16;
		CS4_dsize : integer :=16;
		CS5_dsize : integer :=16;
		CS6_dsize : integer :=16;
		CS7_dsize : integer :=16;
		CS8_dsize : integer :=16;
		CS9_dsize : integer :=16;
		CS10_dsize : integer :=16;
		CS11_dsize : integer :=16;
		CS12_dsize : integer :=16;
		CS13_dsize : integer :=16;
		CS14_dsize : integer :=16;
		CS15_dsize : integer :=16;
		CS16_dsize : integer :=16;
		CS17_dsize : integer :=16;
		CS18_dsize : integer :=16;
		CS19_dsize : integer :=16); 
	port (
		CSn    : in STD_LOGIC_VECTOR(19 downto 0);
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
		RD10   : in STD_LOGIC_VECTOR(CS0_dsize-1 downto 0);
		RD11   : in STD_LOGIC_VECTOR(CS1_dsize-1 downto 0);
		RD12   : in STD_LOGIC_VECTOR(CS2_dsize-1 downto 0);
		RD13   : in STD_LOGIC_VECTOR(CS3_dsize-1 downto 0);
		RD14   : in STD_LOGIC_VECTOR(CS4_dsize-1 downto 0);
		RD15   : in STD_LOGIC_VECTOR(CS5_dsize-1 downto 0);
		RD16   : in STD_LOGIC_VECTOR(CS6_dsize-1 downto 0);
		RD17   : in STD_LOGIC_VECTOR(CS7_dsize-1 downto 0);
		RD18   : in STD_LOGIC_VECTOR(CS8_dsize-1 downto 0);
		RD19   : in STD_LOGIC_VECTOR(CS9_dsize-1 downto 0);
		DATA_o : out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture a of gh_vme_read_20w is

	signal iRD0   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD1   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD2   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD3   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD4   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD5   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD6   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD7   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD8   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD9   : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD10  : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD11  : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD12  : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD13  : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD14  : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD15  : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD16  : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD17  : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD18  : STD_LOGIC_VECTOR(16 downto 0);
	signal iRD19  : STD_LOGIC_VECTOR(16 downto 0);

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
	iRD5(16 downto CS5_dsize) <= (others => '0');
	iRD5(CS5_dsize-1 downto 0) <= RD5;
	iRD6(16 downto CS6_dsize) <= (others => '0');
	iRD6(CS6_dsize-1 downto 0) <= RD6;
	iRD7(16 downto CS7_dsize) <= (others => '0');
	iRD7(CS7_dsize-1 downto 0) <= RD7;
	iRD8(16 downto CS8_dsize) <= (others => '0');
	iRD8(CS8_dsize-1 downto 0) <= RD8;
	iRD9(16 downto CS9_dsize) <= (others => '0');
	iRD9(CS9_dsize-1 downto 0) <= RD9;
	iRD10(16 downto CS10_dsize) <= (others => '0');
	iRD10(CS10_dsize-1 downto 0) <= RD10;
	iRD11(16 downto CS11_dsize) <= (others => '0');
	iRD11(CS11_dsize-1 downto 0) <= RD11;
	iRD12(16 downto CS12_dsize) <= (others => '0');
	iRD12(CS12_dsize-1 downto 0) <= RD12;
	iRD13(16 downto CS13_dsize) <= (others => '0');
	iRD13(CS13_dsize-1 downto 0) <= RD13;
	iRD14(16 downto CS14_dsize) <= (others => '0');
	iRD14(CS14_dsize-1 downto 0) <= RD14;
	iRD15(16 downto CS15_dsize) <= (others => '0');
	iRD15(CS15_dsize-1 downto 0) <= RD15;
	iRD16(16 downto CS16_dsize) <= (others => '0');
	iRD16(CS16_dsize-1 downto 0) <= RD16;
	iRD17(16 downto CS17_dsize) <= (others => '0');
	iRD17(CS17_dsize-1 downto 0) <= RD17;
	iRD18(16 downto CS18_dsize) <= (others => '0');
	iRD18(CS18_dsize-1 downto 0) <= RD18;
	iRD19(16 downto CS19_dsize) <= (others => '0');
	iRD19(CS19_dsize-1 downto 0) <= RD19;
	
	DATA_o <= iRD0(15 downto 0)  when CSn(0) = '0' else
	          iRD1(15 downto 0)  when CSn(1) = '0' else
	          iRD2(15 downto 0)  when CSn(2) = '0' else
	          iRD3(15 downto 0)  when CSn(3) = '0' else
	          iRD4(15 downto 0)  when CSn(4) = '0' else
	          iRD5(15 downto 0)  when CSn(5) = '0' else
	          iRD6(15 downto 0)  when CSn(6) = '0' else
	          iRD7(15 downto 0)  when CSn(7) = '0' else
	          iRD8(15 downto 0)  when CSn(8) = '0' else
	          iRD9(15 downto 0)  when CSn(9) = '0' else
	          iRD10(15 downto 0) when CSn(10) = '0' else
	          iRD11(15 downto 0) when CSn(11) = '0' else
	          iRD12(15 downto 0) when CSn(12) = '0' else
	          iRD13(15 downto 0) when CSn(13) = '0' else
	          iRD14(15 downto 0) when CSn(14) = '0' else
	          iRD15(15 downto 0) when CSn(15) = '0' else
	          iRD16(15 downto 0) when CSn(16) = '0' else
	          iRD17(15 downto 0) when CSn(17) = '0' else
	          iRD18(15 downto 0) when CSn(18) = '0' else
	          iRD19(15 downto 0);

end architecture;
