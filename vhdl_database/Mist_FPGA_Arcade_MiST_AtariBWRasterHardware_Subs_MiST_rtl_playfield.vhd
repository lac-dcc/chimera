-- Playfield generation circuitry for Atari Subs
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
			HCount			: in  std_logic_vector(8 downto 0);
			VCount			: in  std_logic_vector(7 downto 0);
			VBlank_n_s		: in  std_logic; -- VBLANK* on the schematic	
			HSync				: in	std_logic;
			H256_s			: out std_logic; -- 256H* on schematic
			PFld1_n			: out std_logic;
			Pfld2_n			: out std_logic
			);
end playfield;

architecture rtl of playfield is		

signal HSync_n			: std_logic;	
			
signal H256				: std_logic;
signal H256_n			: std_logic;
signal H128				: std_logic;
signal H64				: std_logic;
signal H32				: std_logic;
signal H8				: std_logic;
signal H4				: std_logic;
signal H2				: std_logic;
signal H1				: std_logic;

signal V128				: std_logic;
signal V64				: std_logic;	
signal V128_V64_n		: std_logic := '1';
signal V128_V64		: std_logic := '0';

signal Sonar			: std_logic := '0';
signal SnrWndo_n			: std_logic := '0';
signal SnrWndo1_n		: std_logic := '0';
signal SnrWndo2_n		: std_logic := '0';
signal M6_AQ_n			: std_logic := '1';
signal M6_BQ_n			: std_logic := '1';
signal M8_Q_n			: std_logic := '1';	
signal DMA_n			: std_logic_vector(7 downto 0);
signal SnrDMA_n		: std_logic_vector(1 downto 0);		
			
signal Char_Load_n	: std_logic := '1';	
signal SLoad_n			: std_logic;
signal Shift_data		: std_logic_vector(7 downto 0) := (others => '0');	
signal PField			: std_logic := '0';	
signal Dispd			: std_logic_vector(7 downto 0) := (others => '0');

signal L6_reg			: std_logic_vector(2 downto 0);
			
			
			
begin			

H1 <= HCount(0);
H2 <= HCount(1);			
H4 <= HCount(2);
H8 <= HCount(3);
H32 <= HCount(5);
H64 <= HCount(6);
H128 <= HCount(7);
H256 <= HCount(8);
H256_n <= (not HCount(8));
Hsync_n <= (not HSync);

V64 <= VCount(6);
V128 <= VCount(7);

		
DMA_n <= (not DMA);
SnrDMA_n(1) <= DMA_n(7) nor SnrWndo_n;
SnrDMA_n(0) <= DMA_n(6) nor SnrWndo_n;			



--M4: entity work.pf_rom
--port map(
--		clock => clk6,
--		address => SnrDMA_n(1) & SnrDMA_n(0) & DMA(5 downto 0) & VCount(2 downto 0),
--		q => Dispd
--		);
			
M4: entity work.ROM_M4
port map(
	clk => clk6,
	addr => SnrDMA_n(1) & SnrDMA_n(0) & DMA(5 downto 0) & VCount(2 downto 0),
	data => Dispd
);
			
Char_Load_n <= not (H1 and H2 and H4);
SLoad_n <= Char_Load_n or H256_n;

-- 74LS166 video shift register	
N4: process(clk6, SLoad_n, VBlank_n_s, Dispd, shift_data)
begin
	if VBlank_n_s = '0' then -- Connected Clear input
		shift_data <= (others => '0');
	elsif rising_edge(clk6) then 
		if SLoad_n = '0' then -- Parallel load
			shift_data <= Dispd;
		else
			shift_data <= shift_data(6 downto 0) & '0';
		end if;
	end if;
	PField <= shift_data(7);
end process;

			
-- Sonar window circuit
V128_V64_n <= V128 nand V64;
V128_V64 <= (not V128_V64_n);
Sonar <= not (V128_V64 and H128 and H64);

M6_A: process(Sonar, H256, H32)
begin
	if H256 = '0' then -- asynchronous preset
		M6_AQ_n <= '0';
	elsif rising_edge(H32) then
		M6_AQ_n <= (not Sonar);
	end if;
end process;

M6_B: process(V128_V64_n, HSync_n, M8_Q_n)
begin
	if M8_Q_n = '0' then -- asynchronous preset
		M6_BQ_n <= '0';
	elsif rising_edge(HSync_n) then
		M6_BQ_n <= (not V128_V64_n);
	end if;
end process;
	
M8: process(H32, H256)
begin	
	if rising_edge(H32) then
		M8_Q_n <= (not H256);
	end if;
end process;

SnrWndo_n <= (M6_AQ_n nor M6_BQ_n);

M7: process(H8, M6_AQ_n, M6_BQ_n)
begin	
	if rising_edge(H8) then
		SnrWndo1_n <= (not M6_BQ_n);
		SnrWndo2_n <= (not M6_AQ_n);
	end if;
end process;


-- 74LS163 counter at L6
-- CEP and CET tied to ground, counter is used only as a synchronous latch
L6: process(clk6, H256, Char_Load_n, DMA_n, SnrWndo_n)
begin
	if rising_edge(clk6) then
		if Char_Load_n = '0' then
			L6_reg <= (DMA_n(7) nand SnrWndo_n) & (DMA_n(6) nand SnrWndo_n) & H256;
		end if;
	end if;
end process;
H256_s <= L6_reg(0);
PFLd1_n <= not (L6_reg(1) and SnrWndo1_n and PField);
PFLd2_n <= not (L6_reg(2) and SnrWndo2_n and PField);

end rtl;
