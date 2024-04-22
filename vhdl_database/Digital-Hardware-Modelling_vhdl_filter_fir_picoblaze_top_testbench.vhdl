-- Author: Varun Nagpal
-- Net Id: vxn180010
-- Microprocessor Systems Project
-- December, 6th 2018
--
-- Design: Testbench for the Generic Nth order (L = N+1 taps) Transposed Direct-form FIR-filter 
--		   controlled using Xilinx Picoblaze processor and whose output is displayed on seven segment 
--		   display

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_signed.all;
use work.fir_filter_shared_package.all;
use work.ssg_display_shared_package.all;

entity top_testbench is
end top_testbench;

architecture top_test of top_testbench is

	component top is
	    port (clk     			: in  	std_logic;
	    	  rst 				: in  	std_logic;
	    	  out_seg_p			: out 	SEG_T;
	    	  out_dp_p			: out 	std_logic;
	    	  out_digits_en_p	: out 	DIGITS_EN_T
	    	  );
	end component top;

	-- clock and asynchronous reset
	signal clk 			: std_logic := '0';
	signal rst 			: std_logic := '1';

	signal seg_sig				: SEG_T 							:= (others => DISABLE_SEG);
	signal dp_out_sig			: std_logic							:= DISABLE_DP;
	signal digits_enable_sig	: DIGITS_EN_T						:= (others => DISABLE_DIGIT);		
begin

	-- Create an instance of the FIR filter controlled 
	-- using Xilinx Picoblaze and whose output is displayed
	-- using seven segment display  
	DUT: top
    	 port map (	clk 			=> clk, 
    	 			rst 			=> rst, 
    	 			out_seg_p 		=> seg_sig,
    	 			out_dp_p		=> dp_out_sig,
    	 			out_digits_en_p	=> digits_enable_sig
    	  );

	-- Clock generation
	clk_gen: process
	begin
		clk <= '0';
		wait for CLK_LOW_TIME;
		clk <= '1';
		wait for CLK_HIGH_TIME;
	end process clk_gen;

	-- Reset generation
	rst <= 	'1', 
			'0' after CLK_CYCLE_TIME;

	process
	begin
		wait for 100 * CLK_CYCLE_TIME;
	end process;
--	print_messages: process begin
--	end process print_messages;

--	stop_sim: process begin
--		wait for 24*CLK_CYCLE_TIME;
--		std.env.stop;
--	end process stop_sim;


end architecture top_test;
