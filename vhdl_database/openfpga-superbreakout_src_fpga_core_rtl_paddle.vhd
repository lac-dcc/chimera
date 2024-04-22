-- Paddle input circuitry for Atari Super Breakout
-- This interfaces the player control knob that moves the paddle. The original hardware
-- used an analog potentiometer that was read by comparing the voltage of a ramp generated
-- by a charging capacitor against the voltage from the pot wiper. That could be duplicated 
-- with external circuitry but here an optical encoder will be used. The hardware included 
-- two channels but Super Breakout only made use of one.
-- 2017 James Sweet
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
use IEEE.numeric_std.ALL;

entity paddle is 
port(		
			CLK6			: in  std_logic; 
			Enc_A			: in  std_logic;
			Enc_B			: in  std_logic;
			Ana         : in  std_logic_vector(7 downto 0);
			Mask1_n			: in	std_logic;
			Mask2_n			: in  std_logic;
			Vblank			: in	std_logic;
			Sense1			: out std_logic;
			Sense2			: out std_logic;
			NMI_n			: out std_logic
			);
end paddle;

architecture rtl of paddle is

signal sense1_int	: std_logic;
signal sense2_int	: std_logic;
signal comp1_n: std_logic;
signal ramp: integer range 0 to 100000;
signal position: integer range 0 to 160000;
signal pad_pos: integer range 400 to 2500;


begin

-- Ramp is reset by Vblank pulse and begins to rise. Originally an analog comparator compared the pot position
-- against the ramp voltage, the output of this comparator going high when the ramp voltage rises above the pot value
-- Since this ramp counter is clocked at 6MHz, position output from encoder interface is multiplied
Ramp_Compare: process(clk6, Vblank)
begin
	if rising_edge(clk6) then
		if Vblank = '1' then
			comp1_n <= '0';
			ramp <= 0;
		else
			ramp <= ramp + 1;
		end if;
		
		if ramp > (pad_pos * 35) then 
			comp1_n <= '1';
		end if;
	end if;
end process;
	
-- Logic gates in IC at M10
sense1_int <= not(comp1_n and mask1_n);
NMI_n <= sense1_int and sense2_int;

Sense1 <= Sense1_int;
Sense2 <= Sense2_int;

-- The original hardware has support for two pots however the game code only supports one so hardwire this high
sense2_int <= '1';	

-- If the pulse from the ramp comparator comes too soon after Vblank the paddle interrupt is triggered too 
-- early and this causes problems so make the minimum position 500. 
pad_pos <= (position + 500) when ana = x"00" else (250 + to_integer(unsigned(Ana&"000")));

-- Interface for the quadrature encoder. The optical encoder used in the prototype has a very high resolution, it 
-- will be necessary to adjust values for other encoders
encoder: entity work.quadrature_decoder
	generic map(
		positions => 2000, 		--size of the position counter (i.e. number of positions counted)
		debounce_time => 500, 	--number of clock cycles required to register a new position = debounce_time + 2
		set_origin_debounce_time => 50_000)	--number of clock cycles required to register a new set_origin_n value = set_origin_debounce_time + 2
	port map(
		clk => clk6,								--system clock
		a => Enc_a,									--quadrature encoded signal a
		b => Enc_b,									--quadrature encoded signal b
		set_origin_n => '1',  					--active-low synchronous clear of position counter
		direction => open,						--direction of last change, 1 = positive, 0 = negative
		position => position
		);

end rtl;
