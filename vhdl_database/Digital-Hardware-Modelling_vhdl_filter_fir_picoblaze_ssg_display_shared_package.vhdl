-- Author: Varun Nagpal

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;

package ssg_display_shared_package is

	constant DIGIT_CNT 		: natural := 4;			-- k number of digits
	constant MIN_DIGITS_C 	: natural := 1;			-- minimum number of digits (board specific)
	constant MAX_DIGITS_C 	: natural := 4;			-- maximum number of digits (board specific)
	constant SEG_CNT	    : natural := 7;			-- 7 segments per digit(board specific)
	constant DP_CNT		    : natural := DIGIT_CNT;	-- 1 decimal point per digit(board specific)
	constant BCD_CNT 		: natural := 4;			-- Number of bits used in BCD encoding

	 -- This clock on NEXSYS3 running has frequency of 100 MHz
	 -- or period of 10ns. We need to generate clock enable signal 
	 -- every 4 ms or @ 250 Hz. This corresponds to ~400000 cc
	 -- log2(400000) = 18.609 = ceil(log2(925283.368)) = 19. 
	 -- Thus we can use a 19-bit counter to generate a clock enable signal
    constant CLK_CYCLE_TIME  : time 	:= 10 ns;									-- modifiable
    constant CLK_HIGH_TIME   : time 	:= 5 ns;	 								-- modifiable
    constant CLK_LOW_TIME    : time 	:= CLK_CYCLE_TIME - CLK_HIGH_TIME;			-- modifiable
	constant CC_CNT_MAX_I	 : natural 	:= 400000;									-- modifiable
	constant CC_BIT_CNT_I	 : natural 	:= natural(ceil(log2(real(CC_CNT_MAX_I))));    
	subtype CC_CNT_T is unsigned(CC_BIT_CNT_I-1 downto 0);
    constant CC_CNT_MAX_U    : CC_CNT_T:= to_unsigned(CC_CNT_MAX_I, CC_BIT_CNT_I);	

	constant SWITCH_CNT		: natural 	:= DIGIT_CNT * BCD_CNT;	-- Number of switches = k digits x 4-bits/digit encoded in BCD.
	constant TOT_SEG_CNTNT	: natural	:= DIGIT_CNT * SEG_CNT;	-- k digits x 7 segments/digit
	constant ENABLE_DIGIT	: std_logic := '0';
	constant DISABLE_DIGIT	: std_logic := '1';	-- active low common anode
	constant ENABLE_SEG		: std_logic := '0';	
	constant DISABLE_SEG	: std_logic := '1';
	constant ENABLE_DP		: std_logic := '0';
	constant DISABLE_DP		: std_logic := '1';

	subtype SWITCH_T is std_logic_vector(SWITCH_CNT-1 downto 0);
	subtype SEG_T is std_logic_vector(SEG_CNT-1 downto 0);
	subtype DP_T is std_logic_vector(DP_CNT-1 downto 0);
	subtype BCD_T is std_logic_vector(BCD_CNT-1 downto 0);
	subtype DIGITS_EN_T is std_logic_vector(DIGIT_CNT-1 downto 0);
	subtype FSM_STATE_T is std_logic_vector(DIGIT_CNT-1 downto 0);

	-- codes for 7 segments (a,b,c,d,e,f,g) for:
	-- 1. decimal digits
	-- 2. hexadecimal digits
	-- Note: The below constants assumes that 7-segment type is common cathode
	--		 i.e. user can assign only anode terminals (P junction of LED) 
	-- 		 of respective segments of a digit.
	-- 		 If the 7-segment is of common anode type i.e. all segments of digit share
	--		 common anode and have separate cathode nodes for each segment, then the 
	--		 below mentioned constants must be bit-wise complemented before they are
	--		 assigned to individual segments of a digit
	constant SEG_NUM_D0 : SEG_T := "1111110";
	constant SEG_NUM_D1 : SEG_T := "0110000";
	constant SEG_NUM_D2 : SEG_T := "1101101";
	constant SEG_NUM_D3 : SEG_T := "1111001";
	constant SEG_NUM_D4 : SEG_T := "0110011";
	constant SEG_NUM_D5 : SEG_T := "1011011";
	constant SEG_NUM_D6 : SEG_T := "1011111";
	constant SEG_NUM_D7 : SEG_T := "1110000";
	constant SEG_NUM_D8 : SEG_T := "1111111";
	constant SEG_NUM_D9 : SEG_T := "1110011";
	constant SEG_NUM_XA : SEG_T := "1110111";
	constant SEG_NUM_XB : SEG_T := "1111111";
	constant SEG_NUM_XC : SEG_T := "1001110";
	constant SEG_NUM_XD : SEG_T := "1111110";
	constant SEG_NUM_XE : SEG_T := "1001111";
	constant SEG_NUM_XF : SEG_T := "1000111";
	constant SEG_OFF	: SEG_T := "0000000";
end ssg_display_shared_package;

package body ssg_display_shared_package is
	-- empty
end ssg_display_shared_package;