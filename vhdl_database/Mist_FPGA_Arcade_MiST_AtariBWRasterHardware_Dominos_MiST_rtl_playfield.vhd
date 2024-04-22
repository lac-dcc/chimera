-- Playfield generation circuitry for Atari Dominos
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
			clk6			: in  std_logic;
			display			: in  std_logic_vector(7 downto 0);
			HCount			: in  std_logic_vector(8 downto 0);
			VCount			: in  std_logic_vector(7 downto 0);
			H256_s			: out std_logic;
			HBlank			: in  std_logic;
			VBlank			: in  std_logic;
			VBlank_n_s		: in  std_logic; -- VBLANK* on the schematic	
			HSync			: in  std_logic;
			VSync			: in  std_logic;
			CompSync_n_s	        : out std_logic; -- COMP SYNC* on schematic
			CompBlank_s		: out std_logic; -- COMP BLANK* on schematic
			WhitePF_n		: out std_logic; -- White playfield objects
			BlackPF_n		: out std_logic  -- Black playfield objects
			);
end playfield;

architecture rtl of playfield is

signal H1				: std_logic;
signal H2				: std_logic;
signal H4				: std_logic;
signal H256				: std_logic;
signal H256_n			        : std_logic;

signal V1				: std_logic;
signal V2				: std_logic;
signal V4				: std_logic;

signal char_addr		        : std_logic_vector(8 downto 0) := (others => '0');
signal char_data		        : std_logic_vector(7 downto 0) := (others => '0');

signal shift_data		        : std_logic_vector(7 downto 0) := (others => '0');
signal QH				: std_logic;

signal R2_reg		                : std_logic_vector(3 downto 0) := (others => '0');


-- These signals are based off the schematic and are formatted as Designator_PinNumber
signal R7_12			        : std_logic;
signal P3_3				: std_logic;
signal P2_13			        : std_logic;
signal P3_6				: std_logic;
signal A6_6				: std_logic;
signal A6_3				: std_logic;

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
R7_12 <= not(H1 and H2 and H4);

P3_3 <= (H256_n or R7_12);

P2_13 <= (HSync nor VSync);

P3_6 <= (HBlank or VBlank);

char_addr <= display(5 downto 0) & V4 & V2 & V1;
	
R4: entity work.sprom
generic map(
	widthad_a => 9,
	width_a => 4,
   init_file =>"roms/7440-01.r4.mif"
	)
port map(
	address => char_addr,
	clock => clk6,
	q => char_data(3 downto 0) 
	);

P4: entity work.sprom
generic map(
	widthad_a => 9,
	width_a => 4,
   init_file =>"roms/7439-01.p4.mif"
	)
port map(
	address => char_addr,
	clock => clk6,
	q => char_data(7 downto 4) 
	);
	
-- 74LS166 video shift register	
R3: process(clk6, P3_3, VBlank_n_s, char_data, shift_data)
begin
	if VBlank_n_s = '0' then -- Connected Clear input
		shift_data <= (others => '0');
	elsif rising_edge(clk6) then 
		if P3_3 = '0' then -- Parallel load
			shift_data <= char_data(7 downto 0);
		else
			shift_data <= shift_data(6 downto 0) & '0';
		end if;
	end if;
	QH <= shift_data(7);
end process;


-- 9316 counter at R2
-- CEP and CET tied to ground, counter is used only as a synchronous latch
R2: process(clk6, R7_12, display, H256, P2_13, P3_6)
begin
	if rising_edge(clk6) then
		if R7_12 = '0' then
			R2_reg <= (H256 & display(7) & P3_6 & P2_13);
		end if;
	end if;
end process;


H256_s <= R2_reg(3);
CompBlank_s <= R2_reg(1);
CompSync_n_s <= R2_reg(0);
A6_6 <= (R2_reg(2) and QH);
A6_3 <= ((not R2_reg(2)) and QH);

WhitePF_n <= (not A6_6);
BlackPF_n <= (not A6_3);

end rtl;
