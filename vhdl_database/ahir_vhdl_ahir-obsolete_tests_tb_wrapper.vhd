library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;		
		
library ahir;		
use ahir.Types.all;		
use ahir.Subprograms.all;		
use ahir.Utilities.all;		
use ahir.OperatorTBComponents.all;

entity tb_wrapper is		
  port		
    (all_tests_succeeded : out boolean;		
     all_tests_evaluated : out boolean);		
end tb_wrapper;

architecture Behave of tb_wrapper is        	
  signal done_flag    : BooleanArray(107 downto 0);        	
  signal success_flag : BooleanArray(107 downto 0);        	
        	
begin

  tb0 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_add_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntAdd",		        				
		g_output_high => 99,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(0),		        				
	     all_tests_passed => success_flag(0));

  tb1 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_add_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntAdd",		        				
		g_output_high => 14,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(1),		        				
	     all_tests_passed => success_flag(1));

  tb2 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_add_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntAdd",		        				
		g_output_high => 4,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(2),		        				
	     all_tests_passed => success_flag(2));

  tb3 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_add_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntAdd",		        				
		g_output_high => 7,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(3),		        				
	     all_tests_passed => success_flag(3));

  tb4 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_and_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntAnd",		        				
		g_output_high => 99,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(4),		        				
	     all_tests_passed => success_flag(4));

  tb5 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_and_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntAnd",		        				
		g_output_high => 14,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(5),		        				
	     all_tests_passed => success_flag(5));

  tb6 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_and_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntAnd",		        				
		g_output_high => 4,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(6),		        				
	     all_tests_passed => success_flag(6));

  tb7 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_and_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntAnd",		        				
		g_output_high => 7,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(7),		        				
	     all_tests_passed => success_flag(7));

  tb8 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ashr_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntASHR",		        				
		g_output_high => 99,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(8),		        				
	     all_tests_passed => success_flag(8));

  tb9 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ashr_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntASHR",		        				
		g_output_high => 14,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(9),		        				
	     all_tests_passed => success_flag(9));

  tb10 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ashr_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntASHR",		        				
		g_output_high => 4,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(10),		        				
	     all_tests_passed => success_flag(10));

  tb11 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ashr_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntASHR",		        				
		g_output_high => 7,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(11),		        				
	     all_tests_passed => success_flag(11));

  tb12 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_lshr_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntLSHR",		        				
		g_output_high => 99,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(12),		        				
	     all_tests_passed => success_flag(12));

  tb13 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_lshr_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntLSHR",		        				
		g_output_high => 14,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(13),		        				
	     all_tests_passed => success_flag(13));

  tb14 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_lshr_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntLSHR",		        				
		g_output_high => 4,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(14),		        				
	     all_tests_passed => success_flag(14));

  tb15 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_lshr_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntLSHR",		        				
		g_output_high => 7,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(15),		        				
	     all_tests_passed => success_flag(15));

  tb16 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_mul_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntMul",		        				
		g_output_high => 99,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(16),		        				
	     all_tests_passed => success_flag(16));

  tb17 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_mul_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntMul",		        				
		g_output_high => 14,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(17),		        				
	     all_tests_passed => success_flag(17));

  tb18 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_mul_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntMul",		        				
		g_output_high => 4,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(18),		        				
	     all_tests_passed => success_flag(18));

  tb19 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_mul_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntMul",		        				
		g_output_high => 7,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(19),		        				
	     all_tests_passed => success_flag(19));

  tb20 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_or_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntOr",		        				
		g_output_high => 99,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(20),		        				
	     all_tests_passed => success_flag(20));

  tb21 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_or_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntOr",		        				
		g_output_high => 14,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(21),		        				
	     all_tests_passed => success_flag(21));

  tb22 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_or_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntOr",		        				
		g_output_high => 4,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(22),		        				
	     all_tests_passed => success_flag(22));

  tb23 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_or_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntOr",		        				
		g_output_high => 7,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(23),		        				
	     all_tests_passed => success_flag(23));

  tb24 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_shl_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSHL",		        				
		g_output_high => 99,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(24),		        				
	     all_tests_passed => success_flag(24));

  tb25 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_shl_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSHL",		        				
		g_output_high => 14,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(25),		        				
	     all_tests_passed => success_flag(25));

  tb26 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_shl_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSHL",		        				
		g_output_high => 4,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(26),		        				
	     all_tests_passed => success_flag(26));

  tb27 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_shl_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSHL",		        				
		g_output_high => 7,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(27),		        				
	     all_tests_passed => success_flag(27));

  tb28 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sub_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSub",		        				
		g_output_high => 99,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(28),		        				
	     all_tests_passed => success_flag(28));

  tb29 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sub_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSub",		        				
		g_output_high => 14,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(29),		        				
	     all_tests_passed => success_flag(29));

  tb30 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sub_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSub",		        				
		g_output_high => 4,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(30),		        				
	     all_tests_passed => success_flag(30));

  tb31 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sub_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSub",		        				
		g_output_high => 7,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(31),		        				
	     all_tests_passed => success_flag(31));

  tb32 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_xor_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntXor",		        				
		g_output_high => 99,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(32),		        				
	     all_tests_passed => success_flag(32));

  tb33 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_xor_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntXor",		        				
		g_output_high => 14,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(33),		        				
	     all_tests_passed => success_flag(33));

  tb34 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_xor_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntXor",		        				
		g_output_high => 4,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(34),		        				
	     all_tests_passed => success_flag(34));

  tb35 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_xor_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntXor",		        				
		g_output_high => 7,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(35),		        				
	     all_tests_passed => success_flag(35));

  tb36 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_eq_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntEq",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(36),		        				
	     all_tests_passed => success_flag(36));

  tb37 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_eq_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntEq",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(37),		        				
	     all_tests_passed => success_flag(37));

  tb38 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_eq_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntEq",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(38),		        				
	     all_tests_passed => success_flag(38));

  tb39 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_eq_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntEq",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(39),		        				
	     all_tests_passed => success_flag(39));

  tb40 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ne_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntNe",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(40),		        				
	     all_tests_passed => success_flag(40));

  tb41 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ne_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntNe",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(41),		        				
	     all_tests_passed => success_flag(41));

  tb42 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ne_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntNe",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(42),		        				
	     all_tests_passed => success_flag(42));

  tb43 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ne_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntNe",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(43),		        				
	     all_tests_passed => success_flag(43));

  tb44 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ugt_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUgt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(44),		        				
	     all_tests_passed => success_flag(44));

  tb45 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ugt_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUgt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(45),		        				
	     all_tests_passed => success_flag(45));

  tb46 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ugt_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUgt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(46),		        				
	     all_tests_passed => success_flag(46));

  tb47 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ugt_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUgt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(47),		        				
	     all_tests_passed => success_flag(47));

  tb48 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_uge_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(48),		        				
	     all_tests_passed => success_flag(48));

  tb49 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_uge_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(49),		        				
	     all_tests_passed => success_flag(49));

  tb50 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_uge_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(50),		        				
	     all_tests_passed => success_flag(50));

  tb51 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_uge_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(51),		        				
	     all_tests_passed => success_flag(51));

  tb52 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ult_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUlt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(52),		        				
	     all_tests_passed => success_flag(52));

  tb53 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ult_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUlt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(53),		        				
	     all_tests_passed => success_flag(53));

  tb54 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ult_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUlt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(54),		        				
	     all_tests_passed => success_flag(54));

  tb55 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ult_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUlt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(55),		        				
	     all_tests_passed => success_flag(55));

  tb56 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ule_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUle",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(56),		        				
	     all_tests_passed => success_flag(56));

  tb57 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ule_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUle",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(57),		        				
	     all_tests_passed => success_flag(57));

  tb58 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ule_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUle",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(58),		        				
	     all_tests_passed => success_flag(58));

  tb59 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_ule_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntUle",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(59),		        				
	     all_tests_passed => success_flag(59));

  tb60 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sgt_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSgt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(60),		        				
	     all_tests_passed => success_flag(60));

  tb61 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sgt_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSgt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(61),		        				
	     all_tests_passed => success_flag(61));

  tb62 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sgt_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSgt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(62),		        				
	     all_tests_passed => success_flag(62));

  tb63 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sgt_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSgt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(63),		        				
	     all_tests_passed => success_flag(63));

  tb64 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sge_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(64),		        				
	     all_tests_passed => success_flag(64));

  tb65 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sge_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(65),		        				
	     all_tests_passed => success_flag(65));

  tb66 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sge_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(66),		        				
	     all_tests_passed => success_flag(66));

  tb67 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sge_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(67),		        				
	     all_tests_passed => success_flag(67));

  tb68 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_slt_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSlt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(68),		        				
	     all_tests_passed => success_flag(68));

  tb69 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_slt_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSlt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(69),		        				
	     all_tests_passed => success_flag(69));

  tb70 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_slt_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSlt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(70),		        				
	     all_tests_passed => success_flag(70));

  tb71 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_slt_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSlt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(71),		        				
	     all_tests_passed => success_flag(71));

  tb72 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sle_100.txt",		        				
		g_input1_high => 99,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 99,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSle",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(72),		        				
	     all_tests_passed => success_flag(72));

  tb73 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sle_15.txt",		        				
		g_input1_high => 14,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 14,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSle",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(73),		        				
	     all_tests_passed => success_flag(73));

  tb74 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sle_5.txt",		        				
		g_input1_high => 4,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 4,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSle",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(74),		        				
	     all_tests_passed => success_flag(74));

  tb75 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apint_sle_8.txt",		        				
		g_input1_high => 7,		        				
		g_input1_low  => 0,		        				
		g_input2_high => 7,		        				
		g_input2_low  => 0,		        				
		g_operator_id => "ApIntSle",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(75),		        				
	     all_tests_passed => success_flag(75));

  tb76 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_add_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatAdd",		        				
		g_output_high => 8,		        				
		g_output_low  => -23)		        				
		        				
    port map(all_tests_done   => done_flag(76),		        				
	     all_tests_passed => success_flag(76));

  tb77 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_add_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatAdd",		        				
		g_output_high => 11,		        				
		g_output_low  => -52)		        				
		        				
    port map(all_tests_done   => done_flag(77),		        				
	     all_tests_passed => success_flag(77));

  tb78 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_sub_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatSub",		        				
		g_output_high => 8,		        				
		g_output_low  => -23)		        				
		        				
    port map(all_tests_done   => done_flag(78),		        				
	     all_tests_passed => success_flag(78));

  tb79 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_sub_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatSub",		        				
		g_output_high => 11,		        				
		g_output_low  => -52)		        				
		        				
    port map(all_tests_done   => done_flag(79),		        				
	     all_tests_passed => success_flag(79));

  tb80 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_mul_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatMul",		        				
		g_output_high => 8,		        				
		g_output_low  => -23)		        				
		        				
    port map(all_tests_done   => done_flag(80),		        				
	     all_tests_passed => success_flag(80));

  tb81 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_mul_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatMul",		        				
		g_output_high => 11,		        				
		g_output_low  => -52)		        				
		        				
    port map(all_tests_done   => done_flag(81),		        				
	     all_tests_passed => success_flag(81));

  tb82 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Oeq_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatOeq",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(82),		        				
	     all_tests_passed => success_flag(82));

  tb83 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Oeq_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatOeq",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(83),		        				
	     all_tests_passed => success_flag(83));

  tb84 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_One_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatOne",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(84),		        				
	     all_tests_passed => success_flag(84));

  tb85 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_One_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatOne",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(85),		        				
	     all_tests_passed => success_flag(85));

  tb86 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Ogt_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatOgt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(86),		        				
	     all_tests_passed => success_flag(86));

  tb87 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Ogt_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatOgt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(87),		        				
	     all_tests_passed => success_flag(87));

  tb88 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Oge_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatOge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(88),		        				
	     all_tests_passed => success_flag(88));

  tb89 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Oge_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatOge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(89),		        				
	     all_tests_passed => success_flag(89));

  tb90 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Oge_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatOge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(90),		        				
	     all_tests_passed => success_flag(90));

  tb91 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Oge_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatOge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(91),		        				
	     all_tests_passed => success_flag(91));

  tb92 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Olt_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatOlt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(92),		        				
	     all_tests_passed => success_flag(92));

  tb93 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Olt_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatOlt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(93),		        				
	     all_tests_passed => success_flag(93));

  tb94 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Ole_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatOle",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(94),		        				
	     all_tests_passed => success_flag(94));

  tb95 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Ole_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatOle",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(95),		        				
	     all_tests_passed => success_flag(95));

  tb96 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Ueq_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatUeq",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(96),		        				
	     all_tests_passed => success_flag(96));

  tb97 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Ueq_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatUeq",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(97),		        				
	     all_tests_passed => success_flag(97));

  tb98 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Une_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatUne",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(98),		        				
	     all_tests_passed => success_flag(98));

  tb99 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Une_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatUne",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(99),		        				
	     all_tests_passed => success_flag(99));

  tb100 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Ugt_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatUgt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(100),		        				
	     all_tests_passed => success_flag(100));

  tb101 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Ugt_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatUgt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(101),		        				
	     all_tests_passed => success_flag(101));

  tb102 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Uge_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatUge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(102),		        				
	     all_tests_passed => success_flag(102));

  tb103 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Uge_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatUge",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(103),		        				
	     all_tests_passed => success_flag(103));

  tb104 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Ult_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatUlt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(104),		        				
	     all_tests_passed => success_flag(104));

  tb105 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Ult_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatUlt",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(105),		        				
	     all_tests_passed => success_flag(105));

  tb106 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Ule_32.txt",		        				
		g_input1_high => 8,		        				
		g_input1_low  => -23,		        				
		g_input2_high => 8,		        				
		g_input2_low  => -23,		        				
		g_operator_id => "ApFloatUle",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(106),		        				
	     all_tests_passed => success_flag(106));

  tb107 : tb_two_operands		        				
    generic map(g_file_name   => "gen_apfloat_Ule_64.txt",		        				
		g_input1_high => 11,		        				
		g_input1_low  => -52,		        				
		g_input2_high => 11,		        				
		g_input2_low  => -52,		        				
		g_operator_id => "ApFloatUle",		        				
		g_output_high => 0,		        				
		g_output_low  => 0)		        				
		        				
    port map(all_tests_done   => done_flag(107),		        				
	     all_tests_passed => success_flag(107));

  process(done_flag)        		
  begin        		
    if(AndReduce(done_flag))then        		
      all_tests_evaluated <= true;        		
      if(AndReduce(success_flag)) then        		
	assert false report "All Tests Have Passed  " severity note;        		
	all_tests_succeeded <= true;        		
      else        		
	assert false report "Some Tests Have Failed " severity error;        		
	all_tests_succeeded <= false;        		
      end if;        		
    else        		
      all_tests_evaluated <= false;        		
    end if;        		
  end process;        		
        		
end Behave;
