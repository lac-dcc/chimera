-- all component declarations necessary for the
-- vhdl generator
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;

package OperatorTBComponents is

component tb_single_operand is

  generic(g_file_name   : string  := "gen_apint_not_5.txt";
          g_input1_high : integer := 4;
          g_input1_low  : integer := 0;
          g_operator_id : string  := "ApIntNot";
          g_output_high : integer := 4;
          g_output_low  : integer := 0);

  port(all_tests_done   : out boolean;
       all_tests_passed : out boolean);

end component tb_single_operand;

component tb_two_operands is

  generic(g_file_name   : string  := "gen_apint_add_5.txt";
          g_input1_high : integer := 4;
          g_input1_low  : integer := 0;
          g_input2_high : integer := 4;
          g_input2_low  : integer := 0;
          g_operator_id : string  := "ApIntAdd";
          g_output_high : integer := 4;
          g_output_low  : integer := 0);

  port(all_tests_done   : out boolean;
       all_tests_passed : out boolean);

end component tb_two_operands;

end OperatorTBComponents;
