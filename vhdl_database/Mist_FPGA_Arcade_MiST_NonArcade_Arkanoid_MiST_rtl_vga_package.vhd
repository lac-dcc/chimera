--Authors: Pietro Bassi, Marco Torsello

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use work.arkanoid_package.all;

package vga_package is

	--types definition
	subtype powerup_color_type is std_logic_vector(0 to 23);
	subtype color_type is std_logic_vector(0 to 11);
	
	--CONSTANTS
	--screen
	constant VISIBLE_WIDTH    : natural := 640;
	constant VISIBLE_HEIGHT   : natural := 480;

	--vertical sync
	constant VERTICAL_FRONT_PORCH : natural := 10;
	constant VERTICAL_SYNC_PULSE : natural := 2;
	constant VERTICAL_BACK_PORCH : natural := 33;

	--horizontal sync
	constant HORIZONTAL_FRONT_PORCH : natural := 16;
	constant HORIZONTAL_SYNC_PULSE : natural := 96;
	constant HORIZONTAL_BACK_PORCH : natural := 48;
	
	--VGA screen
	constant TOTAL_H: integer := VERTICAL_FRONT_PORCH + VERTICAL_SYNC_PULSE +VERTICAL_BACK_PORCH + VISIBLE_HEIGHT; --525
	constant TOTAL_W: integer := HORIZONTAL_FRONT_PORCH + HORIZONTAL_SYNC_PULSE +HORIZONTAL_BACK_PORCH + VISIBLE_WIDTH;	--800
	constant WINDOW_HORIZONTAL_START: integer := HORIZONTAL_FRONT_PORCH + HORIZONTAL_SYNC_PULSE; --112
	constant WINDOW_HORIZONTAL_END: integer := HORIZONTAL_FRONT_PORCH + HORIZONTAL_SYNC_PULSE + VISIBLE_WIDTH; --752
	constant WINDOW_VERTICAL_START: integer := VERTICAL_FRONT_PORCH + VERTICAL_SYNC_PULSE;  --12
	constant WINDOW_VERTICAL_END: integer := VERTICAL_FRONT_PORCH + VERTICAL_SYNC_PULSE + VISIBLE_HEIGHT;--492
	
	--colors
	constant COLOR_BKGBLUE			: color_type := X"003";
	constant COLOR_BKGDARKBLUE		: color_type := X"002";
	constant COLOR_BKGRED			: color_type := X"500";
	constant COLOR_BKGDARKRED		: color_type := X"400";
	constant COLOR_BKGGREEN			: color_type := X"050";
	constant COLOR_BKGDARKGREEN	: color_type := X"040";
	constant COLOR_BALLFILL			: color_type := X"EEE";
	constant COLOR_BALLBORDER		: color_type := X"111";
	
	constant COLOR_LIGHTDARKER		: color_type := X"02A";
	constant COLOR_LIGHTDARK		: color_type := X"06D";
	constant COLOR_LIGHTLIGHT		: color_type := X"3CE";
	
	constant COLOR_HEARTDARK		: color_type := X"C10";
	constant COLOR_HEARTLIGHT		: color_type := X"E10";
	
	--other constants
	constant ANIMATION_RATE			: integer := 10000000;
	constant BKG_RECT_WIDTH			: positive := 20;
	constant BKG_RECT_HEIGHT		: positive := 20;
	constant LIVES_X					: natural := BOUND_LAT_THICKNESS/UNIT;
	constant LIVES_Y					: natural := 20;
	
	--FUNCTIONS
	function  get_brick_color  ( brick : brick_type ) return color_type;
	function  get_powerup_color  ( powerup : powerup_type ) return powerup_color_type;

end package;

package body vga_package is
	
	function get_brick_color ( brick : brick_type ) return color_type is
	begin
		case brick is
			when B_EMPTY 		=> return X"000";
			when B_WHITE		=> return X"FFF";
			when B_ORANGE		=> return X"FA0";
			when B_CYAN			=> return X"0FF";
			when B_GREEN		=> return X"0F0";
			when B_RED			=> return X"F00";
			when B_BLUE			=> return X"00F";
			when B_PINK			=> return X"F9F";
			when B_PURPLE		=> return X"D0D";
			when B_YELLOW		=> return X"FF0";
			when B_GREY1		=> return X"DDD";
			when B_GREY2		=> return X"BBB";
			when B_GREY3		=> return X"999";
			when B_GREY4		=> return X"777";
			when B_GREY5		=> return X"555";
			when B_GOLD			=> return X"CC0";
		end case;
	end get_brick_color;
	
	function get_powerup_color ( powerup : powerup_type ) return powerup_color_type is
	begin
		case powerup is
			when P_SLOW			=> return X"0F00D0";
			when P_FAST			=> return X"F00D00";
			when P_LIFE			=> return X"00F00D";
			when P_ENLARGE		=> return X"FF0DD0";
			when P_DEATH		=> return X"555333";
			when P_NULL			=> return X"000000";
		end case;
	end get_powerup_color;
	
end vga_package;


