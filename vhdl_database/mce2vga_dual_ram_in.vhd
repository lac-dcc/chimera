library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity dual_ram_in is
  port (	data			: in unsigned(7 downto 0);
			wraddress	: in unsigned(9 downto 0);
			wren			: in std_logic;
			rdaddress	: in unsigned(8 downto 0);
			wrclock		: in std_logic;
			rdclock		: in std_logic;
			q				: out unsigned(15 downto 0)
		 );
end entity dual_ram_in;

architecture behavioral of dual_ram_in is

type ram_type is array ( 0 to 810 ) of unsigned(7 downto 0);

signal ram : ram_type;

begin

	process(wrclock, wren, data, wraddress)
	begin
		if rising_edge(wrclock) then
			if (wren = '1' and wraddress < 810) then
				ram(to_integer(wraddress))  <= data; 
			end if;
		end if;
	end process;
	
	process(rdclock, rdaddress)
	begin
		if rising_edge(rdclock) then
			if (rdaddress < 405) then
				q(15 downto 8) <= ram(to_integer(rdaddress & '1')); 
			end if;
		end if;
	end process;	

	process(rdclock, rdaddress)
	begin
		if rising_edge(rdclock) then
			if (rdaddress < 405) then
				q(7 downto 0) <= ram(to_integer(rdaddress & '0')); 
			end if;
		end if;
	end process;	
	
	
end architecture behavioral;