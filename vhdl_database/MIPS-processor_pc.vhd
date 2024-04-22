------------------------------------------------------
-- Program Counter component
--
-- Points to address of next instruction to run and returns
-- that address in current_address.
------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is
	port(
		ck: in std_logic;
		address_to_load: in std_logic_vector(31 downto 0);
		current_address: out std_logic_vector(31 downto 0)
	);
end pc;

architecture beh of pc is

	signal address: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";

	begin

	process(ck)
		begin
		current_address <= address;
		if ck='0' and ck'event then
			address <= address_to_load;
		end if;
	end process;

end beh;
