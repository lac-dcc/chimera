library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity interruptgen is
	port(
		I_clk: in std_logic := '0';
		I_interrupt: in std_logic := '0';
		O_interrupt: out std_logic := '0'
	);
end interruptgen;

architecture Behavioral of interruptgen is
	constant CYCLELENGTH: integer := 3000000;
	signal act: boolean := false;
begin

	-- generate interrupt signals if active
	process(I_clk)
		variable clockcnt: integer range 0 to CYCLELENGTH;
	begin
		if rising_edge(I_clk) then
			
			O_interrupt <= '0';
			if(clockcnt < (CYCLELENGTH / 30) and act) then
				O_interrupt <= '1';
			end if;
	
			
			clockcnt := clockcnt + 1;
			
			if(clockcnt >= CYCLELENGTH) then
				clockcnt := 0;
			end if;
			
		end if;
	end process;
	
	-- toggle activity
	process(I_interrupt)
	begin
		if rising_edge(I_interrupt) then
			act <= not act;
		end if;
	end process;

	
end Behavioral;