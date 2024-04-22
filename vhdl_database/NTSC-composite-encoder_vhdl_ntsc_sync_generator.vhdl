-- Copyright (c) 2014, Juha Turunen
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met: 
--
-- 1. Redistributions of source code must retain the above copyright notice, this
--    list of conditions and the following disclaimer. 
-- 2. Redistributions in binary form must reproduce the above copyright notice,
--    this list of conditions and the following disclaimer in the documentation
--    and/or other materials provided with the distribution. 
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
-- ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
-- ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ntsc_sync_generator is Port ( 
	clk_50 : in std_logic;
	reset : in std_logic;
	pixel_clk_ena : in std_logic;
	x : out std_logic_vector(8 downto 0);
	y : out std_logic_vector(8 downto 0);
	sync : out std_logic;		-- 1 if sync is active (0V), 0 if not (0,3V)
	burst : out std_logic
 );
end ntsc_sync_generator;

architecture Behavioral of ntsc_sync_generator is

-- pixel_clk_ena assumed to go high every 160ns
constant front_porch_length : integer := 9;  -- 1,4uS
constant back_porch_length : integer := 37;  -- 5,9uS
constant sync_length : integer := 30; -- 4,7uS
constant line_length : integer := 396; -- 63,5uS
constant half_line_length : integer := 198;
constant eq_pulse_length : integer := 14; -- 2,3uS
constant field_sync_pulse_length : integer := 170;  -- 27,1uS
constant active_video_length : integer := line_length - front_porch_length -
										  back_porch_length - sync_length;

constant vblank_start_line : integer := 3;
constant post_eq_start_line : integer := vblank_start_line + 3;
constant active_video_start_line : integer := post_eq_start_line + 3;
constant line_count : integer := 262;
constant vblanking_start_line : integer := 242;

constant burst_start : integer := 45;
constant burst_length : integer := 17;

signal hcounter, hcounter_next : std_logic_vector(8 downto 0);
signal vcounter, vcounter_next : std_logic_vector(8 downto 0);

signal normal_line_sync, eq_line_sync, vblank_line_sync : std_logic;
signal in_eq_line, in_normal_line, in_vblank_line : std_logic;

signal sync_next, sync_reg : std_logic;

begin

	-- Update registers with pixel clock
	process(clk_50, reset, pixel_clk_ena)
	begin
		if reset = '1' then
			hcounter <= (others=>'0');
			vcounter <= (others=>'0');
		elsif (clk_50'event and clk_50 = '1' and pixel_clk_ena = '1') then
			hcounter <= hcounter_next;
			vcounter <= vcounter_next;
			sync_reg <= sync_next;
		end if;
	end process;
	
	-- Counter logic
	process(vcounter, hcounter, hcounter_next, vcounter_next)
	begin
		vcounter_next <= vcounter;
		if hcounter < line_length then
			hcounter_next <= hcounter + 1;
		else
			hcounter_next <= (others => '0');
			if vcounter < line_count then
				vcounter_next <= vcounter + 1;
			else
				vcounter_next <= (others => '0');
			end if;
		end if;
	end process;
	
	-- Sync signal generation for different line types
	-- The different lines look roughly like this:
	-- Normal line:             -_-AAAAAAAAA			(A = active video, _ = sync level)
	-- Equalization line:       _-----_-----
	-- Vertical blanking line:  _____-_____-
	-- Details: http://martin.hinner.info/vga/pal.html (has info on NTSC regardless of the name)
	normal_line_sync <= '1' when hcounter >= front_porch_length and 
								 hcounter < front_porch_length + sync_length else '0';
								 
	eq_line_sync <= '1' when hcounter < eq_pulse_length or 
					         (hcounter >= half_line_length and 
                              hcounter < half_line_length + eq_pulse_length) else '0';
	
	vblank_line_sync <= '1' when hcounter < field_sync_pulse_length or 
						  (hcounter >= half_line_length and 
						  hcounter < half_line_length + field_sync_pulse_length) else '0';
	
	-- A multiplexer for choosing the right sync signal depending on the vertical line
	-- Lines 0-2 = eq line
	-- Lines 3-5 = vblank line
	-- Lines 6-8 = eq line
	-- Lines 9-261 = normal sync
	sync_next <= eq_line_sync when vcounter < vblank_start_line else
			       vblank_line_sync when vcounter < post_eq_start_line - 1 else
			       eq_line_sync when vcounter < active_video_start_line else
			       normal_line_sync;
	
	-- Indicates whether the beam is in the color burst region and a 0 phase color carrier should be 
	-- added to the composite signal.
	burst <= '1' when (hcounter >= burst_start) and (hcounter < (burst_start + burst_length)) and
						   (vcounter >= active_video_start_line) and (vcounter < vblanking_start_line) else '0';
							
	x <= hcounter;
	y <= vcounter;
	sync <= sync_reg;	
							
end Behavioral;

