-- Video mixer circuitry for Atari Subs
-- (c) 2018 James Sweet
--
-- This is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- This is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity mixer is 
port(		
			Clk6				: in	std_logic;
			PRAM				: in	std_logic_vector(7 downto 0);
			VBlank_n_s		: in  std_logic; -- VBLANK* on the schematic	
			Load_n			: in  std_logic_vector(7 downto 0);
			Invert1			: in  std_logic;
			Invert2			: in  std_logic;
			PFld1_n			: in  std_logic;
			PFld2_n			: in  std_logic;
			Sub1_n			: in 	std_logic;
			Sub2_n			: in  std_logic;
			Torp1				: in	std_logic;
			Torp2				: in  std_logic;
			H256_s			: in  std_logic; -- 256H* on schematic
			Video1			: out std_logic;
			Video2			: out std_logic
			);
end mixer;

architecture rtl of mixer is

signal SubEn1_n		: std_logic;
signal SubEn2_n 		: std_logic;
signal Sub1_n_Q		: std_logic;
signal Sub2_n_Q		: std_logic;
signal PFld1_n_Q		: std_logic;
signal PFld2_n_Q		: std_logic;
signal Torp1_2_Q		: std_logic;
signal RawVid1			: std_logic;
signal RawVid2			: std_logic;
signal VidInvert1		: std_logic;
signal VidInvert2		: std_logic;


begin

L9_A: process(Load_n(1), PRAM)
begin
	if rising_edge(Load_n(1)) then
		SubEn1_n <= (not PRAM(7));
	end if;
end process;

L9_B: process(Load_n(2), PRAM)
begin
	if rising_edge(Load_n(2)) then
		SubEn2_n <= (not PRAM(7));
	end if;
end process;



-- 74LS174 latches video signals with rising edge of 6MHz clock
L8: process(Clk6)
begin
	if rising_edge(Clk6) then
		Sub1_n_Q <= Sub1_n;
		PFld1_n_Q <= PFld1_n;
		Torp1_2_Q <= Torp1 nor Torp2;
		PFld2_n_Q <= PFld2_n;
		Sub2_n_Q <= Sub2_n;
	end if;
end process;
		
RawVid1 <= not ((SubEn2_n or Sub2_n_Q) and Sub1_n_Q and PFld1_n_Q and Torp1_2_Q);
RawVid2 <= not ((SubEn1_n or Sub1_n_Q) and Sub2_n_Q and PFld2_n_Q and Torp1_2_Q);

VidInvert1 <= (H256_s nand VBlank_n_s) nor Invert1;
VidInvert2 <= (H256_s nand VBlank_n_s) nor Invert2;
Video1 <= (VidInvert1 xor RawVid1);
Video2 <= (VidInvert2 xor RawVid2); 


end rtl;


