-- (C) Rui T. Sousa from http://sweet.ua.pt/~a16360

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Debouncer is
	generic (Delay : positive);
	port (
		Clock  : in STD_LOGIC;
		Reset  : in STD_LOGIC;
		Input  : in STD_LOGIC;
		Output : out STD_LOGIC
	);
end Debouncer;

architecture Behavioral of Debouncer is

	signal DelayCounter : natural range 0 to Delay;
	signal Internal     : STD_LOGIC;

begin

	process(Clock, Reset)
	begin
		if Reset = '1' then
			Output <= '0';
			Internal <= '0';
			DelayCounter <= 0;
		elsif rising_edge(Clock) then
			if Input /= Internal then
				Internal <= Input;
				DelayCounter <= 0;
			elsif DelayCounter = Delay then
				Output <= Internal;
			else
				DelayCounter <= DelayCounter + 1;
			end if;
		end if;
	end process;

end Behavioral;