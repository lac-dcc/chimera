-- Author: Varun Nagpal
-- Net Id: vxn180010
-- [TITLE]
-- [DATE]
--
-- DESIGN: 
--
-- IN :
-- OUT:

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
use work.ssg_display_shared_package.all;
	
entity ssg_display is
    port (clk     					: in  std_logic;
    	  rst 						: in  std_logic;
		  in_bcds_p					: in  std_logic_vector(15 downto 0);-- Four BCD numbers that can be displayed by the four 7-segment digits
		  in_dps_p					: in  DP_T;							-- enable/disable input signals for the decimal point of a digit
		  out_seg_p					: out SEG_T;						-- enable output signals for seven led segments(cathode) of  currently refreshed digit
		  out_dp_p					: out std_logic;					-- enable ouput signal for the decimal point of currently refreshed digit
		  out_digits_en_p			: out DIGITS_EN_T					-- enable signals for K=4 digits. only one digit out of K=4 digits is enabled for refresh duration
    );
end ssg_display;

architecture rtl of ssg_display is
	signal seg_sig					: SEG_T;		-- 7-digits corresponding to 7-LED segments of a 7-segment display
	signal digits_en_sig			: DIGITS_EN_T;	-- Active low Anode Enable Signals: AN[K-1 downto 0]
	signal current_bcd_sig			: BCD_T;		-- 4-bit BCD encoding of a digit

	signal clk_enable_sig			: std_logic;
	signal cnt_reg 					: CC_CNT_T;

	signal current_state_reg		: FSM_STATE_T;
	signal next_state_sig			: FSM_STATE_T;
begin
	 -- Generate a clock enable signal
	 -- This clock on NEXSYS3 running has frequency of 100 MHz
	 -- or period of 10ns. We need to generate clock enable signal 
	 -- every 4 ms or @ 250 Hz. This corresponds to ~400000 cc
	 -- log2(400000) = 18.609 = ceil(log2(925283.368)) = 19. 
	 -- Thus we can use a 19-bit counter to generate a clock enable signal
	 gen_clk_enable_mem: process(clk, rst)
	 	variable cnt_temp: CC_CNT_T;
	 begin
	 	if rst = '1' then
	 		cnt_temp := ( others => '0');
	 	elsif  clk'event and clk = '1' then
	 		cnt_temp := cnt_temp + 1;
	 		if( cnt_temp = CC_CNT_MAX_U ) then
	 			cnt_temp := (others => '0');
	 		end if;
	 	end if;
	 	cnt_reg <= cnt_temp;
	 end process gen_clk_enable_mem;

	clk_enable_sig <= '1' when cnt_reg = (CC_CNT_MAX_U-1) else '0';

	-- Generate enable signals for K-digits (segmented)
	fsm_current_state_mem: process (clk, rst)
	begin
		if rst = '1' then
			current_state_reg <= (others => DISABLE_DIGIT);	-- force one-hot (not) encoding. 
			current_state_reg(0) <= ENABLE_DIGIT;			-- initial state is 1111..10 (NOT of 0000..01 since segmented display is common anode type)
		elsif clk'event and clk ='1' then
			current_state_reg <= next_state_sig;
		end if;
	end process fsm_current_state_mem;

	-- TBU: needs to be fixed or rewritten in standard style though it seems fine. 
	-- Look at EE254L_Nexys3_Basic_IO_Introduction.pdf , lab8.pdf (ENEE 245: Digital Circuits & Systems Lab — Lab 8) 
	-- and FPGA protyping book by Pong Chu for ideas
	fsm_next_state_oup_comb: process(current_state_reg, clk_enable_sig)
	begin
		if clk_enable_sig = '1' then
			next_state_sig <= current_state_reg(current_state_reg'HIGH-1 downto current_state_reg'LOW) & current_state_reg(current_state_reg'HIGH);
		else
			next_state_sig <= current_state_reg;			
		end if;
	end process fsm_next_state_oup_comb;

	-- combinational output
	digits_en_sig <= next_state_sig;

	-- Multiplexer to switch between 4-bit BCD encoding sets of K-digits
	switches_to_bcd_mux_comb: process (digits_en_sig, in_bcds_p, in_dps_p)
		variable temp_bcd : BCD_T;
		variable temp_dp : std_logic;
	begin
		temp_bcd := (others => '0');
		temp_dp  := DISABLE_DP;
		for I in digits_en_sig'RANGE loop
			if ( digits_en_sig(I) = ENABLE_DIGIT ) then
				temp_bcd := in_bcds_p( BCD_CNT*(I+1) - 1 downto BCD_CNT*I);
				temp_dp  := in_dps_p(I);
			end if;
		end loop;
		current_bcd_sig <= temp_bcd;
		out_dp_p <= temp_dp;
	end process switches_to_bcd_mux_comb;

	-- Segment decoder
	segment_decoder_comb: process (current_bcd_sig)
		variable temp_bcd : BCD_T;
		variable temp_seg : SEG_T;
	begin
		temp_bcd := current_bcd_sig;
		temp_seg := NOT SEG_OFF;

		-- Decode 4-bits (switches) representing a 4-bit BCD encoding of a 
		-- (hexa)decimal number and output a 7-bit code that lights up 
		-- appropriate LEDs of a single segmented display to display the
		-- (hexa)decimal digit.
		case temp_bcd is
			when x"0" 	=> temp_seg := NOT SEG_NUM_D0;	-- complemented since segment type on NEXSYS 3 is common anode(always H), so cathode leds are active low
			when x"1" 	=> temp_seg := NOT SEG_NUM_D1;
			when x"2" 	=> temp_seg := NOT SEG_NUM_D2;
			when x"3" 	=> temp_seg := NOT SEG_NUM_D3;
			when x"4" 	=> temp_seg := NOT SEG_NUM_D4;
			when x"5" 	=> temp_seg := NOT SEG_NUM_D5;
			when x"6" 	=> temp_seg := NOT SEG_NUM_D6;
			when x"7" 	=> temp_seg := NOT SEG_NUM_D7;
			when x"8" 	=> temp_seg := NOT SEG_NUM_D8;
			when x"9" 	=> temp_seg := NOT SEG_NUM_D9;
			when x"A" 	=> temp_seg := NOT SEG_NUM_XA;
			when x"B" 	=> temp_seg := NOT SEG_NUM_XB;
			when x"C" 	=> temp_seg := NOT SEG_NUM_XC;
			when x"D" 	=> temp_seg := NOT SEG_NUM_XD;
			when x"E" 	=> temp_seg := NOT SEG_NUM_XE;
			when x"F" 	=> temp_seg := NOT SEG_NUM_XF;
			when others	=> temp_seg := NOT SEG_OFF;
		end case;

		seg_sig	<= temp_seg;
	end process segment_decoder_comb;

	out_seg_p <= seg_sig;
	out_digits_en_p <= digits_en_sig;
end rtl;