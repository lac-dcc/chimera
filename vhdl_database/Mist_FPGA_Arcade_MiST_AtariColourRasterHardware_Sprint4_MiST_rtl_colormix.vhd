-- Video color mixer for Atari Sprint 4 - Original monitor
-- had 8 separate color inputs which we can mix to drive
-- a more conventional RGB monitor.
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

entity colormix is 
port(		
			Clk6				: in  std_logic;
			CompBlank		: in  std_logic;
			WhiteVid			: in  std_logic;
			PeachVid			: in  std_logic;
			VioletVid		: in  std_logic;
			GreenVid			: in  std_logic;
			BlueVid			: in  std_logic;
			video_r			: out std_logic;
			video_g			: out std_logic;
			video_b			: out std_logic
			);
end colormix;

architecture rtl of colormix is


begin


-- Todo: Utilize blanking signal

-- Todo: Consider synchronous process


video_r <= (WhiteVid or PeachVid or VioletVid);
video_g <= (WhiteVid or GreenVid);
video_b <= (WhiteVid or VioletVid or BlueVid);

end rtl;