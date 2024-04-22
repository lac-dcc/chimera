library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package ram_init is

constant ADDRLEN : integer := 12; -- bits for number of 32 bit words in memory
type store_t is array(0 to (2**ADDRLEN)-1) of std_logic_vector(31 downto 0);

constant RAM_INIT : store_t := (

-- slow binary LED counter loop.s

X"b3620000",
X"23205020",
X"13031000",
X"b7030010",
X"83220020",
X"b3826200",
X"23205020",
X"93d20201",
X"23a05300",
X"93025000",
X"b3826240",
X"e3de02fe",
X"6ff01ffe",



others => X"00000000"
);

end package ram_init;
