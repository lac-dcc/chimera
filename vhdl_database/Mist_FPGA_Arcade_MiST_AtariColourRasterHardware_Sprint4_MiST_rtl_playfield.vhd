-- Playfield generation and video mixing circuitry for Atari Sprint 4
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

entity playfield is 
port(		
			Clk6				: in	std_logic;
			DMA				: in	std_logic_vector(7 downto 0);
			PRAM				: in  std_logic_vector(7 downto 0);
			Load_n			: in  std_logic_vector(8 downto 1);
			Car				: in  std_logic_vector(4 downto 1);
			HCount			: in  std_logic_vector(8 downto 0);
			VCount			: in  std_logic_vector(7 downto 0);
			HBlank			: in  std_logic;
			VBlank			: in  std_logic;
			VBlank_n_s		: in  std_logic; -- VBLANK* on the schematic	
			HSync				: in	std_logic;
			VSync				: in	std_logic;
			H256_s			: out std_logic;
			CompBlank		: buffer std_logic;
			CompSync_n		: out std_logic;
			Playfield_n		: out std_logic;
			WhiteVid			: buffer std_logic;
			PeachVid			: buffer std_logic;
			VioletVid		: buffer std_logic;
			GreenVid			: buffer std_logic;
			BlueVid			: buffer std_logic;
			Video1			: out std_logic;
			Video2			: out std_logic
			);
end playfield;

architecture rtl of playfield is

signal H1				: std_logic;
signal H2				: std_logic;
signal H4				: std_logic;
signal H256				: std_logic;
signal H256_n			: std_logic;

signal V1				: std_logic;
signal V2				: std_logic;
signal V4				: std_logic;

signal char_addr		: std_logic_vector(10 downto 0) := (others => '0');
signal char_data		: std_logic_vector(7 downto 0) := (others => '0');
signal shift_data		: std_logic_vector(7 downto 0) := (others => '0');
signal QH				: std_logic := '0';
signal H8_reg			: std_logic_vector(3 downto 0) := (others => '0');
signal H9_in			: std_logic_vector(3 downto 0) := (others => '0');
signal H9_out			: std_logic_vector(9 downto 0) := (others => '0');
signal H10_Q 			: std_logic_vector(7 downto 0) := (others => '0');
signal Numeral_n		: std_logic;
signal Color0			: std_logic;
signal Color1			: std_logic;
signal J10_D			: std_logic_vector(4 downto 0) := (others => '0');
signal J10_Q			: std_logic_vector(4 downto 0) := (others => '0');
signal CarLoad_n		: std_logic_vector(4 downto 1) := (others => '0');
signal CarLoad			: std_logic_vector(4 downto 1) := (others => '1');
signal CharLoad_n		: std_logic := '1';
signal K9 				: std_logic_vector(4 downto 1) := (others => '0');
signal DMA6_s			: std_logic := '0'; -- DMA6* on schematic
signal PRAM6_s			: std_logic := '0'; -- PRAM6* on schematic

-- These signals are based off the schematic and are formatted as Designator_PinNumber
-- they really ought to have more descriptive names
signal R3_8				: std_logic;
signal P2_13			: std_logic;
signal P3_6				: std_logic;
signal A6_6				: std_logic;
signal A6_3				: std_logic;
signal L10				: std_logic;


begin

-- Video synchronization signals
H1 <= Hcount(0);
H2 <= Hcount(1);
H4 <= Hcount(2);
H256 <= Hcount(8);
H256_n <= not(Hcount(8));

V1 <= Vcount(0);
V2 <= Vcount(1);
V4 <= Vcount(2);

-- Some glue logic, may be re-written later to be cleaner and easier to follow without referring to schematic
CharLoad_n <= not(H1 and H2 and H4);
R3_8 <= (H256_n or CharLoad_n);
PRAM6_s <= PRAM(6) and (PRAM(5) nand PRAM(4));
DMA6_s <= DMA(6) and (DMA(5) nand DMA(4));
Char_Addr <= DMA(7) & DMA6_s & DMA(5 downto 0) & V4 & V2 & V1;


-- Background character ROM
H5: entity work.ROM_H5
port map(
	clk => clk6,
	Addr => char_addr,
	data => char_data
	);
	
	
-- 74LS166 video shift register	
R3: process(clk6, R3_8, VBlank_n_s, char_data, shift_data)
begin
	if VBlank_n_s = '0' then -- Connected Clear input
		shift_data <= (others => '0');
	elsif rising_edge(clk6) then 
		if R3_8 = '0' then -- Parallel load
			shift_data <= char_data;
		else
			shift_data <= shift_data(6 downto 0) & '0';
		end if;
	end if;
	QH <= shift_data(7);
end process;


-- 9316 counter at H8
-- CEP and CET tied to ground, counter is used only as a synchronous latch
H8: process(clk6, CharLoad_n, DMA, H256)
begin
	if rising_edge(clk6) then
		if CharLoad_n = '0' then
			H8_reg <= ((not DMA(7)) or (DMA(5) nand DMA(4))) & ((not DMA(6)) or (DMA(5) nand DMA(4))) & (DMA(5) nand DMA(4)) & H256; -- A bit hard to follow, see schematic
		end if;
	end if;
end process;

Color0 <= H8_reg(3);
Color1 <= H8_reg(2);
Numeral_n <= H8_reg(1);
H256_s <= H8_reg(0);

Playfield_n <= (not QH);

H9_in <= (not QH) & Numeral_n & Color1 & Color0;

H9: process(H9_in)
begin
	case H9_in is
      when "0000" =>
         H9_out <= "1111111110";
      when "0001" =>
         H9_out <= "1111111101";
      when "0010" =>
         H9_out <= "1111111011";
      when "0011" =>
         H9_out <= "1111110111";
      when "0111" =>
         H9_out <= "1101111111";
      when others =>
         H9_out <= "1111111111";
      end case;
end process;


LK9_10: process(Load_n, PRAM)
begin
	if rising_edge(Load_n(1)) then
		CarLoad_n(1) <= (not PRAM(7));
		CarLoad(1) <= PRAM(7);
	end if;
	
	if rising_edge(Load_n(2)) then
		CarLoad_n(2) <= (not PRAM(7));
		CarLoad(2) <= PRAM(7);
	end if;
	
	if rising_edge(Load_n(3)) then
		CarLoad_n(3) <= (not PRAM(7));
		CarLoad(3) <= PRAM(7);
	end if;
	
	if rising_edge(Load_n(4)) then
		CarLoad_n(4) <= (not PRAM(7));
		CarLoad(4) <= PRAM(7);
	end if;
end process;

K9(4) <= CarLoad_n(4) nand Car(4);
K9(3) <= CarLoad_n(3) nand Car(3);
K9(2) <= CarLoad_n(2) nand Car(2);
K9(1) <= CarLoad_n(1) nand Car(1);

L10 <=  ((CarLoad(4) nand Car(4)) and (CarLoad(3) nand Car(3)) and (CarLoad(2) nand Car(2)) and (CarLoad(1) nand Car(1)));

J10_D <= (L10 nand H9_out(7)) & (K9(1) nand H9_out(0)) & (K9(2) nand H9_out(1)) & (K9(3) nand H9_out(2)) & (K9(4) nand H9_out(3));

-- 74LS174 hex D flip-flop at J10
J10: process(clk6, J10_D)
begin	
	if rising_edge(clk6) then
		J10_Q <= J10_D;
	end if;
end process;

WhiteVid <= J10_Q(4);
PeachVid <= J10_Q(3);
VioletVid <= J10_Q(2);
GreenVid <= J10_Q(1);
BlueVid <= J10_Q(0);

CompBlank <= HBlank nor VBlank;
CompSync_n <= HSync nor VSync;

Video1 <= (WhiteVid or VioletVid or GreenVid); -- should be inverted?
Video2 <= (PeachVid or BlueVid or WhiteVid);

end rtl;