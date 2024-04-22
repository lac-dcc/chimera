-- Paddle interface using analog potentiometer for Super Breakout arcade game by Atari
-- (c) 2017 James Sweet
--
-- Use this file if you want to use a potentiometer as used in the original arcade machine
-- instead of an encoder to control the paddle. An external analog comparator and ramp generator
-- circuit is required, see schematic in Super Breakout manual.  
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

entity paddle_analog is 
port(		
			Pot_Comp1_n		: in  std_logic;
			Pot_Comp2_n		: in  std_logic;
			Mask1_n			: in	std_logic;
			Mask2_n			: in  std_logic;
			Vblank			: in	std_logic;
			Sense1			: out std_logic;
			Sense2			: out std_logic;
			NMI_n				: out std_logic
			);
end paddle_analog;

architecture rtl of paddle_analog is

signal sense1_int		: std_logic;
signal sense2_int		: std_logic;

begin

sense1 <= sense1_int;
sense2 <= sense2_int;

-- Logic gates in IC at M10
-- These should be a 74LS132 with Schmitt trigger inputs, may not work reliably using FPGA pins directly
sense1_int <= not(Pot_Comp1_n and mask1_n);
sense2_int <= not(Pot_Comp2_n and mask2_n);
NMI_n <= sense1_int and sense2_int;

end rtl;
