LIBRARY ieee;
USE ieee.std_logic_1164.all;
package display_types is
	type display_mode is (training, running, idle);
end package display_types;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.display_types.all;
USE work.lcd_types.all;

package display_components is
component display is
	PORT (
		reset, clock : IN STD_LOGIC;
		mode : IN display_mode;
		inputs : IN STD_LOGIC_VECTOR(15 downto 0);
		class : IN CHAR;
		lcd_dd : OUT CHAR_VECTOR(0 to 31);
		lcd_cg : OUT CHAR_GRAPHICS_VECTOR(0 to 7)
	);
end component;
end package;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
USE work.display_types.all;
USE work.lcd_types.all;

ENTITY display IS
	PORT (
		reset, clock : IN STD_LOGIC;
		mode : IN display_mode;
		inputs : IN STD_LOGIC_VECTOR(15 downto 0);
		class : IN CHAR;
		lcd_dd : OUT CHAR_VECTOR(0 to 31);
		lcd_cg : OUT CHAR_GRAPHICS_VECTOR(0 to 7)
	);
END ENTITY display;

ARCHITECTURE display OF display IS
BEGIN

-- character graphics

lcd_cg(0) <= 
"00000"&
"00000"&
"00000"&
"00000"&
"00000"&
"00000"&
"00000"&
"00000";

lcd_cg(1) <= 
"00000"&
"00000"&
"00000"&
"00000"&
"11111"&
"11111"&
"11111"&
"00000";

lcd_cg(2) <= 
"11111"&
"11111"&
"11111"&
"00000"&
"00000"&
"00000"&
"00000"&
"00000";

lcd_cg(3) <= 
"11111"&
"11111"&
"11111"&
"00000"&
"11111"&
"11111"&
"11111"&
"00000";


-- switch pattern display
lcd_dd(0) <= "000000" & inputs(15) & inputs(11);
lcd_dd(1) <= "000000" & inputs(14) & inputs(10);
lcd_dd(2) <= "000000" & inputs(13) & inputs(9);
lcd_dd(3) <= "000000" & inputs(12) & inputs(8);

lcd_dd(16) <= "000000" & inputs(7) & inputs(3);
lcd_dd(17) <= "000000" & inputs(6) & inputs(2);
lcd_dd(18) <= "000000" & inputs(5) & inputs(1);
lcd_dd(19) <= "000000" & inputs(4) & inputs(0);

-- NERUAL NET
lcd_dd(4 to 15) <= (x"20", x"4e", x"45", x"55", x"52", x"41", x"4c", x"20", x"4e", x"45", x"54", x"20");

with mode select lcd_dd(20 to 31) <=
	-- Training...
	(x"20", x"74", x"72", x"61", x"69", x"6e", x"69", x"6e", x"67", x"2e", x"2e", x"2e") when training,
	-- Running...
	(x"20", x"72", x"75", x"6e", x"6e", x"69", x"6e", x"67", x"2e", x"2e", x"2e", x"20") when running,
	-- Pattern:
	(x"20", x"70", x"61", x"74", x"74", x"65", x"72", x"6e", x"3a", x"20", class, x"20") when idle;
END ARCHITECTURE display;

