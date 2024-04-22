
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity op_div is
generic (
			constant data_width : integer := 8;
            constant addr_cnt	:integer := 20
);
port (
		clk : in std_logic;
		rst : in std_logic;
		
		Ix_in, Iy_in, It_in  : in std_logic_vector(data_width + 3 downto 0);		
		
		qui,r : out std_logic_vector(data_width + 4 + data_width + 4 + 1  downto 0);		
		u,v: out std_logic_vector(data_width + data_width -1 downto 0);
		in_data_addr : in std_logic_vector(addr_cnt -1 downto 0);		
		in_data_valid : in std_logic;
		out_data_addr : out std_logic_vector(addr_cnt -1 downto 0);
		out_data_valid : out std_logic
	  );
end op_div;

architecture op_div of op_div is
	signal s_Ix, s_Iy, s_It : signed(Ix_in'range);
	signal  s_mul_xx, s_mul_yy : unsigned(Ix_in'length + Iy_in'length - 1 downto 0);	
	signal s_add_xx_yy : unsigned(s_mul_xx'length downto 0);
	signal s_sum : unsigned(s_add_xx_yy'length downto 0);
	signal s_r000, s_div ,s_qui, s_rem: unsigned(s_sum'range);
	signal s_qui_out0, s_rem_out0: unsigned(s_sum'range);
	signal s_qui_out1, s_rem_out1: unsigned(s_sum'range);
	signal s_qui_out, s_rem_out: unsigned(s_sum'range);
	signal s_in_data_valid, s_out_data_valid : std_logic;
	signal s_u, s_v : signed(u'range);
	
	signal s_mul_xy, s_mul_xt, s_mul_yt : signed(Ix_in'length + Iy_in'length - 1 downto 0);
	signal s_mul_xt_q, s_mul_xt_r : signed(s_mul_xt'length + s_qui'length  downto 0);
	signal s_mul_yt_q, s_mul_yt_r : signed(s_mul_yt'length + s_qui'length  downto 0);
	signal s_tmp_u1,s_tmp_u2: signed(s_mul_xt_q'length downto 0);
	signal s_tmp_v1,s_tmp_v2: signed(s_mul_yt_q'length downto 0);
	
	signal x00,x01,x02,x03,x04,x05,x06,x07,x08,x09,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32 : signed(Ix_in'range);
	signal y00,y01,y02,y03,y04,y05,y06,y07,y08,y09,y10,y11,y12,y13,y14,y15,y16,y17,y18,y19,y20,y21,y22,y23,y24,y25,y26,y27,y28,y29,y30,y31,y32 : signed(Iy_in'range);
	signal t00,t01,t02,t03,t04,t05,t06,t07,t08,t09,t10,t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32 : signed(It_in'range);
	signal s_q00,s_q01,s_q02,s_q03,s_q04,s_q05,s_q06,s_q07,s_q08,s_q09,s_q10,s_q11,s_q12,s_q13,s_q14,s_q15,s_q16,s_q17,s_q18,s_q19,s_q20,s_q21,s_q22,s_q23, s_q24,s_q25,s_q26 ,s_q27: unsigned(s_sum'range);
	signal s_r00,s_r01,s_r02,s_r03,s_r04,s_r05,s_r06,s_r07,s_r08,s_r09,s_r10,s_r11,s_r12,s_r13,s_r14,s_r15,s_r16,s_r17,s_r18,s_r19,s_r20,s_r21,s_r22,s_r23, s_r24,s_r25,s_r26 ,s_r27: unsigned(s_sum'range);
	signal s_d00,s_d01,s_d02,s_d03,s_d04,s_d05,s_d06,s_d07,s_d08,s_d09,s_d10,s_d11,s_d12,s_d13,s_d14,s_d15,s_d16,s_d17,s_d18,s_d19,s_d20,s_d21,s_d22,s_d23, s_d24,s_d25,s_d26 ,s_d27: unsigned(s_sum'range);
	signal valid_in,valid00,valid01,valid02,valid03,valid04,valid05,valid06,valid07,valid08,valid09,valid10,valid11,valid12,valid13,valid14,valid15,valid16,valid17,valid18,valid19,valid20,valid21,valid22,valid23, valid24,valid25,valid26 ,valid27 ,valid28,valid29,valid30,valid31,valid32: std_logic;
	
	
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
	s_Ix <= signed(Ix_in);
	s_Iy <= signed(Iy_in);
	s_It <= signed(It_in);
	
--	div <= std_logic_vector(s_div);
	qui <= std_logic_vector(s_qui_out);
	r <= std_logic_vector(s_rem_out);
	
	s_r000 <= (others => '0');
	s_r00 <= s_r000 + 1;
	s_q00 <= (others => '0');
	
	s_qui <= s_q27;
	s_rem <= shift_right(s_r27, 1);	
	s_div <= s_d27;
	
	u <= std_logic_vector(s_u);
	v <= std_logic_vector(s_v);
	
	s_u <= resize(s_tmp_u2, s_u'length);
	s_v <= resize(s_tmp_v2, s_v'length);
	
	s_d00 <= s_sum;
	
	s_in_data_valid <= in_data_valid;	
	valid_in  <= s_in_data_valid;
	out_data_valid <= s_out_data_valid;	
	s_out_data_valid <= valid32;
	step1 : process(clk, rst)
	begin
		if rst = '0' then
			s_mul_yy <= (others => '0');
			s_mul_xx <= (others => '0');
		elsif rising_edge(clk) then
			s_mul_yy <= unsigned(s_Iy * s_Iy);
			s_mul_xx <= unsigned(s_Ix * s_Ix);
		end if;
	end process;
	
	step2 : process(clk, rst)
	begin
		if rst = '0' then
			s_add_xx_yy <= (others => '0');
		elsif rising_edge(clk) then
			s_add_xx_yy <= resize(s_mul_xx + s_mul_yy, s_add_xx_yy'length);
		end if;
	end process;
	
	step3 : process(clk, rst)
	begin
		if rst = '0' then
			s_sum <= (others => '0');
		elsif rising_edge(clk) then
			s_sum <= resize(s_add_xx_yy + 16, s_sum'length);
		end if;
	end process;	
	
	
	ctl_path : process(clk, rst)
	begin
		if rst = '0' then	
			valid00 <=  '0';		valid05 <=  '0';		valid10 <=  '0';		valid15 <=  '0';	valid20 <=  '0';	valid25 <=  '0';	valid30 <=  '0';
			valid01 <=  '0';        valid06 <=  '0';        valid11 <=  '0';        valid16 <=  '0';    valid21 <=  '0';    valid26 <=  '0';	valid31 <=  '0';
			valid02 <=  '0';        valid07 <=  '0';        valid12 <=  '0';        valid17 <=  '0';    valid22 <=  '0';    valid27 <=  '0';	valid32 <=  '0';
			valid03 <=  '0';        valid08 <=  '0';        valid13 <=  '0';        valid18 <=  '0';    valid23 <=  '0';	valid28 <=  '0';
			valid04 <=  '0';        valid09 <=  '0';        valid14 <=  '0';        valid19 <=  '0';    valid24 <=  '0';	valid29 <=  '0';		
		elsif rising_edge(clk) then					
			valid00 <= valid_in;		valid05 <= valid04;		valid10 <= valid09;		valid15 <= valid14;		valid20 <= valid19;		valid25 <= valid24;		valid30	<= valid29;
			valid01 <= valid00;         valid06 <= valid05;     valid11 <= valid10;     valid16 <= valid15;     valid21 <= valid20;     valid26 <= valid25;		valid31 <= valid30;
			valid02 <= valid01;         valid07 <= valid06;     valid12 <= valid11;     valid17 <= valid16;     valid22 <= valid21;     valid27 <= valid26;		valid32	<= valid31;
			valid03 <= valid02;         valid08 <= valid07;     valid13 <= valid12;     valid18 <= valid17;     valid23 <= valid22;		valid28 <= valid27;
			valid04 <= valid03;         valid09 <= valid08;     valid14 <= valid13;     valid19 <= valid18;     valid24 <= valid23;		valid29 <= valid28;
		end if;
	end process;
	
	
	data_path : process(clk, rst)
		variable shift_len : natural := qui'length;--26
		variable sum_len : natural := s_tmp_u1'length;
	begin
		if rst = '0' then
			x00 <= (others => '0');
			x01 <= (others => '0'); 	 x06 <= (others => '0');	   x11 <= (others => '0');		 x16 <= (others => '0');	   x21 <= (others => '0');		 x26 <= (others => '0');	x31 <= (others => '0');
			x02 <= (others => '0');      x07 <= (others => '0');       x12 <= (others => '0');       x17 <= (others => '0');       x22 <= (others => '0');       x27 <= (others => '0');	x32 <= (others => '0');
			x03 <= (others => '0');      x08 <= (others => '0');       x13 <= (others => '0');       x18 <= (others => '0');       x23 <= (others => '0');       x28 <= (others => '0');
			x04 <= (others => '0');      x09 <= (others => '0');       x14 <= (others => '0');       x19 <= (others => '0');       x24 <= (others => '0');       x29 <= (others => '0');
			x05 <= (others => '0');      x10 <= (others => '0');       x15 <= (others => '0');       x20 <= (others => '0');       x25 <= (others => '0');       x30 <= (others => '0');			
			y00 <= (others => '0');
			y01 <= (others => '0'); 	 y06 <= (others => '0');	   y11 <= (others => '0');		 y16 <= (others => '0');	   y21 <= (others => '0');		 y26 <= (others => '0');	y31 <= (others => '0');
			y02 <= (others => '0');      y07 <= (others => '0');       y12 <= (others => '0');       y17 <= (others => '0');       y22 <= (others => '0');       y27 <= (others => '0');	y32 <= (others => '0');
			y03 <= (others => '0');      y08 <= (others => '0');       y13 <= (others => '0');       y18 <= (others => '0');       y23 <= (others => '0');       y28 <= (others => '0');
			y04 <= (others => '0');      y09 <= (others => '0');       y14 <= (others => '0');       y19 <= (others => '0');       y24 <= (others => '0');       y29 <= (others => '0');
			y05 <= (others => '0');      y10 <= (others => '0');       y15 <= (others => '0');       y20 <= (others => '0');       y25 <= (others => '0');       y30 <= (others => '0');	
			t00 <= (others => '0');
			t01 <= (others => '0'); 	 t06 <= (others => '0');	   t11 <= (others => '0');		 t16 <= (others => '0');	   t21 <= (others => '0');		 t26 <= (others => '0');	t31 <= (others => '0');
			t02 <= (others => '0');      t07 <= (others => '0');       t12 <= (others => '0');       t17 <= (others => '0');       t22 <= (others => '0');       t27 <= (others => '0');	t32 <= (others => '0');
			t03 <= (others => '0');      t08 <= (others => '0');       t13 <= (others => '0');       t18 <= (others => '0');       t23 <= (others => '0');       t28 <= (others => '0');
			t04 <= (others => '0');      t09 <= (others => '0');       t14 <= (others => '0');       t19 <= (others => '0');       t24 <= (others => '0');       t29 <= (others => '0');
			t05 <= (others => '0');      t10 <= (others => '0');       t15 <= (others => '0');       t20 <= (others => '0');       t25 <= (others => '0'); 		 t30 <= (others => '0');

			s_qui_out0 <= (others => '0');	s_rem_out0 <= (others => '0');
			s_qui_out1 <= (others => '0');	s_rem_out1 <= (others => '0');
			s_qui_out <= (others => '0');	s_rem_out <= (others => '0');
			
			s_mul_xt	<= (others => '0'); s_mul_yt	<= (others => '0'); 
			s_mul_xt_q	<= (others => '0'); s_mul_xt_r	<= (others => '0');			
			s_mul_yt_q	<= (others => '0'); s_mul_yt_r	<= (others => '0');					
			
		elsif rising_edge(clk) then	
			x00 <= s_Ix; x01 <= x00;											y00 <= s_Iy;y01 <= y00;											t00 <= s_It;t01 <= t00;		
			x02 <= x01;	x03 <= x02;	x04 <= x03;	x05 <= x04;	x06 <= x05;	        y02 <= y01;	y03 <= y02;	y04 <= y03;	y05 <= y04;	y06 <= y05;     t02 <= t01;	t03 <= t02;	t04 <= t03;	t05 <= t04;	t06 <= t05;
			x07 <= x06;	x08 <= x07;	x09 <= x08;	x10 <= x09; x11 <= x10;         y07 <= y06;	y08 <= y07;	y09 <= y08;	y10 <= y09; y11 <= y10;     t07 <= t06;	t08 <= t07;	t09 <= t08;	t10 <= t09; t11 <= t10;
			x12 <= x11;	x13 <= x12;	x14 <= x13;	x15 <= x14;	x16 <= x15;         y12 <= y11;	y13 <= y12;	y14 <= y13;	y15 <= y14;	y16 <= y15;     t12 <= t11;	t13 <= t12;	t14 <= t13;	t15 <= t14;	t16 <= t15;
			x17 <= x16;	x18 <= x17;	x19 <= x18;	x20 <= x19; x21 <= x20;         y17 <= y16;	y18 <= y17;	y19 <= y18;	y20 <= y19; y21 <= y20;     t17 <= t16;	t18 <= t17;	t19 <= t18;	t20 <= t19; t21 <= t20;
			x22 <= x21; x23 <= x22; x24 <= x23; x25 <= x24; x26 <= x25;         y22 <= y21; y23 <= y22; y24 <= y23; y25 <= y24; y26 <= y25;     t22 <= t21; t23 <= t22; t24 <= t23; t25 <= t24; t26 <= t25;
			x27 <= x26; x28 <= x27; x29 <= x28; x30 <= x29; x31 <= x30;         y27 <= y26; y28 <= y27; y29 <= y28; y30 <= y29; y31 <= y30;     t27 <= t26; t28 <= t27; t29 <= t28; t30 <= t29; t31 <= t30; 
			x32 <= x31; 														y32 <= y31; 													t32 <= t31; 		
				
			s_qui_out0 	<= s_qui;		s_rem_out0	 <= s_rem;
			s_qui_out1	<= s_qui_out0;	s_rem_out1	 <= s_rem_out0;
			s_qui_out	<= s_qui_out1;	s_rem_out	 <= s_rem_out1;			
		
			s_mul_xt	<= x28 * t28;							
			s_mul_xt_q	<= s_mul_xt * signed('0'&s_qui);
			s_mul_xt_r	<= s_mul_xt * signed('0'&s_rem);
			s_tmp_u1 <= resize(s_mul_xt_q, sum_len) + resize(shift_right(s_mul_xt_r, shift_len), sum_len);
			s_tmp_u2 <= shift_right(s_tmp_u1, shift_len - 7);
			
			
			s_mul_yt	<= y28 * t28;
			s_mul_yt_q	<= s_mul_yt * signed('0'&s_qui);
			s_mul_yt_r	<= s_mul_yt * signed('0'&s_rem);
			s_tmp_v1 <= resize(s_mul_yt_q, sum_len) + resize(shift_right(s_mul_yt_r, shift_len), sum_len);
			s_tmp_v2 <= shift_right(s_tmp_v1, shift_len - 7);
		end if;
	end process;
	
	
	div01: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q00,s_r00,s_d00,s_d01,s_q01,s_r01);
	div02: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q01,s_r01,s_d01,s_d02,s_q02,s_r02);
	div03: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q02,s_r02,s_d02,s_d03,s_q03,s_r03);
	div04: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q03,s_r03,s_d03,s_d04,s_q04,s_r04);
	div05: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q04,s_r04,s_d04,s_d05,s_q05,s_r05);
	div06: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q05,s_r05,s_d05,s_d06,s_q06,s_r06);
	div07: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q06,s_r06,s_d06,s_d07,s_q07,s_r07);
	div08: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q07,s_r07,s_d07,s_d08,s_q08,s_r08);
	div09: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q08,s_r08,s_d08,s_d09,s_q09,s_r09);
	div10: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q09,s_r09,s_d09,s_d10,s_q10,s_r10);
	div11: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q10,s_r10,s_d10,s_d11,s_q11,s_r11);
	div12: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q11,s_r11,s_d11,s_d12,s_q12,s_r12);
	div13: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q12,s_r12,s_d12,s_d13,s_q13,s_r13);
	div14: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q13,s_r13,s_d13,s_d14,s_q14,s_r14);
	div15: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q14,s_r14,s_d14,s_d15,s_q15,s_r15);
	div16: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q15,s_r15,s_d15,s_d16,s_q16,s_r16);
	div17: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q16,s_r16,s_d16,s_d17,s_q17,s_r17);
	div18: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q17,s_r17,s_d17,s_d18,s_q18,s_r18);
	div19: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q18,s_r18,s_d18,s_d19,s_q19,s_r19);
	div20: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q19,s_r19,s_d19,s_d20,s_q20,s_r20);
	div21: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q20,s_r20,s_d20,s_d21,s_q21,s_r21);
	div22: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q21,s_r21,s_d21,s_d22,s_q22,s_r22);
	div23: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q22,s_r22,s_d22,s_d23,s_q23,s_r23);
	div24: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q23,s_r23,s_d23,s_d24,s_q24,s_r24);
	div25: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q24,s_r24,s_d24,s_d25,s_q25,s_r25);
	div26: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q25,s_r25,s_d25,s_d26,s_q26,s_r26);
	div27: op_sub generic map(data_width => s_div'length )port map(clk,rst,s_q26,s_r26,s_d26,s_d27,s_q27,s_r27);	
	
end op_div;