-----------------------------------------------------------------------------
-- SAUCER DIODE IMAGE																		--
-- For use with Computer Space FPGA emulator											--
-- emulates saucer diode matrix on 														--
-- Computer Space's Motion Board															--
--																									--
-- This entity is implementation agnostic												--
--																									--
-- v1.0																							--
-- by Mattias G, 2015																		--
-- Enjoy!																						-- 
-----------------------------------------------------------------------------

library 	ieee;
use 		ieee.std_logic_1164.all; 
use 		ieee.numeric_std.all;
library 	work;

--80--------------------------------------------------------------------------|

entity saucer_diode_image is 
	port(
	saucer_enable  										: in std_logic;

	-- address the vertical slices
	-- of the saucer diode matrix image
	saucer_ver		 										: in integer range 0 to 7;

	-- address the horizontal slices
	-- of the saucer diode matrix image
	saucer_hor 												: in integer range 0 to 15;

	saucer_diode_rotating_light 						: in std_logic;
	out_saucer_image_bit 								: out std_logic
	);
end saucer_diode_image;

architecture saucer_diode_image_architecture
				 of saucer_diode_image is 

type image_line_8_bit is array (0 to 7)
	  of std_logic;

type saucer_image is array(0 to 15)
	  of image_line_8_bit;

-- defining signal to load images
-- from the arrays
signal image_line											: image_line_8_bit;
signal I_saucer_hor										: integer range 0 to 15;
signal I_saucer_ver										: integer range 0 to 7;
signal saucer_rotating_light_bit 					: std_logic;

-- Saucer image	
signal saucer_image_1 : saucer_image := (
("00001000"),
("00000000"),
("01000010"),
("00000000"),
("00000000"),
("01000010"),
("10000001"),
("00000000"),
("00000000"),
("10000001"),
("01000010"),
("00000000"),
("00000000"),
("01000010"),
("00000000"),
("00001000")
);

---------------------------------------------------------------------------//

begin

I_saucer_hor <= saucer_hor; -- 0 - 15 slices
I_saucer_ver <= saucer_ver; -- 0 - 7 pixels per slice

image_line <= saucer_image_1 (I_saucer_hor); 

-- add saucer rotating light when column 4 is read
saucer_rotating_light_bit <=
	saucer_diode_rotating_light when I_saucer_ver = 4 else
	'0'; 	

out_saucer_image_bit <=
	(image_line (I_saucer_ver) or
		saucer_rotating_light_bit) when saucer_enable = '0' else
	'0';	
	--- impacted by saucer enable on strobe input			 		 
		
end saucer_diode_image_architecture;