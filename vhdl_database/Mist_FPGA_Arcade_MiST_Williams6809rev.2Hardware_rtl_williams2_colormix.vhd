 -------------------------------------
-- Color palette Mame Informations --
-------------------------------------
--
-- Normal values (turkey shoot, inferno, joust2)

--          red    green  blue  
-- gain(  { 0.25f, 0.25f, 0.25f }),
-- offset({ 0.00f, 0.00f, 0.00f })

-- Modified value (mystic marathon)

-- gain =   {   0.8f, 0.73f,  0.81f };
-- offset = { -0.27f, 0.00f, -0.22f };

-- Computation (video/williams.cpp)
-- color_1 = max(color_in + offset   , 0)
-- color_2 = min(color_1  * gain/0.25, 1)
-- with color_in max value = 1

-- because of gain/0.25 is ~3 output value may be much higher than 1
-- applying  min(x, 1) will strangely saturate/limit result

-- Here by, color_in max value = 15 (before intensity)
-- => red   offset = -0.27*15 = 4.050 let's assume value 5
-- => green offset = -0.00*15 = 0.000 let's assume value 0
-- => blue  offset = -0.22*15 = 3.300 let's assume value 3

-- red   gain = 3.20 rescaled to 127/3.24 => 125.4 let's assume value 125
-- green gain = 2.92 rescaled to 127/3.24 => 114.5 let's assume value 114
-- blue  gain = 3.24 rescaled to 127/3.24 => 127.0 let's assume value 127

-- After intensity and gain, limit should be 256*128/3.24 = 10922
-- limiting to this value gives wrong results so I choose not to
-- apply limitation (limit to 256*128 = 32768).

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity williams2_colormix is
port(
 mysticm   : in  std_logic;
 r         : in  std_logic_vector(3 downto 0);
 g         : in  std_logic_vector(3 downto 0);
 b         : in  std_logic_vector(3 downto 0);
 intensity : in  std_logic_vector(3 downto 0);
 vga_r     : out std_logic_vector(7 downto 0);
 vga_g     : out std_logic_vector(7 downto 0);
 vga_b     : out std_logic_vector(7 downto 0)
);
end williams2_colormix;

architecture struct of williams2_colormix is

 signal ri        : std_logic_vector( 7 downto 0);
 signal gi        : std_logic_vector( 7 downto 0);
 signal bi        : std_logic_vector( 7 downto 0);
 signal ro        : std_logic_vector( 7 downto 0);
 signal go        : std_logic_vector( 7 downto 0);
 signal bo        : std_logic_vector( 7 downto 0);
 signal rg        : std_logic_vector(15 downto 0);
 signal gg        : std_logic_vector(15 downto 0);
 signal bg        : std_logic_vector(15 downto 0);

begin

-- apply intensity
ri <= r*intensity;
gi <= g*intensity;
bi <= b*intensity;

-- apply offset and max(x, 0)
ro <= ri-x"50" when ri > x"50" else x"00";
go <= gi-x"00" when gi > x"00" else x"00";
bo <= bi-x"30" when bi > x"30" else x"00";

-- apply gain and limit
-- in fact limit cannot be reached, anyway I keep the limiting function
-- here for whos who want to try it
rg <= ro*x"7D" when ro*x"7D" < x"7FFF" else x"7FFF";
gg <= go*x"72" when go*x"72" < x"7FFF" else x"7FFF";
bg <= bo*x"7F" when bo*x"7F" < x"7FFF" else x"7FFF";

-- allow selection to real_time compare results with/without modification
vga_r <= rg(14 downto 7) when mysticm = '1' else ri;
vga_g <= gg(14 downto 7) when mysticm = '1' else gi;
vga_b <= bg(14 downto 7) when mysticm = '1' else bi;

end struct;