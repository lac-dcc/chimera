library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity os_rom is
	port(
		A 		: in std_logic_vector(7 downto 0);
		OEn		: in std_logic;
		D		: out std_logic_vector(15 downto 0)
	);
end os_rom;

architecture rtl of os_rom is
begin
	process(OEn, A)
	begin
		if OEn = '0' then
			case A is
XXX			
when others => D <= x"ffff";
			end case;
		else
			D <= (others => 'Z');
		end if;
	end process;

end rtl;
