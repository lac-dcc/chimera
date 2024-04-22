library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity moonwar_dial is
port(
	clk        : in std_logic;
	moveleft   : in std_logic;
	moveright  : in std_logic;
	dialout    : out std_logic_vector(4 downto 0)
);
end moonwar_dial;

architecture rtl of moonwar_dial is

signal count       : std_logic_vector(8 downto 0);

begin

process (clk) begin
	if rising_edge(clk) then
		if moveleft = '1' or moveright = '1' then
			count <= count + 1;
		end if;
	end if;
end process;

dialout <= moveleft & count(8 downto 5);

end rtl;
