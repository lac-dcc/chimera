library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity OperatorSharedTBWrap is
end OperatorSharedTBWrap;

architecture Behave of OperatorSharedTBWrap is
begin
   tb0: OperatorSharedTB generic map(g_num_req => 1,
				     operator_id => "ApIntAdd",
                                     zero_delay => true,
				     tb_id => "ApIntAdd num_req=1 ");  
   tb1: OperatorSharedTB generic map(g_num_req => 2,
				     operator_id => "ApIntAdd",
                                     zero_delay => false,
				     tb_id => "ApIntAdd num_req=2 ");
   tb2: OperatorSharedTB generic map(g_num_req => 5,
				     operator_id => "ApIntAdd",
                                     zero_delay => true,
				     tb_id => "ApIntAdd num_req=5 ");
end Behave;
