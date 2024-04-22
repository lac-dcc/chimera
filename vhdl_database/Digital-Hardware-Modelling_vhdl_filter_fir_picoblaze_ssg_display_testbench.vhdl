-- Author: Varun Nagpal
-- Net Id: vxn180010
-- Design: Testbench for four 7-segment displays

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_signed.all;
use work.ssg_display_shared_package.all;

entity ssg_display_testbench is
end ssg_display_testbench;

architecture ssg_display_test of ssg_display_testbench is
	-- clock
	signal clk 					: std_logic := '0';
	signal rst 					: std_logic := '0';

	-- Interface as source
	signal switches_sig			: std_logic_vector(7 downto 0)		:= (others => '0');
	signal seg_sig				: SEG_T 							:= (others => DISABLE_SEG);
	signal buttons_in_sig		: std_logic_vector(3 downto 0)		:= (others => DISABLE_DP);
	signal dp_out_sig			: std_logic							:= DISABLE_DP;
	signal digits_enable_sig	: DIGITS_EN_T						:= (others => DISABLE_DIGIT);	
	signal leds_sig				: std_logic_vector(7 downto 0)		:= (others => '0');

	-- component declarations
	component ssg_display_top is
	    port (clk     					: in  std_logic;
    		  rst 						: in  std_logic;
    		  in_switches_p				: in  std_logic_vector(7 downto 0);	-- two 4-bit numbers to be added
    		  in_buttons_p				: in  std_logic_vector(3 downto 0);	-- enable/disable input signals for the decimal point of a digit
    		  out_seg_p					: out SEG_T;						-- enable output signals for seven led segments(cathode) of  currently refreshed digit
    		  out_dp_p					: out std_logic;					-- enable ouput signal for the decimal point of currently refreshed digit
    		  out_digits_en_p			: out DIGITS_EN_T;					-- enable signals for K=4 digits. only one digit out of K=4 digits is enabled for refresh duration
    		  out_leds_p				: out std_logic_vector(7 downto 0)	-- shows the two 4-bit input numbers on LEDs
    		  );
	end component ssg_display_top;


begin

	-- Create an instance of the top level module
	DUT: ssg_display_top port map ( clk 					=> clk,
									rst 					=> rst,
									in_switches_p			=> switches_sig,
									in_buttons_p			=> buttons_in_sig,
									out_seg_p				=> seg_sig,
									out_dp_p				=> dp_out_sig,
									out_digits_en_p			=> digits_enable_sig,
									out_leds_p				=> leds_sig
									);
	
	-- Clock generation
	clk_gen: process
	begin
		clk <= '0';
		wait for CLK_HIGH_TIME;
		clk <= '1';
		wait for CLK_LOW_TIME;
	end process clk_gen;

	-- Reset generation
	rst <= 	'1', 
			'0' after 4 * CLK_CYCLE_TIME;
	
	simulation: process
	begin
		switches_sig <= X"00";
		buttons_in_sig <= (others => DISABLE_DP);
		wait for 10*CLK_CYCLE_TIME;

		switches_sig <= X"45";
		buttons_in_sig <= (2 => ENABLE_DP, others => DISABLE_DP);
		wait for 4 * CC_CNT_MAX_I * CLK_CYCLE_TIME;

		switches_sig <= X"78";
		wait for 4 * CC_CNT_MAX_I * CLK_CYCLE_TIME;

		switches_sig <= X"EF";
		wait for 4 * CC_CNT_MAX_I * CLK_CYCLE_TIME;
	end process simulation;
end architecture ssg_display_test;