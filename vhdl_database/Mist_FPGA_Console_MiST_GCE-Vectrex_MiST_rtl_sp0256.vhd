---------------------------------------------------------------------------------
-- sp0256 by Dar (darfpga@aol.fr) (14/04/2018)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
--
-- SP0256-al2 prom decoding scheme and speech synthesis algorithm are from :
--
-- Copyright Joseph Zbiciak, all rights reserved.
-- Copyright tim lindner, all rights reserved.
--
-- See C source code and license in sp0256.c from MAME source
--
-- VHDL code is by Dar.
--
---------------------------------------------------------------------------------
--
--	 One allophone is made of N parts (called here after lines), each part has a
--  16 bytes descriptor. One descriptor (for one part) contains one repeat value
--  one amplitude value, one period value and 2x6 filtering coefficients.
--
--  for line_cnt from 0 to nb_line-1 (part)
--		for line_rpt from 0 to line_rpt-1 (repeat)
--			for per_cnt from 0 to line_per-1 (period) 
--				produce 1 sample
--
--  One sample is the output of the 6 stages filter. Each filter stage is fed by
--  the output of the previous stage, the first stage is fed by the source sample
--
--  when line_per != 0 source sample is set to amplitude value only once at the
--  begin of each repeat (per_cnt==0) then source sample is set to 0
--
--  when line_per == 0 source sample is set to amplitude value only at the begin 
--  of each repeat (per_cnt==0) then source sample sign is toggled (+/-) when then
--  random noise generator lsb equal 1. In that case actual line_per is set to 64
--
--  
--  Sound sample frequency is 10kHz. I make a 25 stages linear state machine 
--  running at 250kHz that produce one sound sample per cycle.
--
--  As long as one allophones is available the state machine runs permanently and
--  there is zero latency between allophones.
--
--  During one (each) cycle the state machine:
--
--    - fetch new allophone or go on with current one if not finished
--    - get allophone first line descriptor address from rom entry table
--    - get allophone nb_line from rom entry table and jump to first line address
--    - get allophone line_rpt from rom current line descriptor
--    - get allophone amplitude from rom current line descriptor
--         manage source amplitude, reset filter if needed
--    - get allophone line_per from rom current line descriptor
--    - address filter coefficients F/B within rom current line descriptor,
--         feed filter input, update filter state with computation output 
--    - rescale last filter stage output to audio output 
--    - manage per_cnt, rpt_cnt, line_cnt and random noise generator
--
--  Filter computation:
--
--	   Filter coefficients F or B index is get from rom current line descriptor
--    (address managed by state machine), value is converted thru coeff_array
--    table. Coefficient index has a sign bit to be managed:
--
--      if index sign bit = 0, filter coefficient <= -coeff_array(index)
--      if index sign bit = 1, filter coefficient <= coeff_array(-index)
--
--    During one state machine cycle each filter is updated once.
--    One filter update require two state machine steps:
--	
--      step 1
-- 			sum_in1 <= filter input
--          sum_in2 <= filter coefficient F * filter state z1 / 256
--          sum_out <= sum_in1 + sum_in2
--      step 2
-- 			sum_in1 <= sum_out
--          sum_in2 <= filter coefficient B * filter state z2 / 512
--          sum_out <= sum_in1 + sum_in2
--          filter state z1 <= sum_in1 + sum_in2 
--          filter state z2 <= filter state z1 
--
--		(sum_out will be limited to -32768/+32767)
--
--  Audio output scaling to 10bits unsigned:
--
--    what :
--      Last filter output is limited to -8192/+8191
--      Then divided by 16 => -512/+511
--      Then offset by 512 => 0/1023
--
--    how: 
--      if    X >  8191, Y <= 1023
--      elsif X < -8192, Y <= 0
--      else             Y <= (X/16)+512
--
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity sp0256 is
port
(
	clock_250k   : in std_logic;
	reset        : in std_logic;

	input_rdy      : out std_logic;
	allophone      : in  std_logic_vector(5 downto 0);
	trig_allophone : in  std_logic;
	
	audio_out    : out std_logic_vector(9 downto 0)
);
end sp0256;

architecture syn of sp0256 is
  
 signal clock_250k_n : std_logic;
 signal rom_addr : std_logic_vector(11 downto 0);
 signal rom_do   : std_logic_vector( 7 downto 0);

 signal stage : integer range 0 to 24; -- stage counter 0-24;
 
 signal allo_entry                   : std_logic_vector(7 downto 0);
 signal allo_addr_lsb, allo_addr_msb : std_logic_vector(7 downto 0);
 signal allo_nb_line                 : std_logic_vector(7 downto 0);
 signal line_rpt, line_per           : std_logic_vector(7 downto 0);
 signal line_amp_lsb, line_amp_msb   : std_logic_vector(7 downto 0);
 
 signal amp, filter, coeff : signed(15 downto 0); 
 signal sum_in2            : signed(31 downto 0);
 signal sum_in1,sum_out_ul : signed(15 downto 0);
 signal sum_out            : signed(15 downto 0);
 signal divider            : std_logic;
 signal audio              : signed(15 downto 0);

 signal is_noise  : std_logic;
 signal noise_rng : std_logic_vector(15 downto 0) := X"0001";
 
 signal f0_z1,f0_z2 : signed(15 downto 0);
 signal f1_z1,f1_z2 : signed(15 downto 0);
 signal f2_z1,f2_z2 : signed(15 downto 0);
 signal f3_z1,f3_z2 : signed(15 downto 0);
 signal f4_z1,f4_z2 : signed(15 downto 0);
 signal f5_z1,f5_z2 : signed(15 downto 0);
  
 signal input_rdy_in     : std_logic;
 signal sound_on         : std_logic := '0';
 signal trig_allophone_r : std_logic;
 signal line_cnt, rpt_cnt, per_cnt : std_logic_vector(7 downto 0);
 
 signal coeff_idx : std_logic_vector(6 downto 0);
 
 type coeff_array_t is array(0 to  127) of integer range 0 to 511;
 signal coeff_array : coeff_array_t := (
    0,      9,      17,     25,     33,     41,     49,     57,
    65,     73,     81,     89,     97,     105,    113,    121,
    129,    137,    145,    153,    161,    169,    177,    185,
    193,    201,    209,    217,    225,    233,    241,    249,
    257,    265,    273,    281,    289,    297,    301,    305,
    309,    313,    317,    321,    325,    329,    333,    337,
    341,    345,    349,    353,    357,    361,    365,    369,
    373,    377,    381,    385,    389,    393,    397,    401,
    405,    409,    413,    417,    421,    425,    427,    429,
    431,    433,    435,    437,    439,    441,    443,    445,
    447,    449,    451,    453,    455,    457,    459,    461,
    463,    465,    467,    469,    471,    473,    475,    477,
    479,    481,    482,    483,    484,    485,    486,    487,
    488,    489,    490,    491,    492,    493,    494,    495,
    496,    497,    498,    499,    500,    501,    502,    503,
    504,    505,    506,    507,    508,    509,    510,    511);

begin

input_rdy <= input_rdy_in;
clock_250k_n <= not clock_250k;

-- stage counter : Fs=250k/25 = 10kHz
process (clock_250k, reset)
  begin
	if reset='1' then
		stage <= 0;
	else
      if rising_edge(clock_250k) then
			if stage >= 24 then 
				stage <= 0;
			else
				stage <= stage + 1;
			end if;
		end if;
	end if;
end process;

process (clock_250k, reset)
  begin
	if reset='1' then
		input_rdy_in <= '1';
		sound_on  <= '0';
		noise_rng <= X"0001";
	else
      if rising_edge(clock_250k) then
			
			trig_allophone_r <= trig_allophone;
			if trig_allophone = '1' and trig_allophone_r = '0' then
				input_rdy_in <= '0';
			end if;
			
			if sound_on = '0' then
			
				if stage = 0 and input_rdy_in = '0' then
					allo_entry <=       allophone*"11";
					rom_addr   <= X"0"&(allophone*"11");
					line_cnt   <= (others => '0');
					rpt_cnt    <= (others => '0');
					per_cnt    <= (others => '0');
					sound_on   <= '1';
					input_rdy_in <= '1';
				end if;
				
			else -- sound is on	
					
				case stage is
					when 0 =>
						rom_addr <= X"0"&allo_entry;						
					when 1 =>
						allo_addr_msb <= rom_do;
						rom_addr <= rom_addr + '1';
					when 2 =>
						allo_addr_lsb <= rom_do;
						rom_addr <= rom_addr + '1';
					when 3 =>
						allo_nb_line <= rom_do - '1';
						rom_addr <= (allo_addr_lsb +line_cnt) & X"0";
					when 4 =>
						line_rpt <= rom_do - '1';
						rom_addr <= rom_addr + '1';
					when 5 =>
						line_amp_msb <= rom_do;
						rom_addr <= rom_addr + '1';
					when 6 =>
						
						if per_cnt = X"00" then
							amp <= signed(line_amp_msb & rom_do);
						else
							if is_noise = '1' then
								if noise_rng(0) = '1' then
									amp <= -amp;
								end if;
							else
								amp <= (others => '0');
							end if;
						end if;
						
						if per_cnt = X"00"then
							f0_z1 <= (others => '0'); f0_z2 <= (others => '0');
							f1_z1 <= (others => '0'); f1_z2 <= (others => '0');
							f2_z1 <= (others => '0'); f2_z2 <= (others => '0');
							f3_z1 <= (others => '0'); f3_z2 <= (others => '0');
							f4_z1 <= (others => '0'); f4_z2 <= (others => '0');
							f5_z1 <= (others => '0'); f5_z2 <= (others => '0');
						end if;
							
						rom_addr <= rom_addr + '1';
						
					when 7 =>
						if rom_do = X"00" then 
							line_per <= X"40";
							is_noise <= '1';
						else
							line_per <= rom_do - '1';
							is_noise <= '0';
						end if;
						sum_in1  <= amp;
						filter   <= f0_z1;
						divider  <= '0';
						rom_addr <= rom_addr + '1';
					when 8 =>
						sum_in1  <= sum_out;
						filter   <= f0_z2;
						divider  <= '1';
						rom_addr <= rom_addr + '1';
						
					when 9 =>
						f0_z1    <= sum_out;
						f0_z2    <= f0_z1;
						sum_in1  <= sum_out;
						filter   <= f1_z1;
						divider  <= '0';
						rom_addr <= rom_addr + '1';
					when 10 =>
						sum_in1  <= sum_out;
						filter   <= f1_z2;
						divider  <= '1';
						rom_addr <= rom_addr + '1';
						
					when 11 =>
						f1_z1    <= sum_out;
						f1_z2    <= f1_z1;
						sum_in1  <= sum_out;
						filter   <= f2_z1;
						divider  <= '0';
						rom_addr <= rom_addr + '1';
					when 12 =>
						sum_in1  <= sum_out;
						filter   <= f2_z2;
						divider  <= '1';
						rom_addr <= rom_addr + '1';
						
					when 13 =>
						f2_z1    <= sum_out;
						f2_z2    <= f2_z1;
						sum_in1  <= sum_out;
						filter   <= f3_z1;
						divider  <= '0';
						rom_addr <= rom_addr + '1';
					when 14 =>
						sum_in1  <= sum_out;
						filter   <= f3_z2;
						divider  <= '1';
						rom_addr <= rom_addr + '1';

					when 15 =>
						f3_z1    <= sum_out;
						f3_z2    <= f3_z1;
						sum_in1  <= sum_out;
						filter   <= f4_z1;
						divider  <= '0';
						rom_addr <= rom_addr + '1';
					when 16 =>
						sum_in1  <= sum_out;
						filter   <= f4_z2;
						divider  <= '1';
						rom_addr <= rom_addr + '1';

					when 17 =>
						f4_z1    <= sum_out;
						f4_z2    <= f4_z1;
						sum_in1  <= sum_out;
						filter   <= f5_z1;
						divider  <= '0';
						rom_addr <= rom_addr + '1';
					when 18 =>
						sum_in1  <= sum_out;
						filter   <= f5_z2;
						divider  <= '1';
						rom_addr <= rom_addr + '1';
						
					when 19 =>
						f5_z1    <= sum_out;
						f5_z2    <= f5_z1;
						
						if sum_out > 510*16 then
							audio <= to_signed(1023,16);
						elsif sum_out < -510*16 then
							audio <= to_signed(0,16);
						else
							audio <= (sum_out/16)+X"0200";						
						end if;
					
					when 20 =>					
						if per_cnt >= line_per then
							per_cnt <= (others => '0');
							if rpt_cnt >= line_rpt then
								rpt_cnt <= (others => '0');
								if line_cnt >= allo_nb_line then
									line_cnt <= (others => '0');
									sound_on <= '0';
								else
									line_cnt <= line_cnt + '1';
								end if;
								is_noise <= '0';
							else
								rpt_cnt <= rpt_cnt + '1';
							end if;
						else
							per_cnt <= per_cnt + '1';
						end if;
						
						if noise_rng(0) = '1' then
							noise_rng <= ('0' & noise_rng(15 downto 1) ) xor X"4001";
						else
							noise_rng <=  '0' & noise_rng(15 downto 1);
						end if;

					when others => null;
				end case;
			
			end if;
	
		end if;
	end if;
end process;


audio_out <= std_logic_vector(unsigned(audio(9 downto 0)));

-- filter computation
coeff_idx <= rom_do(6 downto 0) when rom_do(7)='0' else
				 not(rom_do(6 downto 0)) + '1';

coeff <= -to_signed(coeff_array(to_integer(unsigned(coeff_idx))),16) when  rom_do(7)='0' else
			 to_signed(coeff_array(to_integer(unsigned(coeff_idx))),16);

sum_in2 <= (filter * coeff) / 256 when divider = '0' else 
           (filter * coeff) / 512 ;

sum_out_ul <= sum_in1 + sum_in2(15 downto 0);

sum_out <= to_signed( 32767,16) when sum_out_ul >  32767 else
			  to_signed(-32768,16) when sum_out_ul < -32768 else
			  sum_out_ul;
			  

-- sp0256-al2 prom (decoded)
sp0256_al2_decoded : entity work.sp0256_al2_decoded
port map(
 clk  => clock_250k_n,
 addr => rom_addr,
 data => rom_do  
);


end syn;
