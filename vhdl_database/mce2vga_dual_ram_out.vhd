library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity dual_ram_out is
  port (	data			: in unsigned(15 downto 0);
			wraddress	: in unsigned(8 downto 0);
			wren			: in std_logic;
			rdaddress	: in unsigned(9 downto 0);
			wrclock		: in std_logic;
			rdclock		: in std_logic;
			q				: out unsigned(7 downto 0)
		 );
end entity dual_ram_out;

architecture behavioral of dual_ram_out is

type ram_type is array ( 0 to 405 ) of unsigned(15 downto 0);

signal ram : ram_type;

begin

	process(wrclock, wren, data, wraddress)
	begin
		if rising_edge(wrclock) then
			if (wren = '1' and wraddress < 405) then
				ram(to_integer(wraddress)) <= data; 
			end if;
		end if;
	end process;
	
	process(rdclock, rdaddress)
	begin
		if rising_edge(rdclock) then
			if (rdaddress < 810) then
				if (rdaddress(0) = '0') then
					q <= ram(to_integer(rdaddress(9 downto 1))) (7 downto 0); 
				else
					q <= ram(to_integer(rdaddress(9 downto 1))) (15 downto 8); 
				end if;
			end if;
		end if;
	end process;	

end architecture behavioral;