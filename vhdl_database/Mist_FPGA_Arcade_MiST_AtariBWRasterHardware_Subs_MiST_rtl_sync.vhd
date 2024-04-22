-- Video synchronizer circuit for Atari Subs
-- Similar circuit used in many other Atari and Kee Games arcade games
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

entity synchronizer is 
port(		
			Clk_12		: in	std_logic;
			Clk_6			: out	std_logic;
			HCount		: out	std_logic_vector(8 downto 0);
			VCount		: out	std_logic_vector(7 downto 0);
		   HSync			: buffer	std_logic;
			HBlank		: buffer std_logic;
			VBlank_s		: buffer std_logic;
			VBlank_n_s	: out std_logic;
			VBlank		: out	std_logic;
			VSync			: out std_logic;
			VSync_n		: out std_logic);
end synchronizer;

architecture rtl of synchronizer is

signal H_counter		: std_logic_vector(9 downto 0) := (others => '0');
signal H256				: std_logic;
signal H256_n			: std_logic;
signal H128				: std_logic;
signal H64				: std_logic;
signal H32				: std_logic;
signal H16				: std_logic;
signal H8				: std_logic;
signal H4				: std_logic;
signal H2				: std_logic;
signal H1				: std_logic;

signal V_counter		: std_logic_vector(7 downto 0) := (others => '0');
signal V128				: std_logic;
signal V64				: std_logic;
signal V32				: std_logic;
signal V16				: std_logic;
signal V8				: std_logic;
signal V4				: std_logic;
signal V2				: std_logic;
signal V1				: std_logic;

signal HSync_n			: std_logic := '1';
signal VReset_n		: std_logic := '1';

signal sync_data		: std_logic_vector(3 downto 0);

begin

Clk_6 <= H_counter(0);
H8 <= H_counter(4);
H32 <= H_counter(6);
H64 <= H_counter(7);
H128 <= H_counter(8);
H256 <= H_counter(9);
H256_n <= (not H_counter(9));
HCount <= H_counter(9 downto 1);

V64 <= V_counter(6);
V128 <= V_counter(7);
VCount <= V_counter(7 downto 0);

-- Horizontal counter is 9 bits long plus additional flip flop. The last 4 bit IC in the chain resets to 0010 so total count resets to 128 
-- using only the last three count states
H_count: process(clk_12)
begin
	if rising_edge(clk_12) then
		if h_counter = "1111111111" then
			h_counter <= "0100000000";
		else
			h_counter <= h_counter + 1;
		end if;
	end if;
end process;

-- Vertical counter is 8 bits, clocked by the rising edge of H256 at the end of each horizontal line
V_count: process(HSync)
begin
	if rising_edge(HSync) then
		if vreset_n = '0' then
			v_counter <= (others => '0');
		else
			v_counter <= v_counter + '1';
		end if;
	end if;
end process;

-- A pair of D type flip-flops that generate the HBlank and HSync signals
M9_A: process(H256_n, H64, H32)
begin	
	if H256_n = '0' then	
		HBlank <= '0';
	else
		if rising_edge(H32) then
			HBlank <= not H64;
		end if;
	end if;
end process;

M9_B: process(HBlank, H8) 
begin
	if HBlank = '0' then
		HSync <= '0';
		hsync_n <= '1';
	else
		if rising_edge(H8) then
			HSync <= H32;
			hsync_n <= (not H32);
		end if;
	end if;
end process;

-- Many Kee and Atari games used a small bipolar PROM to decode the VSync signals
--N8: entity work.prom
--port map(
--		address => Vblank_s & V_counter(7 downto 6) & V_counter(4 downto 0),
--		data => sync_data
--		);

N8: entity work.PROM_SYNC
port map(
	clk => Clk_12,
	addr => Vblank_s & V_counter(7 downto 6) & V_counter(4 downto 0),
	data => sync_data
);

-- Latch on output of sync PROM
N9: process(HSync, sync_data)
begin	
	if rising_edge(HSync) then
		VBlank_s <= sync_data(3);
		VBlank_n_s <= (not sync_data(3));
		VReset_n <= (not sync_data(2));
		VBlank <= sync_data(1);
		Vsync <= sync_data(0);
		Vsync_n <= (not sync_data(0));
	end if;
end process;

end rtl;