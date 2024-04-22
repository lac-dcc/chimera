library std;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.GlobalConstants.all;

library UNISIM;
use UNISIM.vcomponents.all;


entity clock_gater is
	port (clock_in, clock_enable: in std_logic; clock_out : out std_logic);
end entity clock_gater;

architecture behavioural of clock_gater is
      signal clock_enable_latched: std_logic;
begin
	assert use_xilinx_bufce report "For Xilinx synthesis AHIR, use_xilinx_bufce must be set true"
		severity failure;

	-------------------------------------------------------
	-- Xilinx IP uses latch internally...
	-------------------------------------------------------
	cgInst: bufgce 
		port map (I => clock_in, 
				O => clock_out,
				CE => clock_enable);		
	
end behavioural;
