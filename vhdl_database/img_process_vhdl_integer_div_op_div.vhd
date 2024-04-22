
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity op_div is
generic (
			constant data_width : integer := 8
);
port (
		clk : in std_logic;
		rst : in std_logic;
		
		dividend : in std_logic_vector(data_width - 1 downto 0);
		divisor : in std_logic_vector(data_width - 1 downto 0);
		
		remain : out std_logic_vector(data_width - 1 downto 0);
		quotient : out std_logic_vector(data_width - 1 downto 0);
		
		in_valid : in std_logic;
		out_valid : out std_logic
	  );
end op_div;
 
architecture op_div of op_div is
	
	signal s_divisor : unsigned(dividend'range);
	signal s_dividend : unsigned(dividend'range);
	
	signal s_quotient : unsigned(dividend'range);
	signal s_remain: unsigned(dividend'range);
	signal s_result : unsigned(dividend'length + 4 - 1 downto 0);
	
	signal s_q00,s_q01,s_q02,s_q03,s_q04,s_q05,s_q06,s_q07,s_q08,s_q09,s_q10,s_q11: unsigned(dividend'range);
	signal s_r00,s_r01,s_r02,s_r03,s_r04,s_r05,s_r06,s_r07,s_r08,s_r09,s_r10,s_r11: unsigned(dividend'range);
	signal s_d00,s_d01,s_d02,s_d03,s_d04,s_d05,s_d06,s_d07,s_d08,s_d09,s_d10,s_d11: unsigned(dividend'range);
	signal s_1_16,s_2_16,s_3_16,s_4_16,s_5_16,s_6_16,s_7_16,s_8_16,s_9_16,s_10_16,s_11_16,s_12_16,s_13_16,s_14_16,s_15_16: unsigned(dividend'range);
	signal s_tmp_1_16,s_tmp_2_16,s_tmp_8_16,s_tmp_4_16: unsigned(dividend'range);
	
	
	signal s_cmp_1_16,	s_cmp_2_16,		s_cmp_3_16,		s_cmp_4_16: 	unsigned(dividend'range);
	signal s_cmp_5_16,	s_cmp_6_16,		s_cmp_7_16,		s_cmp_8_16: 	unsigned(dividend'range);
	signal s_cmp_9_16,	s_cmp_10_16,	s_cmp_11_16,	s_cmp_12_16: 	unsigned(dividend'range);
	signal s_cmp_13_16,	s_cmp_14_16,	s_cmp_15_16: 					unsigned(dividend'range);
	
	signal valid_in,valid00,valid01,valid02,valid03,valid04,valid05,valid06,valid07,valid08,valid09: std_logic;
	signal s_out_valid, s_in_valid : std_logic;
	
	signal s_subfix : integer range  0 to 15;
	
	
	component op_sub is
	generic (
				constant data_width : integer := 8;
				constant addr_cnt	:integer := 20
	);
	port (
			clk : in std_logic;
			rst : in std_logic;						
			q0,r0,d0 : in unsigned(data_width - 1 downto 0);
			d1,q1, r1: out unsigned(data_width - 1 downto 0)		
		);
	end component;
begin

	s_in_valid <= in_valid;	
	out_valid <= s_out_valid;		
	s_divisor <= unsigned(divisor);
	remain <= std_logic_vector(s_remain);
	quotient <= std_logic_vector(s_quotient);
	s_result <= s_quotient & to_unsigned(s_subfix, 4);
	

	data_path : process(clk, rst)
	variable v_remain : unsigned(dividend'range);
	begin
		--data_len := s_8_16
		if rst = '0' then	
			s_d00 <= (others => '0');
			s_q00 <= (others => '0');
			s_r00 <= (others => '0');		

			s_1_16 <= (others => '0');		s_5_16 <= (others => '0');			s_9_16 <= (others => '0');		s_13_16 <= (others => '0');		s_tmp_1_16 <= (others => '0');
			s_2_16 <= (others => '0');	    s_6_16 <= (others => '0');	        s_10_16 <= (others => '0');	    s_14_16 <= (others => '0');	    s_tmp_2_16 <= (others => '0');
			s_3_16 <= (others => '0');	    s_7_16 <= (others => '0');	        s_11_16 <= (others => '0');	    s_15_16 <= (others => '0');	    s_tmp_8_16 <= (others => '0');
			s_4_16 <= (others => '0');	    s_8_16 <= (others => '0');	        s_12_16 <= (others => '0');	                                    s_tmp_4_16 <= (others => '0');
			
			s_cmp_1_16	<= (others => '0');		s_cmp_2_16	<= (others => '0');	s_cmp_3_16	<= (others => '0');	s_cmp_4_16 	<= (others => '0');
			s_cmp_5_16	<= (others => '0');		s_cmp_6_16	<= (others => '0');	s_cmp_7_16	<= (others => '0');	s_cmp_8_16  <= (others => '0');
			s_cmp_9_16	<= (others => '0');		s_cmp_10_16	<= (others => '0');	s_cmp_11_16	<= (others => '0');	s_cmp_12_16 <= (others => '0');
			s_cmp_13_16 <= (others => '0');		s_cmp_14_16	<= (others => '0');	s_cmp_15_16	<= (others => '0');				
			
			s_subfix <= 0;
			v_remain := (others => '0');
			s_remain  <= (others => '0');
			s_quotient  <= (others => '0');
		elsif rising_edge(clk) then			
			if(s_in_valid = '1') then
				s_d00 <= s_divisor;
				s_q00 <= (others => '0');
				s_r00 <= x"01";
			
			s_8_16 <= shift_right(s_d06, 1);	s_4_16 <= shift_right(s_d06, 2);	s_2_16 <= shift_right(s_d06, 3);	s_1_16 <= shift_right(s_d06, 4);
			
			s_3_16 <= s_1_16 + s_2_16;	s_5_16 <= s_1_16 + s_4_16;	s_6_16 <= s_2_16 + s_4_16;	s_9_16 <= s_1_16 + s_8_16; 	s_10_16 <= s_2_16 + s_8_16; s_12_16 <= s_4_16 + s_8_16;
			s_tmp_1_16 <= s_1_16;	s_tmp_2_16 <= s_2_16;	s_tmp_4_16 <= s_4_16;	s_tmp_8_16 <= s_8_16;
			
			s_7_16 <= s_tmp_1_16 + s_6_16;				s_11_16 <= s_tmp_8_16 + s_3_16;			s_13_16 <= s_tmp_1_16 + s_12_16;		s_14_16 <= s_tmp_8_16 + s_6_16;		s_15_16 <= s_3_16 + s_12_16;
			s_cmp_7_16 <= s_tmp_1_16 + s_6_16;			s_cmp_1_16 <= s_tmp_1_16;				s_cmp_3_16	<= 	s_3_16;					s_cmp_10_16	<= 	s_10_16 ;
			s_cmp_11_16 <= s_tmp_8_16 + s_3_16;	        s_cmp_2_16 <= s_tmp_2_16;   			s_cmp_5_16  <=  s_5_16;      			s_cmp_12_16  <= s_12_16 ;
			s_cmp_13_16 <= s_tmp_1_16 + s_12_16;	    s_cmp_4_16 <= s_tmp_4_16;   			s_cmp_6_16	<=  s_6_16;
			s_cmp_14_16 <= s_tmp_8_16 + s_6_16;		    s_cmp_8_16 <= s_tmp_8_16;   			s_cmp_9_16	<=  s_9_16;
			s_cmp_15_16 <= s_3_16 + s_12_16;
			
			v_remain := shift_right(s_r09,1);			
			s_quotient <= s_q09;
			s_remain <= v_remain;
			
					if v_remain > s_cmp_8_16 then
						if v_remain > s_cmp_12_16 then
							if v_remain > s_cmp_14_16 then
								if v_remain > s_cmp_15_16 then
									s_subfix <= 15;
								else 
									s_subfix <= 14;
								end if;
							else
								if v_remain > s_cmp_13_16 then
									s_subfix <= 13;
								else
									s_subfix <= 12;
								end if;
							end if;
						else
							if v_remain > s_cmp_10_16 then
								if v_remain > s_cmp_11_16 then
									s_subfix <= 11;
								else 
									s_subfix <= 10;
								end if;
							else
								if v_remain > s_cmp_9_16 then
									s_subfix <= 9;
								else
									s_subfix <= 8;
								end if;
							end if;
						end if;
					else
						if v_remain > s_cmp_4_16 then
							if v_remain > s_cmp_6_16 then
								if v_remain > s_cmp_7_16 then
									s_subfix <= 7;
								else 
									s_subfix <= 6;
								end if;
							else
								if v_remain > s_cmp_5_16 then
									s_subfix <= 5;
								else
									s_subfix <= 4;
								end if;
							end if;
						else
							if v_remain > s_cmp_2_16 then
								if v_remain > s_cmp_3_16 then
									s_subfix <= 3;
								else 
									s_subfix <= 2;
								end if;
							else
								if v_remain > s_cmp_1_16 then
									s_subfix <= 1;
								else
									s_subfix <= 0;
								end if;
							end if;
						end if;
					end if;
			end if;	
		end if;
	end process;
	
	ctl_path : process(clk, rst)
	begin
		if rst = '0' then	
			valid00 <= '0';			valid05 <=  '0';		
			valid01 <=  '0';        valid06 <=  '0';        
			valid02 <=  '0';        valid07 <=  '0';        
			valid03 <=  '0';        valid08 <=  '0';        
			valid04 <=  '0';        valid09 <=  '0';     
									s_out_valid	<= '0';	
		elsif rising_edge(clk) then					   
			valid00 <= s_in_valid;		valid05 <= valid04;		
			valid01 <= valid00;     	valid06 <= valid05;     
			valid02 <= valid01;         valid07 <= valid06;     
			valid03 <= valid02;         valid08 <= valid07;			
			valid04 <= valid03;         valid09 <= valid08;
										s_out_valid <= valid09;     
		end if;
	end process;	
	
	--subfix : process(clk, rst)
	--begin
	--	if rst = '0' then
	--		s_subfix <= (others => '0');
	--	elsif rising_edge(clk) then
	--		if s_r
	--	end if;
	--end process;
	
	div01: op_sub generic map(data_width => s_divisor'length )port map(clk,rst,s_q00,s_r00,s_d00,s_d01,s_q01,s_r01);
	div02: op_sub generic map(data_width => s_divisor'length )port map(clk,rst,s_q01,s_r01,s_d01,s_d02,s_q02,s_r02);
	div03: op_sub generic map(data_width => s_divisor'length )port map(clk,rst,s_q02,s_r02,s_d02,s_d03,s_q03,s_r03);
	div04: op_sub generic map(data_width => s_divisor'length )port map(clk,rst,s_q03,s_r03,s_d03,s_d04,s_q04,s_r04);
	div05: op_sub generic map(data_width => s_divisor'length )port map(clk,rst,s_q04,s_r04,s_d04,s_d05,s_q05,s_r05);
	div06: op_sub generic map(data_width => s_divisor'length )port map(clk,rst,s_q05,s_r05,s_d05,s_d06,s_q06,s_r06);
	div07: op_sub generic map(data_width => s_divisor'length )port map(clk,rst,s_q06,s_r06,s_d06,s_d07,s_q07,s_r07);
	div08: op_sub generic map(data_width => s_divisor'length )port map(clk,rst,s_q07,s_r07,s_d07,s_d08,s_q08,s_r08);
	div09: op_sub generic map(data_width => s_divisor'length )port map(clk,rst,s_q08,s_r08,s_d08,s_d09,s_q09,s_r09);	
	
end op_div;