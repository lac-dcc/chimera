library IEEE;
use IEEE.std_logic_1164.all;

entity HEX2SEGn is
	port(
		HEX	:in std_logic_vector(3 downto 0);
		DOT	:in std_logic;
		SEG	:out std_logic_vector(7 downto 0)
	);
end HEX2SEGn;

architecture RTL of HEX2SEGn is
component HEX2SEG
	port(
		HEX	:in std_logic_vector(3 downto 0);
		DOT	:in std_logic;
		SEG	:out std_logic_vector(7 downto 0)
	);
end component;
signal	tmp	:std_logic_vector(7 downto 0);
begin
	cnv	:hex2seg port map(HEX,DOT,tmp);
	SEG<=not tmp;

end RTL;
