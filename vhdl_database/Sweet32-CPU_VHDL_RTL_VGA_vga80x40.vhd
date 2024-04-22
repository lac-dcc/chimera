-- Hi Emacs, this is -*- mode: vhdl; -*-
----------------------------------------------------------------------------------------------------
--
-- Monocrome Text Mode Video Controller VHDL Macro
-- 80x40 characters. Pixel resolution is 640x480/60Hz
-- 
-- Copyright (c) 2007 Javier Valcarce García, javier.valcarce@gmail.com
-- $Id$
--
----------------------------------------------------------------------------------------------------
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
-- GNU Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public License
-- along with this program.	If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga80x40 is
	port (
		reset		: in	std_logic;
		clk25		: in	std_logic;
		--
		cursoron	: in	std_logic;
		ocrx		: in	std_logic_vector(07 downto 0); -- OUTPUT regs
		ocry		: in	std_logic_vector(07 downto 0);
		octl		: in	std_logic_vector(07 downto 0);
		--
		FONT_A		: out std_logic_vector(10 downto 0); -- font buffer
		FONT_D		: in std_logic_vector(07 downto 0);
		TEXT_A		: out std_logic_vector(10 downto 0); -- text buffer
		TEXT_D		: in std_logic_vector(07 downto 0);
		COLOR_D		: in std_logic_vector(07 downto 0);

		--
		R			: out std_logic_vector(3 downto 0);
		G			: out std_logic_vector(3 downto 0);
		B			: out std_logic_vector(3 downto 0);
		hsync		: out std_logic;
		vsync		: out std_logic;
		nblank		: buffer std_logic		
	);	
end vga80x40;

architecture rtl of vga80x40 is

-- 640x400@70 (clock 25.175Mhz)
--	constant VISIBLE_WIDTH: integer			:= 640;		-- active display area pixels wide
--	constant H_FRONT_PORCH: integer			:= 16;		-- duration of horizontal "front porch" in pixel clocks (after active display and border, before hsync)
--	constant H_SYNC_PULSE: integer			:= 96;		-- duration of hsync pulse in pixel clocks
--	constant H_BACK_PORCH: integer			:= 48;		-- duration of horizontal "back porch" in pixel clocks (before border and active display, after hsync)
--	constant H_SYNC_POLARITY: STD_LOGIC		:= '0';
--	constant VISIBLE_HEIGHT: integer		:= 400;		-- active display area pixels high
--	constant V_FRONT_PORCH: integer			:= 12;		-- duration of vertical "front porch" in scan-lines (after active area, before vsync)
--	constant V_SYNC_PULSE: integer			:= 2;		-- duration of vsync pulse in scan-lines
--	constant V_BACK_PORCH: integer			:= 35;		-- duration of vertical "back porch" in scan-lines (before active area, after vsync)
--	constant V_SYNC_POLARITY: STD_LOGIC		:= '1';
--	constant TOTAL_WIDTH: integer			:= (VISIBLE_WIDTH+H_FRONT_PORCH+H_SYNC_PULSE+H_BACK_PORCH);
--	constant TOTAL_HEIGHT: integer			:= (VISIBLE_HEIGHT+V_FRONT_PORCH+V_SYNC_PULSE+V_BACK_PORCH);

-- 640x480@60 (clock 25.175Mhz)
--	constant VISIBLE_WIDTH: integer			:= 640;		-- active display area pixels wide
--	constant H_FRONT_PORCH: integer			:= 16;		-- duration of horizontal "front porch" in pixel clocks (after active display and border, before hsync)
--	constant H_SYNC_PULSE: integer			:= 96;		-- duration of hsync pulse in pixel clocks
--	constant H_BACK_PORCH: integer			:= 48;		-- duration of horizontal "back porch" in pixel clocks (before border and active display, after hsync)
--	constant H_SYNC_POLARITY: STD_LOGIC		:= '0';
--	constant VISIBLE_HEIGHT: integer		:= 480;		-- active display area pixels high
--	constant V_FRONT_PORCH: integer			:= 10;		-- duration of vertical "front porch" in scan-lines (after active area, before vsync)
--	constant V_SYNC_PULSE: integer			:= 2;		-- duration of vsync pulse in scan-lines
--	constant V_BACK_PORCH: integer			:= 33;		-- duration of vertical "back porch" in scan-lines (before active area, after vsync)
--	constant V_SYNC_POLARITY: STD_LOGIC		:= '0';
--	constant TOTAL_WIDTH: integer			:= (VISIBLE_WIDTH+H_FRONT_PORCH+H_SYNC_PULSE+H_BACK_PORCH);
--	constant TOTAL_HEIGHT: integer			:= (VISIBLE_HEIGHT+V_FRONT_PORCH+V_SYNC_PULSE+V_BACK_PORCH);

-- 800x600@60 (clock 40.0Mhz)
--	constant VISIBLE_WIDTH: integer			:= 800;		-- active display area pixels wide
--	constant H_FRONT_PORCH: integer			:= 40;		-- duration of horizontal "front porch" in pixel clocks (after active display and border, before hsync)
--	constant H_SYNC_PULSE: integer			:= 128;		-- duration of hsync pulse in pixel clocks
--	constant H_BACK_PORCH: integer			:= 88;		-- duration of horizontal "back porch" in pixel clocks (before border and active display, after hsync)
--	constant H_SYNC_POLARITY: STD_LOGIC		:= '1';
--	constant VISIBLE_HEIGHT: integer		:= 600;		-- active display area pixels high
--	constant V_FRONT_PORCH: integer			:= 1;		-- duration of vertical "front porch" in scan-lines (after active area, before vsync)
--	constant V_SYNC_PULSE: integer			:= 4;		-- duration of vsync pulse in scan-lines
--	constant V_BACK_PORCH: integer			:= 23;		-- duration of vertical "back porch" in scan-lines (before active area, after vsync)
--	constant V_SYNC_POLARITY: STD_LOGIC		:= '1';
--	constant TOTAL_WIDTH: integer			:= (VISIBLE_WIDTH+H_FRONT_PORCH+H_SYNC_PULSE+H_BACK_PORCH);
--	constant TOTAL_HEIGHT: integer			:= (VISIBLE_HEIGHT+V_FRONT_PORCH+V_SYNC_PULSE+V_BACK_PORCH);


	signal R_int : std_logic_vector(3 downto 0);
	signal G_int : std_logic_vector(3 downto 0);
	signal B_int : std_logic_vector(3 downto 0);
	signal color : std_logic_vector(7 downto 0);
	signal hsync_int : std_logic;
	signal vsync_int : std_logic;
	
	signal blank : std_logic;
--	signal blank2 : std_logic;
	signal hctr	: integer range 793 downto 0;
	signal vctr	: integer range 524 downto 0;
	-- character/pixel position on the screen
--	signal scry	: integer range 039 downto 0;	-- chr row	< 40 (6 bits)
	signal scry	: integer range 024 downto 0;	-- chr row	< 40 (6 bits)
	signal scrx	: integer range 079 downto 0;	-- chr col	< 80 (7 bits)
--	signal chry	: integer range 011 downto 0;	-- chr high	< 12 (4 bits)
	signal chry	: integer range 018 downto 0;	-- chr high	< 18 (4 bits)
	signal chrx	: integer range 007 downto 0;	-- chr width < 08 (3 bits)
	
	signal losr_ce : std_logic;
	signal losr_ld : std_logic;
	signal losr_do : std_logic;
	signal y		: std_logic;	-- character luminance pixel value (0 or 1)

	-- control io register
	signal ctl		: std_logic_vector(7 downto 0);
	signal vga_en	: std_logic;
	signal cur_en	: std_logic;
	signal cur_blink : std_logic;
 
begin

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------	
-- hsync generator, initialized with '1'
	process (reset, clk25)
	begin
		if reset = '1' then
			hsync_int <= '1';
		elsif rising_edge(clk25) then
			if (hctr > 655) and (hctr < 753) then
				hsync_int <= '0';
			else
				hsync_int <= '1';
			end if;
		end if;
	end process;


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- vsync generator, initialized with '1'
	process (reset, clk25)
	begin
		if reset = '1' then
			vsync_int <= '1';
		elsif rising_edge(clk25) then
			if (vctr > 489) and (vctr < 492) then
				vsync_int <= '1';
			else
				vsync_int <= '0';
			end if;
		end if;
	end process;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------	
-- Blank signal, 0 = no draw, 1 = visible/draw zone	

-- Proboscide99 31/08/08
--	blank <= '0' when (hctr > 639) or (vctr > 479) else '1';
	blank <= '0' when (hctr < 8) or (hctr > 647) or (vctr < 2) or (vctr > 479-3) else '1';

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------	
-- flip-flips for sync of R, G y B signal, initialized with '0'
	process (reset, clk25)
	begin
		if reset = '1' then
			R <= "0000";
			G <= "0000";
			B <= "0000";
		elsif rising_edge(clk25) then
			R <= R_int;
			G <= G_int;
			B <= B_int;
			nblank <= NOT blank;	
			if (chrx = 007) then
				color <= COLOR_D;
			end if;
		end if;
	end process;


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------	
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
	-- Control register. Individual control signal
	cur_blink	<= octl(5); 
	cur_en		<= octl(6); 
	vga_en		<= octl(7); 

	-- counters, hctr, vctr, srcx, srcy, chrx, chry
	-- TODO: OPTIMIZE THIS
	counters : block
	signal hctr_ce : std_logic;
	signal hctr_rs : std_logic;
	signal vctr_ce : std_logic;
	signal vctr_rs : std_logic;

	signal chrx_ce : std_logic;
	signal chrx_rs : std_logic;
	signal chry_ce : std_logic;
	signal chry_rs : std_logic;
	signal scrx_ce : std_logic;
	signal scrx_rs : std_logic;
	signal scry_ce : std_logic;
	signal scry_rs : std_logic;

	signal hctr_639 : std_logic;
	signal vctr_479 : std_logic;
	signal chrx_007 : std_logic;
--	signal chry_011 : std_logic;
	signal chry_018 : std_logic;
	signal scrx_079 : std_logic;

	-- RAM read, ROM read
	signal ram_tmp : integer range 2047 downto 0;	--12 bits
	signal rom_tmp : integer range 2047 downto 0;	--11 bits

	begin
	
	U_HCTR : entity work.ctrm generic map (M => 794) port map (reset, clk25, hctr_ce, hctr_rs, hctr);
	U_VCTR : entity work.ctrm generic map (M => 525) port map (reset, clk25, vctr_ce, vctr_rs, vctr);

	hctr_ce <= '1';
	hctr_rs <= '1' when (hctr = 793) else '0';
	vctr_ce <= '1' when (hctr = 663) else '0';
	vctr_rs <= '1' when (vctr = 524) else '0';

	U_CHRX: entity work.ctrm generic map (M => 008) port map (reset, clk25, chrx_ce, chrx_rs, chrx);
	U_CHRY: entity work.ctrm generic map (M => 019) port map (reset, clk25, chry_ce, chry_rs, chry);
	U_SCRX: entity work.ctrm generic map (M => 080) port map (reset, clk25, scrx_ce, scrx_rs, scrx);
	U_SCRY: entity work.ctrm generic map (M => 025) port map (reset, clk25, scry_ce, scry_rs, scry);

	hctr_639 <= '1' when hctr = 639 else '0';
	vctr_479 <= '1' when vctr = 479-3 else '0';
	chrx_007 <= '1' when chrx = 007 else '0';
--	chry_011 <= '1' when chry = 011 else '0';
	chry_018 <= '1' when chry = 018 else '0';
	scrx_079 <= '1' when scrx = 079 else '0';

	chrx_rs <= chrx_007 or hctr_639;
--	chry_rs <= chry_011 or vctr_479;
	chry_rs <= chry_018 or vctr_479;
	scrx_rs <= hctr_639;
	scry_rs <= vctr_479;

	chrx_ce <= '1' and blank;
	scrx_ce <= chrx_007;
	chry_ce <= hctr_639 and blank;
--	scry_ce <= chry_011 and hctr_639;
	scry_ce <= chry_018 and hctr_639;

-- Proboscide99 31/08/08
--	ram_tmp <= scry * 80 + scrx + 1 when ((scrx_079 = '0')) else
--			 scry * 80 when ((chry_011 = '0') and (scrx_079 = '1')) else
--			 0		 when ((chry_011 = '1') and (scrx_079 = '1'));
	ram_tmp <= scry * 80 + scrx;

	TEXT_A <= std_logic_vector(TO_UNSIGNED(ram_tmp, 11));

	rom_tmp <= TO_INTEGER(unsigned(TEXT_D)) * 8 + ((chry-1) / 2);

	FONT_A <= std_logic_vector(TO_UNSIGNED(rom_tmp, 11)) when (chry > 0) AND (chry < 17) else (others => '0');

	end block;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

	U_LOSR : entity work.losr generic map (N => 8)
	port map (reset, clk25, losr_ld, losr_ce, losr_do, FONT_D);
	
	losr_ce <= blank;
	losr_ld <= '1' when (chrx = 007) else '0';
	
	-- video out, vga_en control signal enable/disable vga signal
	-- COLOR BYTE:   7  6  5  4  3  2  1  0
	--              bI bR bG bB fI fR fG fB  (b = background, f=foreground), value = 0x00, 0x55 (I), 0xAA (color), 0xFF (color+I)
	R_int <= "0000" when (blank = '0') else color(2) & color(3) & color(2) & color(3) when (y = '1') else color(6) & color(7) & color(6) & color(7);
	G_int <= "0000" when (blank = '0') else color(1) & color(3) & color(1) & color(3) when (y = '1') else color(5) & color(7) & color(5) & color(7);
	B_int <= "0000" when (blank = '0') else color(0) & color(3) & color(0) & color(3) when (y = '1') else color(4) & color(7) & color(4) & color(7);
	
	hsync <= hsync_int; --and vga_en;
	vsync <= vsync_int; --and vga_en;	
	
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

	-- Hardware Cursor
	hw_cursor : block
	signal blockc	: std_logic;
	signal curen2	: std_logic;
	signal slowclk : std_logic;
	signal curpos	: std_logic;
	signal crx	 : integer range 079 downto 0;
	signal cry	 : integer range 024 downto 0;
	begin

	crx <= TO_INTEGER(unsigned(ocrx(6 downto 0)))+1;
	cry <= TO_INTEGER(unsigned(ocry(4 downto 0)));

	--
	curpos <= '1' when (scry = cry) and (scrx = crx) else '0';
	blockc <= '1' when (chry /= 18)	else '0';
	curen2 <= (cursoron or (not cur_blink)) and cur_en;
	y		<= (blockc and curpos and curen2) xor losr_do;
	
	end block;
	
end rtl;
