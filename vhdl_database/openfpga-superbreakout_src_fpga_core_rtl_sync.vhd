-- Video synchronizer circuit for Super Breakout
-- Similar circuit used in many other Atari and Kee Games arcade games
-- (c)2017 James Sweet
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
			clk_12		: in	std_logic;
			clk_6			: out	std_logic;
			hcount		: out	std_logic_vector(8 downto 0);
			hcolor		: out std_logic_vector(7 downto 0);
			vcount		: out	std_logic_vector(7 downto 0);
		   hsync			: out	std_logic;
			hblank		: out std_logic;
			vblank_s		: out std_logic;
			vblank_n_s	: out std_logic;
			vblank		: out	std_logic;
			vsync			: out std_logic;
			vreset		: out	std_logic;
			
			--signals that carry the ROM data from the MiSTer disk
			dn_addr        	: in  std_logic_vector(15 downto 0);
			dn_data        	: in  std_logic_vector(7 downto 0);
			dn_wr          	: in  std_logic;
			rom_sync_prom_cs  : in std_logic

			
			);
end synchronizer;

architecture rtl of synchronizer is

signal h_counter		: std_logic_vector(9 downto 0) := (others => '0');
signal h_color			: std_logic_vector(7 downto 0);
signal H256				: std_logic;
signal H256_n			: std_logic;
signal H128				: std_logic;
signal H64				: std_logic;
signal H32				: std_logic;
signal H16				: std_logic;
signal H8				: std_logic;
signal H8_n				: std_logic;
signal H4				: std_logic;
signal H4_n				: std_logic;
signal H2				: std_logic;
signal H1				: std_logic;

signal v_counter		: std_logic_vector(7 downto 0) := (others => '0');
signal V128				: std_logic;
signal V64				: std_logic;
signal V32				: std_logic;
signal V16				: std_logic;
signal V8				: std_logic;
signal V4				: std_logic;
signal V2				: std_logic;
signal V1				: std_logic;

signal sync_bus		: std_logic_vector(3 downto 0) := (others => '0');
signal sync_reg		: std_logic_vector(3 downto 0) := (others => '0');
signal vblank_int		: std_logic := '0';
signal vreset_n		: std_logic := '0';

signal hblank_int		: std_logic := '0';
signal hsync_int		: std_logic := '0';
signal hsync_reset 	: std_logic := '0';


begin

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
V_count: process(hsync_int)
begin
	if rising_edge(Hsync_int) then
		if vreset_n = '0' then
			v_counter <= (others => '0');
		else
			v_counter <= v_counter + '1';
		end if;
	end if;
end process;

-- Many Atari raster games use a 256 x 4 bit prom to decode vertical sync signals
-- This could be replaced with combinatorial logic
--M2: entity work.sync_prom
--port map(
--		clock => clk_12, 
--		address => sync_reg(3) & V128 & V64 & V16 & V8 & V4 & V2 & V1,
--		q => sync_bus
--		);
M2 : work.dpram generic map (8,4)
port map
(
	clock_a   => clk_12,
	wren_a    => dn_wr and rom_sync_prom_cs,
	address_a => dn_addr(7 downto 0),
	data_a    => dn_data(3 downto 0),

	clock_b   => clk_12,
	address_b => sync_reg(3) & V128 & V64 & V16 & V8 & V4 & V2 & V1,
	q_b       => sync_bus 
);
-- Register fed by the sync PROM, in the original hardware this also creates the complements of these signals
sync_register: process(hsync_int)
begin
	if rising_edge(hsync_int) then
		sync_reg <= sync_bus;
	end if;
end process;

-- Outputs of sync PROM
vblank_s <= sync_reg(3);
vblank_n_s <= not sync_reg(3);
vreset <= sync_reg(2);
vreset_n <= not sync_reg(2);
vblank <= sync_reg(1);
vsync <= sync_reg(0);

-- A pair of D type flip-flops that generate the Hsync signal
R1_a: process(H256_n, H32)
begin	
	if H256_n = '0' then	
		hblank_int <= '0';
	else
		if rising_edge(H32) then
			hblank_int <= not H64;
		end if;
	end if;
end process;

R1_b: process(hblank_int, H8) 
begin
	if hblank_int = '0' then
		hsync_int <= '0';
	else
		if rising_edge(H8) then
			hsync_int <= H32;
		end if;
	end if;
end process;

-- Assign various signals
--hcolor <= h_counter(7 downto 1) & '0';
hcolor <= 255 - h_counter(8 downto 1);
clk_6 <= h_counter(0);
--H1 <= h_counter(1);
--H2 <= h_counter(2);
--H4 <= h_counter(3);
H8 <= h_counter(4);
--H16 <=  h_counter(5);
H32 <= h_counter(6);
H64 <= h_counter(7);
--H128 <= h_counter(8);
H256 <= h_counter(9);
--H4_n <= not H4;
--H8_n <= not H8;
H256_n <= not H256;

V1 <= v_counter(0);
V2 <= v_counter(1);
V4 <= v_counter(2);
V8 <= v_counter(3);
V16 <= v_counter(4);
--V32 <= v_counter(5);
V64 <= v_counter(6);
V128 <= v_counter(7);

hcount <= h_counter(9 downto 1);
vcount <= v_counter;
hsync <= hsync_int;
hblank <= hblank_int;

end rtl;