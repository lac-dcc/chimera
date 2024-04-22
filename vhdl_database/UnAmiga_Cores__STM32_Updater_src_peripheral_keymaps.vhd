--
-- PS/2 Keyboard scancodes
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package keyscans is

	-- Teclas com scancode simples
	constant KEY_ESC			: std_logic_vector(7 downto 0)  := X"76";


	constant KEY_BL			: std_logic_vector(7 downto 0)  := X"0E";		-- (en) ~ `    (pt-br) " '
	constant KEY_1				: std_logic_vector(7 downto 0)  := X"16";
	constant KEY_2				: std_logic_vector(7 downto 0)  := X"1E";
	constant KEY_3				: std_logic_vector(7 downto 0)  := X"26";
	constant KEY_4				: std_logic_vector(7 downto 0)  := X"25";
	constant KEY_5				: std_logic_vector(7 downto 0)  := X"2E";
	constant KEY_6				: std_logic_vector(7 downto 0)  := X"36";
	constant KEY_7				: std_logic_vector(7 downto 0)  := X"3D";
	constant KEY_8				: std_logic_vector(7 downto 0)  := X"3E";
	constant KEY_9				: std_logic_vector(7 downto 0)  := X"46";
	constant KEY_0				: std_logic_vector(7 downto 0)  := X"45";
	constant KEY_MINUS		: std_logic_vector(7 downto 0)  := X"4E";		-- - _
	constant KEY_EQUAL		: std_logic_vector(7 downto 0)  := X"55";		-- = +
	constant KEY_BACKSPACE	: std_logic_vector(7 downto 0)  := X"66";

	constant KEY_TAB			: std_logic_vector(7 downto 0)  := X"0D";
	constant KEY_Q				: std_logic_vector(7 downto 0)  := X"15";
	constant KEY_W				: std_logic_vector(7 downto 0)  := X"1D";
	constant KEY_E				: std_logic_vector(7 downto 0)  := X"24";
	constant KEY_R				: std_logic_vector(7 downto 0)  := X"2D";
	constant KEY_T				: std_logic_vector(7 downto 0)  := X"2C";
	constant KEY_Y				: std_logic_vector(7 downto 0)  := X"35";
	constant KEY_U				: std_logic_vector(7 downto 0)  := X"3C";
	constant KEY_I				: std_logic_vector(7 downto 0)  := X"43";
	constant KEY_O				: std_logic_vector(7 downto 0)  := X"44";
	constant KEY_P				: std_logic_vector(7 downto 0)  := X"4D";

	constant KEY_ENTER		: std_logic_vector(7 downto 0)  := X"5A";


	constant KEY_A				: std_logic_vector(7 downto 0)  := X"1C";
	constant KEY_S				: std_logic_vector(7 downto 0)  := X"1B";
	constant KEY_D				: std_logic_vector(7 downto 0)  := X"23";
	constant KEY_F				: std_logic_vector(7 downto 0)  := X"2B";
	constant KEY_G				: std_logic_vector(7 downto 0)  := X"34";
	constant KEY_H				: std_logic_vector(7 downto 0)  := X"33";
	constant KEY_J				: std_logic_vector(7 downto 0)  := X"3B";
	constant KEY_K				: std_logic_vector(7 downto 0)  := X"42";
	constant KEY_L				: std_logic_vector(7 downto 0)  := X"4B";


	constant KEY_LSHIFT		: std_logic_vector(7 downto 0)  := X"12";
	constant KEY_LT			: std_logic_vector(7 downto 0)  := X"61";		-- (pt-br) \ |
	constant KEY_Z				: std_logic_vector(7 downto 0)  := X"1A";
	constant KEY_X				: std_logic_vector(7 downto 0)  := X"22";
	constant KEY_C				: std_logic_vector(7 downto 0)  := X"21";
	constant KEY_V				: std_logic_vector(7 downto 0)  := X"2A";
	constant KEY_B				: std_logic_vector(7 downto 0)  := X"32";
	constant KEY_N				: std_logic_vector(7 downto 0)  := X"31";
	constant KEY_M				: std_logic_vector(7 downto 0)  := X"3A";
	constant KEY_COMMA		: std_logic_vector(7 downto 0)  := X"41";		-- , <
	constant KEY_POINT		: std_logic_vector(7 downto 0)  := X"49";		-- . >
	constant KEY_TWOPOINT	: std_logic_vector(7 downto 0)  := X"4A";		-- (en)			(pt-br) ; :
	constant KEY_SLASH		: std_logic_vector(7 downto 0)  := X"51";		-- / ?
	constant KEY_RSHIFT		: std_logic_vector(7 downto 0)  := X"59";


	constant KEY_SPACE		: std_logic_vector(7 downto 0)  := X"29";


	constant KEY_KP0			: std_logic_vector(7 downto 0)  := X"70";		-- Teclas keypad numerico
	constant KEY_KP1			: std_logic_vector(7 downto 0)  := X"69";
	constant KEY_KP2			: std_logic_vector(7 downto 0)  := X"72";
	constant KEY_KP3			: std_logic_vector(7 downto 0)  := X"7A";
	constant KEY_KP4			: std_logic_vector(7 downto 0)  := X"6B";
	constant KEY_KP5			: std_logic_vector(7 downto 0)  := X"73";
	constant KEY_KP6			: std_logic_vector(7 downto 0)  := X"74";
	constant KEY_KP7			: std_logic_vector(7 downto 0)  := X"6C";
	constant KEY_KP8			: std_logic_vector(7 downto 0)  := X"75";
	constant KEY_KP9			: std_logic_vector(7 downto 0)  := X"7D";
	constant KEY_KPCOMMA		: std_logic_vector(7 downto 0)  := X"71";		-- ,
	constant KEY_KPPOINT		: std_logic_vector(7 downto 0)  := X"6D";		-- .
	constant KEY_KPPLUS		: std_logic_vector(7 downto 0)  := X"79";		-- +
	constant KEY_KPMINUS		: std_logic_vector(7 downto 0)  := X"7B";		-- -
	constant KEY_KPASTER		: std_logic_vector(7 downto 0)  := X"7C";		-- *



	-- Teclas com scancode extendido (E0 + scancode)
	
	constant KEY_UP			: std_logic_vector(7 downto 0)  := X"75";
	constant KEY_DOWN			: std_logic_vector(7 downto 0)  := X"72";
	constant KEY_LEFT			: std_logic_vector(7 downto 0)  := X"6B";
	constant KEY_RIGHT		: std_logic_vector(7 downto 0)  := X"74";
	constant KEY_RCTRL		: std_logic_vector(7 downto 0)  := X"14";
	constant KEY_RALT			: std_logic_vector(7 downto 0)  := X"11";
	constant KEY_KPENTER		: std_logic_vector(7 downto 0)  := X"5A";
	constant KEY_KPSLASH		: std_logic_vector(7 downto 0)  := X"4A";		-- /


end package keyscans;
