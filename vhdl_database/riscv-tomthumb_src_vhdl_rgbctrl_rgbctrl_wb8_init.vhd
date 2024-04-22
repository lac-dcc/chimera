library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package rgbctrl_wb8_init is

constant ADDRLEN : integer := 9; -- bits for number of 8 bit words in memory
type store_t is array(0 to (2**ADDRLEN)-1) of std_logic_vector(7 downto 0);

constant RAM_INIT : store_t := (
X"20",X"00",X"00",
X"00",X"20",X"00",
X"00",X"00",X"20",

X"20",X"20",X"00",
X"00",X"20",X"20",
X"20",X"00",X"20",
X"20",X"20",X"20",

others => X"00"
);

end package rgbctrl_wb8_init;
