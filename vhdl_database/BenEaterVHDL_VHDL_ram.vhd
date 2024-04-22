--
-- Based on Ben Eater's build of the SAP breadboard computer and his excellent videos.
-- https://eater.net/
--
-- Copyright (c) 2017 Ken Jordan
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAM is
	generic (
		addrwidth:	integer := 4;
		datawidth:	integer := 8
	);
	port(
		clk_i	: in	std_logic;
		we_i	: in	std_logic;
		addr_i	: in	std_logic_vector(addrwidth-1 downto 0);
		write_i : in	std_logic_vector(datawidth-1 downto 0);
		read_o	: out	std_logic_vector(datawidth-1 downto 0)
	);
end entity RAM;

-- 0000 xxxx	NOP
-- 0001 mmmm	LDA
-- 0010 mmmm	ADD
-- 0011 mmmm	SUB
-- 0100 mmmm	STA
-- 0101 iiii	LDI
-- 0110 mmmm	JMP
-- 0111 mmmm	JCS
-- 1000
-- 1001
-- 1010
-- 1011
-- 1100
-- 1101
-- 1110 xxxx	OUT
-- 1111 xxxx	HLT

architecture RTL of RAM is
	constant ramtop : integer := (2**addrwidth)-1;
	type ram_type is array(0 to ramtop) of std_logic_vector(datawidth-1 downto 0);
	signal addr_r	: unsigned(addrwidth-1 downto 0);

	signal ram : ram_type :=
(
	 0 => x"1E",	-- LDA	14
	 1 => x"2F",	-- ADD	15
	 2 => x"E0",	-- OUT
	 3 => x"2D",	-- ADD	13
	 4 => x"E0",	-- OUT
	 5 => x"77",	-- JC	7
	 6 => x"63",	-- JMP	3
	 7 => x"51",	-- LDI	1
	 8 => x"3D",	-- SUB 13
	 9 => x"79",	-- JC	9
	10 => x"F0",	-- HALT
	11 => x"F0",	-- HALT
	12 => x"F0",	-- HALT
	13 => x"01",	-- increment
	14 => x"EA",	-- initial value
	15 => x"04"		-- initial add
);

attribute syn_ramstyle : string;
attribute syn_ramstyle of RAM : signal is "block_ram";

begin
	do_ram:
	process (clk_i)
	begin
		if falling_edge(clk_i) then
			if we_i='1' then
				ram(to_integer(unsigned(addr_i))) <= write_i;
			end if;
			addr_r <= unsigned(addr_i);
		end if;
	end process do_ram;
	read_o <= ram(to_integer(addr_r));
end architecture RTL;
