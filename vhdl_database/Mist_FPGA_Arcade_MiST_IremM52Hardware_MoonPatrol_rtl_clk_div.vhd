library ieee;
use ieee.std_logic_1164.all;

entity clk_div is
	generic
	(
		DIVISOR   : natural
	);
  port
  (
    clk       : in std_logic;
    reset     : in std_logic;

		clk_en    : out std_logic
  );
end clk_div;

architecture SYN of clk_div is

begin

	process (clk, reset)
		variable count : integer range 0 to DIVISOR-1;
	begin
		if reset = '1' then
			count := 0;
			clk_en <= '0';
		elsif rising_edge(clk) then
			clk_en <= '0';
			if count = DIVISOR-1 then
				clk_en <= '1';
				count := 0;
			else
				count := count + 1;
			end if;
		end if;
	end process;

end SYN;
