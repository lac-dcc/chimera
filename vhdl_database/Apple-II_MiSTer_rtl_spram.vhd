-- Generic single-port RAM implementation -
-- will hopefully work for both Altera and Xilinx parts

library ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY spram IS
	GENERIC
	(
		addrbits : integer := 9;
		databits : integer := 7;
		init_file : string := ""
	);
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (addrbits-1 downto 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (databits-1 downto 0);
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (databits-1 downto 0)
	);
END spram;

architecture arch of spram is

type ram_type is array(natural range ((2**addrbits)-1) downto 0) of std_logic_vector(databits-1 downto 0);
shared variable ram : ram_type;
attribute ram_init_file : string;
attribute ram_init_file of ram : variable is init_file;
begin

process (clock)
begin
	if (clock'event and clock = '1') then
		if wren='1' then
			ram(to_integer(unsigned(address))) := data;
			q <= data;
		else
			q <= ram(to_integer(unsigned(address)));
		end if;
	end if;
end process;


end architecture;
