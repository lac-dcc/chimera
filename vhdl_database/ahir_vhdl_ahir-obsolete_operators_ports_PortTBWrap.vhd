library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.Components.all;


entity PortTBWrap is
end PortTBWrap;

architecture Wrap of PortTBWrap is
	component PortTB is
  		generic
     				( g_num_req: integer := 2;
       				verbose_mode: boolean := false;
       				tb_id : string := "anonymous"
     				);
	end component PortTB;
begin
   tb0: PortTB generic map(g_num_req => 1, verbose_mode => false, tb_id => "num_req = 1");
   tb1: PortTB generic map(g_num_req => 2, verbose_mode => false, tb_id => "num_req = 2");
   tb2: PortTB generic map(g_num_req => 5, verbose_mode => false, tb_id => "num_req = 5");
end Wrap;
