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

entity ntsc_composite_top_de2 is Port ( 
	clk_50 : in std_logic;
	vga_clk : out std_logic;
	vga_g : out std_logic_vector(9 downto 0);
	vga_blank : out std_logic;
	vga_sync : out std_logic;	
	btn : in std_logic_vector(3 downto 3)
);
end ntsc_composite_top_de2;

architecture Behavioral of ntsc_composite_top_de2 is

signal reset : std_logic;
signal clkdiv_counter : std_logic_vector(2 downto 0);
signal pixel_clk_ena, half_pixel_clk_ena : std_logic;

signal x, y : std_logic_vector(8 downto 0);
signal in_sync, in_burst : std_logic;		-- '1' if the beam is in sync or color burst regions
signal in_active_video : std_logic;

-- Color carrier phase accumulator
signal color_carrier_phase, color_carrier_phase_next : std_logic_vector(17 downto 0);
signal color_carrier_phase_modulator, color_carrier_phase_modulated : std_logic_vector(7 downto 0);
signal color_carrier_amplitude, color_carrier_amplitude_clamped : std_logic_vector(2 downto 0);
signal color_carrier_value : std_logic_vector(10 downto 0);

-- Image rom signals
-- pixel_value holds the upper or lower nybble of image_rom_data depending on the xcounter
signal image_rom_address, image_rom_address_next : std_logic_vector(15 downto 0);
signal image_rom_data : std_logic_vector(7 downto 0);
signal pixel_value : std_logic_vector(3 downto 0);

-- Used for storing the previous luma value for filtering
signal luma_value_prev, luma_value_prev_next : std_logic_vector(10 downto 0);
signal luma_value, luma_value_filtered, composite_value, 
		 composite_value_subbed, composite_value_clamped : std_logic_vector(10 downto 0);
signal luma_values_added : std_logic_vector(11 downto 0);

signal sine_rom_addr : std_logic_vector(10 downto 0);
signal sine_rom_data : std_logic_vector(8 downto 0);

signal pixel_luma : std_logic_vector(10 downto 0);
signal pixel_phase : std_logic_vector(7 downto 0);
signal pixel_chroma : std_logic_vector(2 downto 0);

begin

	vga_blank <= '1';
	vga_clk <= clk_50;
	reset <= not btn(3);

	process(clk_50, reset)
	begin
		if (reset = '1') then
			-- Asynchronous reset
			color_carrier_phase <= (others => '0');
			image_rom_address <= (others => '0');
				
		elsif (clk_50'event and clk_50 = '1') then
			color_carrier_phase <= color_carrier_phase_next; 
			image_rom_address <= image_rom_address_next;
			luma_value_prev <= luma_value_prev_next;
		end if;
	end process;

	-- Clock divider
	process(clk_50, clkdiv_counter)
	begin
		if clk_50'event and clk_50 = '1' then
			clkdiv_counter <= clkdiv_counter + 1;
		end if;
		
		if clkdiv_counter = "000" then 
			pixel_clk_ena <= '1';
		else
			pixel_clk_ena <= '0';
		end if;
		
		if clkdiv_counter = "000" or clkdiv_counter = "100" then
			half_pixel_clk_ena <= '1';
		else
			half_pixel_clk_ena <= '0';
		end if;
	end process;
	
	-- Generate image rom address 
	process (image_rom_address, x, y, pixel_clk_ena)
	begin
		image_rom_address_next <= image_rom_address;
		if (x >= 65 and x < 385 and x(0) = '1' and pixel_clk_ena = '1') then
			image_rom_address_next <= image_rom_address + 1;
		end if;
		
		-- Reset the address counter at the first pixel
		if (x = 65 and y = 30 and pixel_clk_ena = '1') then
			image_rom_address_next <= conv_std_logic_vector(4 * 320 , 16);		-- adjust start point a little bit
		end if;
	end process;
	
	-- Color carrier generator logic
	-- carrier_phase is a 18-bit register representing a fixed point number (8:10)
	-- The integer part of the fixed point number is used to address the color carrier sine table.
	-- The value added to the phase on every clock cycle is calculated as follows:
	-- NTSC color carrier frequency f(ntsc) = 3.579545 MHz,
	-- System clock f(sys) = 50 MHz, f(sys_cycle) = 20ns
	-- Sine table length l = 256
	-- If we incremented the phase register by 1 on every clock cycle, the frequency
	-- of the sine wave would be 1 / 2^18 / f(sys_cycle) ~= 190.734863281 Hz
	-- Thus to get f(ntsc) we need to increment by 3579545Hz / 190.734863281 Hz = 18767
	-- Note that it's very important that the color carrier keeps running freely. The phase must
	-- never be reset or the TV won't be able to lock into the color carrier.
	color_carrier_phase_next <= color_carrier_phase + 18767;
	color_carrier_phase_modulated <= color_carrier_phase(17 downto 10) + color_carrier_phase_modulator;
	
	-- If we're in the burst region don't modulate the color carrier phase, 
	-- otherwise modulate with the value coming out of the palette
	color_carrier_phase_modulator <= "00000000" when in_burst = '1' else pixel_phase;

	-- "000" equates to the maximum amplitude, higher values diminish and "111" is considered a flat line
	-- The inverse relationship is there to avoid having storing the flat line in the sine table ROM.
	-- 1->0 2->1 3->2 etc mapping would require extra logic (yes we're not running short on the Cyclone II, but
	-- I have principles :P). 
	-- Adjusting the amplitude of the color burst allows us to control the saturation a bit. Nominally
	-- the color burst amplitude should be the maximum one stored in the sine table, but since our DAC's voltage
	-- swing is limited and the TV seems to be cool with it, we're making it a bit less than the maximum to
	-- make the colors slightly more vibrant without too much luma->chroma bleed.
	color_carrier_amplitude <= pixel_chroma when in_active_video = '1' else
								     "010" when in_burst = '1' else
							        "111";
	
	-- The luma is an 11-bit value, but the sine rom output is a 9-bit signed value,
	--	so we need to sign extend the sine ROM output. Also flat line the color carrier,
	-- if color_carrier_amplitude = "111" (see above).
	color_carrier_value <= sine_rom_data(8) & sine_rom_data(8) & sine_rom_data when color_carrier_amplitude /= "111" else 
						  (others => '0');
	
	-- Since the image rom bytes have two pixels in them we need to pick the right nybble for display.
	-- The even pixels are in the upper nybble and vice versa.
	pixel_value <= image_rom_data(7 downto 4) when x(0) = '0' else image_rom_data(3 downto 0);

	-- When in_active_video is '1' the palette is in full control of the luma and chroma components
	in_active_video <= '1' when x >= 70 and x < 385 and y >= 30 and y < 289 else '0';
	
	-- Generate the current luma value 
	-- The blanking (black) level should nominally be 438, but since our DAC's voltage swing is limited
	-- and the TV seems to be fine with it, we make it a bit lower to have a bigber voltage swing above it
	-- and thus brighter pixels.
	luma_value <= conv_std_logic_vector(0, 11) when in_sync = '1' else		
			        conv_std_logic_vector(278, 11) when in_burst = '1' else
			        pixel_luma when in_active_video = '1' else
				     conv_std_logic_vector(278, 11);
					  
	-- Sharp transitions in the luma generate harmonic frequencies which bleed into the chroma signal, causing
	-- nasty flickering color where there should be none (for exampple in black and white patterns).
	-- So instead of __|--- we want ___/---. By using the average of the previous luma value and the current 
	-- one we do some rudimentary low-pass filtering which helps with the flicker and color bleed. 
	-- The filtering is done every half pixels so you don't really notice any blurring of the image on a TV.
	luma_value_prev_next <= luma_value_prev when half_pixel_clk_ena = '0' else luma_value;
	luma_values_added <= ("0" & luma_value_prev) + ("0" & luma_value);	-- Add the previous and current luma together...
	luma_value_filtered <= luma_values_added(11 downto 1);					-- and divide by two

	-- Generate sine table address from the amplitude and the phase
	sine_rom_addr <= color_carrier_amplitude & color_carrier_phase_modulated;

	-- Combine the filtered luma and the color carrier signals
	composite_value <= luma_value_filtered + color_carrier_value;
							 
	-- Normally the DE2 board's VGA DAC's RGB outputs swing from 0 to 0.7V, because VGA has separate sync 
	-- wires and thus doesn't need to separate between black and sync levels. The composite white level
	-- though is nominally 1.0V (plus the color carrier amplitude). Luckily the DAC has a feature which
	-- adds a constant 0.3V voltage to the green output when asserted. Using the SYNC pin on the DAC we
   -- can achieve a better 1V swing. We're also cheating a little bit (see explanation above)with the blanking level 
	-- voltage to have a larger range above the blanking level. So when the composite value is above 1023, we
	-- enable the constant (about 428 in terms of our internal signal values) voltage generator and subtract the same
	-- amount from our composite_value, before sending it to the DAC. We're also clamping the composite value to 
	-- 1024 + 428 in case we have a palette entry with high saturation and lightness. Although it's possible
	-- to guarantee no clipping when generating individual palette entries, we still might clip because of the
	-- luma filterint. Imagine two pixels next to eachother. The first one is completely white (high luma, no chroma)
	-- and the second one is a high luma & high saturation one (but still not clipping). Because of the luma filtering
	-- during the first half of the first pixel the luma will be between white level and the colored pixel's luma, thus
	-- clipping. I'm sure this isn't perfect, but it's better than not clamping and creating false color artifacts due
	-- to dropping the MSB of composite_value_subbed.
	composite_value_subbed <= composite_value_clamped - 428;
	composite_value_clamped <= composite_value when (composite_value <= 1023 + 428) else conv_std_logic_vector(1023 + 428, 11);
	vga_g <= composite_value_subbed(9 downto 0) when composite_value(10)  = '1' else composite_value(9 downto 0);
	vga_sync <= composite_value(10);
	
	-- Generates the sync and burst enable signals and provides x and y counters
	sync_generator : entity work.ntsc_sync_generator port map (
		clk_50 => clk_50,
		reset => reset,
		pixel_clk_ena => pixel_clk_ena,
		x => x,
		y => y,
		sync => in_sync,
		burst => in_burst
	);

	-- ROM that contains 7 full sine waves with diminishing amplitudes.
	-- The values are 9-bit signed integers and each full wave is 256 words long.
	sinetable : entity work.sine_rom port map (
		address => sine_rom_addr,
		clock => clk_50,
		q => sine_rom_data
	);
	
	-- 4-bit pixel value to luma-chroma-phase mapping
	palette : entity work.palette port map (
		index => pixel_value,
		chroma => pixel_chroma,
		luma => pixel_luma,
		phase => pixel_phase
	);
	
	-- Image ROM
	image_rom : entity work.image_rom port map (
		clock => clk_50,
		address => image_rom_address,
		q => image_rom_data
	);
	
end Behavioral;
