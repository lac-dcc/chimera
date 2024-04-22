-- -----------------------------------------------------------------------
--
-- Syntiac's generic VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
--
-- Modified April 2016 by Dar (darfpga@aol.fr) 
-- http://darfpga.blogspot.fr
--   Remove address register when writing
--
-- Modifies Octiber 2017 by Dar 
--   Add init data with defender cmos value
-- -----------------------------------------------------------------------
--
-- gen_rwram.vhd init with defender cmos value
--
-- -----------------------------------------------------------------------
--
-- generic ram.
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity defender_cmos_ram is
	generic (
		dWidth : integer := 8;  -- must be 4 for defender_cmos_ram
		aWidth : integer := 10  -- must be 8 for defender_cmos_ram
	);
	port (
		clk : in std_logic;
		we : in std_logic;
		addr : in std_logic_vector((aWidth-1) downto 0);
		d : in std_logic_vector((dWidth-1) downto 0);
		q : out std_logic_vector((dWidth-1) downto 0)
	);
end entity;

-- -----------------------------------------------------------------------
-- defender cmos data
-- (ram is 128x4 => only 4 bits/address, that is only 1 hex digit/address)
--
-- @      values             - (fonction) meaning

--	0       0                 - ?
-- 1       0005              - (01) coins left
-- 5       0000              - (02) coins center
-- 9       0000              - (03) coins right
-- 13      0005              - (04) total paid
-- 17      0000              - (05) ships won
---21      0000              - (06) total time
-- 25      0003              - (07) total ships

-- -- 8 entries of 6 digits highscore + 3 ascii letters

-- 29      021270 44 52 4A   
-- 41      018315 53 41 4D
-- 53      015920 4C 45 44
-- 65      014285 50 47 44
-- 77      012520 43 52 42
-- 89      011035 4D 52 53
-- 101     008265 53 53 52
-- 113     006010 54 4D 48 

-- 125     00                - credits
-- 127     5                 - ?

-- -- protected data writeable only with coin door opened 

-- 128     A                 - ?
-- 129     0100              - (08) bonus ship level
-- 133     03                - (09) nb ships
-- 135     03                - (10) coinage select
-- 137     01                - (11) left coin mult
-- 139     04                - (12) center coin mult
-- 141     01                - (13) right coin mult
-- 143     01                - (14) coins for credit
-- 145     00                - (15) coins for bonus
-- 147     00                - (16) minimum coins
-- 149     00                - (17) free play
-- 151     05                - (18) game adjust 1  Stating difficulty 0=lib; 1=mod; 2=cons
-- 153     15                - (19) game adjust 2  Progessive wave diff. limit > 4-25
-- 155     01                - (20) game adjust 3  Background sound 0=off; 1=on
-- 157     05                - (21) game adjust 4  Planet restore wave number
-- 159     00                - (22) game adjust 5
-- 161     00                - (23) game adjust 6
-- 163     00                - (24) game adjust 7
-- 165     00                - (25) game adjust 8
-- 167     00                - (26) game adjust 9
-- 169     00                - (27) game adjust 10

-- 171     00000             - ?
-- 176     0000000000000000  - ?
-- 192     0000000000000000  - ?
--	208     0000000000000000  - ?
--	224     0000000000000000  - ?
--	240     0000000000000000  - ?


architecture rtl of defender_cmos_ram is
	subtype addressRange is integer range 0 to ((2**aWidth)-1);
	type ramDef is array(addressRange) of std_logic_vector((dWidth-1) downto 0);
	
	signal ram: ramDef := (
	   X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"2",X"1",
		X"2",X"7",X"0",X"4",X"4",X"5",X"2",X"4",X"A",X"0",X"1",X"8",X"3",X"1",X"5",X"5",
		X"3",X"4",X"1",X"4",X"D",X"0",X"1",X"5",X"9",X"2",X"0",X"4",X"C",X"4",X"5",X"4",
		X"4",X"0",X"1",X"4",X"2",X"8",X"5",X"5",X"0",X"4",X"7",X"4",X"4",X"0",X"1",X"2",
		X"5",X"2",X"0",X"4",X"3",X"5",X"2",X"4",X"2",X"0",X"1",X"1",X"0",X"3",X"5",X"4",
		X"D",X"5",X"2",X"5",X"3",X"0",X"0",X"8",X"2",X"6",X"5",X"5",X"3",X"5",X"3",X"5",
		X"2",X"0",X"0",X"6",X"0",X"1",X"0",X"5",X"4",X"4",X"D",X"4",X"8",X"0",X"0",X"5",
		X"A",X"0",X"1",X"0",X"0",X"0",X"3",X"0",X"3",X"0",X"1",X"0",X"4",X"0",X"1",X"0",
		X"1",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"5",X"1",X"5",X"0",X"1",X"0",X"5",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0");

	
	signal rAddrReg : std_logic_vector((aWidth-1) downto 0);
	signal qReg : std_logic_vector((dWidth-1) downto 0);
begin
-- -----------------------------------------------------------------------
-- Signals to entity interface
-- -----------------------------------------------------------------------
--	q <= qReg;

-- -----------------------------------------------------------------------
-- Memory write
-- -----------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if we = '1' then
				ram(to_integer(unsigned(addr))) <= d;
			end if;
		end if;
	end process;
	
-- -----------------------------------------------------------------------
-- Memory read
-- -----------------------------------------------------------------------
process(clk)
	begin
		if rising_edge(clk) then
--			qReg <= ram(to_integer(unsigned(rAddrReg)));
--			rAddrReg <= addr;
----			qReg <= ram(to_integer(unsigned(addr)));
      q <= ram(to_integer(unsigned(addr)));
		end if;
	end process;
--q <= ram(to_integer(unsigned(addr)));
end architecture;

