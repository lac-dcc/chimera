-----------------------------------------------------------------------------
-- ROCKET DIODE IMAGES LOGIC																--
-- For use with Computer Space FPGA emulator.										--
-- emulates the rocket diode matrix function  										--
-- on Computer Space's Motion Board														--
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

entity rocket_diode_images is 
	port (
	image_select 											: in  integer range 0 to 3;
	-- select rocket image
	-- 0-3 
		
	rocket_hor, rocket_ver 								: in  integer range 0 to 15;
	--	address the
	-- horizontal and
	-- vertical slices of
	-- the rocket diode
	-- matrix images
	
	diode_left_column,
	diode_right_column 									: in std_logic;
	-- indicate
	-- whether right column or
	-- left column should show
	-- rocket engine flames

	out_image_bit 											: out std_logic
	);
	
end rocket_diode_images;

architecture rocket_diode_images_architecture
				 of rocket_diode_images is 

-- ROCKET IMAGES			
type image_line_16_bit is array (0 to 15)
	 of std_logic;
type image_line_8_bit is array (0 to 7)
	 of std_logic;

type rocket_image is array(0 to 15) of
	 image_line_16_bit;

-- defining signal to load
-- images from the arrays
signal image_line											: image_line_16_bit;
signal I_rocket_hor, I_rocket_ver					: integer range 0 to 15;
signal rocket_engine_flame 							: std_logic;

-- rocket image no 0	
signal rocket_image_0 : rocket_image := (
("0000000000000000"),
("0000000000010000"),
("0001000000000000"),
("0000000001000000"),
("0000010000000100"),
("0100000000000000"),
("0000000000000000"),
("0000000000010000"),
("0000100000000000"),
("0000000000010000"),
("0000100000000000"),
("0000000000010000"),
("0000010000000000"),
("0000000000100000"),
("0000001000000000"),
("0000000010000000")
);

-- rocket image no 1	
signal rocket_image_1 : rocket_image := (
("0000000000100000"),
("0000000000000000"),
("0000000000000100"),
("0010000010000000"),
("0000010000000000"),
("0000000000000000"),
("0100000000010000"),
("0000000000000000"),
("0000100000001000"),
("0000000000000000"),
("0000100000001000"),
("0000000000000000"),
("0000010000000000"),
("0000000000010000"),
("0000000100000000"),
("0000000000100000")
);

-- rocket image no 2	
signal rocket_image_2 : rocket_image := (
("0000000010000000"),
("0000000000000000"),
("0000000000010000"),
("0000000100000000"),
("0100000000000000"),
("0000100000100000"),
("0000000000000000"),
("0100100000010000"),
("0000000000000000"),
("0000000000001000"),
("0000010000000000"),
("0000000000000000"),
("0000000100001000"),
("0000000000000000"),
("0000000001010000"),
("0000000000000000")
);

-- rocket image no 3	
signal rocket_image_3 : rocket_image := (
("0000000100000000"),
("0000000000100000"),
("0000000000000000"),
("0000001000000000"),
("0000000000000000"),
("1000000000100000"),
("0001000000010000"),
("0000000000000000"),
("0000000000001000"),
("0100000000000000"),
("0000010000000000"),
("0000001000000100"),
("0000000010000000"),
("0000000000101000"),
("0000000000000000"),
("0000000000000000")
);

----------------------------------------------------------------------------//

begin

I_rocket_hor <= rocket_hor;
I_rocket_ver <= rocket_ver;

image_line <= -- DECODE
		  rocket_image_0 (I_rocket_hor) when image_select = 0 else     
		  rocket_image_1 (I_rocket_hor) when image_select = 1 else     
		  rocket_image_2 (I_rocket_hor) when image_select = 2 else     
  		  rocket_image_3 (I_rocket_hor);     

rocket_engine_flame <=
-- please note that the flame diodes are connected to other parts of the
-- 74150 than what they appear looking at the diode matrix on the
-- Computer Space schematics.
-- Also note that pin 8 is equal to "I_rocket_ver = 0"

	(diode_left_column or diode_right_column) when (image_select = 0 and 
																 I_rocket_ver = 7) else
	
	diode_left_column  when (image_select = 1 and I_rocket_ver = 5) else
	
	diode_right_column when (image_select = 1 and I_rocket_ver = 6) else
	
	diode_left_column  when (image_select = 2 and I_rocket_ver = 3) else
	
	diode_right_column when (image_select = 2 and I_rocket_ver = 4) else
	
	diode_left_column  when (image_select = 3 and I_rocket_ver = 1) else
	
	diode_right_column when (image_select = 3 and I_rocket_ver = 3) else
	
	'0';	

out_image_bit <= image_line (I_rocket_ver) or rocket_engine_flame;	
			
end rocket_diode_images_architecture;