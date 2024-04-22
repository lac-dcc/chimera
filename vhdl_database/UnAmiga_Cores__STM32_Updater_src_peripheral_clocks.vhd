
--
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clocks is
port (
	clk_28		: in    std_logic;		-- 28 MHz clock input
	nReset		: in    std_logic;

	clk_video	: out   std_logic;		--   14 MHz clock out for ULA
	clk_psg		: out   std_logic			-- 1.75 MHz clock out for AY (asynchronous)
);
end clocks;

architecture clocks_arch of clocks is
	signal counter	 : unsigned(3 downto 0);
begin

	process(nReset, clk_28)
	begin
		if nReset = '0' then
			counter <= (others => '0');
		elsif falling_edge(clk_28) then
			counter <= counter + 1;
		end if;
	end process;

	-- counter(0) = /2	= 14
	-- counter(1) = /4	= 7
	-- counter(2) = /8	= 3.5
	-- counter(3) = /16	= 1.75
	-- counter(4) = /32
	-- counter(5) = /64
	clk_video <= counter(0);
	clk_psg   <= '1' when counter(3 downto 0) = "1110" else '0';

end clocks_arch;
