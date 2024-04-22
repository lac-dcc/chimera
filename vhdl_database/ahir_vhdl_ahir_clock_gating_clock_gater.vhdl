library std;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.GlobalConstants.all;


entity clock_gater is
	port (clock_in, clock_enable: in std_logic; clock_out : out std_logic);
end entity clock_gater;

architecture behavioural of clock_gater is
      signal clock_enable_latched: std_logic;
begin
	assert (not use_xilinx_bufce) report "For vanilla AHIR, use_xilinx_bufce must be set false"
		severity failure;

	-------------------------------------------------------
	-- latch followed by AND.
	-------------------------------------------------------
	process(clock_in)
	begin
		if(clock_in = '0') then
			clock_enable_latched <= clock_enable;
		end if;
	end process;
	clock_out <= clock_in and clock_enable_latched;
	-------------------------------------------------------

end behavioural;
