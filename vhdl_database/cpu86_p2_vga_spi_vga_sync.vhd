--
-- Copyright 2011, Kevin Lindsey
-- See LICENSE file for licensing information
--
-- Based on code from P. P. Chu, "FPGA Prototyping by VHDL Examples: Xilinx Spartan-3 Version", 2008
-- Chapters 12-13
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_sync is
	port(
		clock: in std_logic;
		reset: in std_logic;
		hsync, vsync: out std_logic;
		video_on: out std_logic;
		pixel_tick: out std_logic;
		pixel_x, pixel_y: out std_logic_vector(9 downto 0)
	);
end vga_sync;

architecture arch of vga_sync is
	-- VGA 640x480
	
	-- horizontal timings, in pixels
	constant h_display_area: integer := 640;
	constant h_front_porch: integer := 16;
	constant h_sync: integer := 96;
	constant h_back_porch: integer := 48;
	
	-- vertical timings, in lines
	constant v_display_area: integer := 480;
	constant v_front_porch: integer := 10;
	constant v_sync: integer := 2;
	constant v_back_porch: integer := 33;
	
	-- derived horizontal constants
	constant hsync_start: integer := h_display_area + h_front_porch;
	constant hsync_end: integer := hsync_start + h_sync;
	constant end_of_line: integer := hsync_end + h_back_porch - 1;
	
	-- derived vertical constants
	constant vsync_start: integer := v_display_area + v_front_porch;
	constant vsync_end: integer := vsync_start + v_sync;
	constant end_of_frame: integer := vsync_start + v_back_porch - 1;
	
	-- mod-2 counter
	signal mod2_reg, mod2_next: std_logic;
	
	-- sync counters
	signal v_count_reg, v_count_next: unsigned(9 downto 0);
	signal h_count_reg, h_count_next: unsigned(9 downto 0);
	
	-- output buffer
	signal v_sync_reg, h_sync_reg: std_logic;
	signal v_sync_next, h_sync_next: std_logic;
	
	-- status signals
	signal h_end, v_end, p_tick: std_logic;
begin
	-- registers
	process(clock, reset)
	begin
		if reset = '1' then
			mod2_reg <= '0';
			v_count_reg <= (others => '0');
			h_count_reg <= (others => '0');
			v_sync_reg <= '0';
			h_sync_reg <= '0';
		elsif clock'event and clock = '1' then
			mod2_reg <= mod2_next;
			v_count_reg <= v_count_next;
			h_count_reg <= h_count_next;
			v_sync_reg <= v_sync_next;
			h_sync_reg <= h_sync_next;
		end if;
	end process;
	
	-- mod-2 circuit to generate 25.125MHz enable tick
	mod2_next <= not mod2_reg;
	
	-- 25.125MHz pixel tick
	p_tick <= '1' when mod2_reg = '1' else '0';
	
	-- status
	h_end <=
		'1' when h_count_reg = end_of_line else
		'0';
	v_end <=
		'1' when v_count_reg = end_of_frame else
		'0';
	
	-- mod-800 horizontal sync counter
	process(h_count_reg, h_end, p_tick)
	begin
		if p_tick = '1' then
			if h_end = '1' then
				h_count_next <= (others => '0');
			else
				h_count_next <= h_count_reg + 1;
			end if;
		else
			h_count_next <= h_count_reg;
		end if;
	end process;
	
	-- mod-525 vertical sync counter
	process(v_count_reg, h_end, v_end, p_tick)
	begin
		if p_tick = '1' and h_end = '1' then
			if v_end = '1' then
				v_count_next <= (others => '0');
			else
				v_count_next <= v_count_reg + 1;
			end if;
		else
			v_count_next <= v_count_reg;
		end if;
	end process;
	
	-- hsync and vsync, buffered to avoid glitch
	h_sync_next <=
		'1' when hsync_start <= h_count_reg and h_count_reg < hsync_end else
		'0';
	v_sync_next <=
		'1' when vsync_start <= v_count_reg and v_count_reg < vsync_end else
		'0';
		
	-- video on/off
	video_on <=
		'1' when h_count_reg < h_display_area and v_count_reg < v_display_area else
		'0';
		
	-- output signals
	hsync <= h_sync_reg;
	vsync <= v_sync_reg;
	pixel_x <= std_logic_vector(h_count_reg);
	pixel_y <= std_logic_vector(v_count_reg);
	pixel_tick <= p_tick;
end arch;
