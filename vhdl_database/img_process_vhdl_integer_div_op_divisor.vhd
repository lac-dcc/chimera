
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity op_divisor is
generic (
			constant data_width : integer := 8;
            constant addr_cnt	:integer := 20
);
port (
		clk : in std_logic;
		rst : in std_logic;
		
		Ix_in, Iy_in, It_in  : in std_logic_vector(data_width + 3 downto 0);		
		
		div ,qui,r : out std_logic_vector(data_width + 4 + data_width + 4 + 1  downto 0);
		
		
		in_data_addr : in std_logic_vector(addr_cnt -1 downto 0);		
		in_data_valid : in std_logic;
		out_data_addr : out std_logic_vector(addr_cnt -1 downto 0);
		out_data_valid : out std_logic
	  );
end op_divisor;

architecture op_divisor of op_divisor is
	signal s_Ix, s_Iy, s_It : signed(Ix_in'range);
	signal s_mul_xy, s_mul_xx,s_mul_yy, s_mul_xt, s_mul_yt : unsigned(Ix_in'length + Iy_in'length - 1 downto 0);
	signal s_add_xx_yy : unsigned(s_mul_xx'length downto 0);
	signal s_sum : unsigned(s_add_xx_yy'length downto 0);
	signal s_q00,s_q01,s_q02,s_q03,s_q04,s_q05,s_q06,s_q07,s_q08,s_q09,s_q10,s_q11,s_q12,s_q13,s_q14,s_q15,s_q16,s_q17,s_q18,s_q19,s_q20,s_q21,s_q22,s_q23, s_q24,s_q25,s_q26 ,s_q27: unsigned(s_sum'range);
	signal s_r00,s_r01,s_r02,s_r03,s_r04,s_r05,s_r06,s_r07,s_r08,s_r09,s_r10,s_r11,s_r12,s_r13,s_r14,s_r15,s_r16,s_r17,s_r18,s_r19,s_r20,s_r21,s_r22,s_r23, s_r24,s_r25,s_r26 ,s_r27: unsigned(s_sum'range);
	signal s_d00,s_d01,s_d02,s_d03,s_d04,s_d05,s_d06,s_d07,s_d08,s_d09,s_d10,s_d11,s_d12,s_d13,s_d14,s_d15,s_d16,s_d17,s_d18,s_d19,s_d20,s_d21,s_d22,s_d23, s_d24,s_d25,s_d26 ,s_d27: unsigned(s_sum'range);
	signal s_r000, s_div ,s_qui, s_rem: unsigned(s_r00'range);
	
	

begin
	s_Ix <= signed(Ix_in);
	s_Iy <= signed(Iy_in);
	s_It <= signed(It_in);
	
	div <= std_logic_vector(s_div);
	qui <= std_logic_vector(s_qui);
	r <= std_logic_vector(s_rem);
	
	s_r000 <= (others => '0');
	s_r00 <= s_r000 + 1;
	
	s_qui <= s_q27;
	s_rem <= shift_right(s_r27, 1);
	s_q00 <= (others => '0');
	
	step1 : process(clk, rst)
	begin
		if rst = '0' then
			s_mul_yy <= (others => '0');
			s_mul_xx <= (others => '0');
			--s_mul_xy <= (others => '0');
			--s_mul_xt <= (others => '0');
			--s_mul_yt <= (others => '0');
		elsif rising_edge(clk) then
			s_mul_yy <= unsigned(s_Iy * s_Iy);
			s_mul_xx <= unsigned(s_Ix * s_Ix);
			--s_mul_xy <= unsigned(s_Ix * s_Iy);
			--s_mul_xt <= unsigned(s_Ix * s_It);
			--s_mul_yt <= unsigned(s_It * s_Iy);
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
	
	
	data_path : process(clk, rst)
	begin
		if rst = '0' then
			s_d01 <= (others => '0'); 		s_d06 <= (others => '0');		s_d11 <= (others => '0');		s_d16 <= (others => '0');		s_d21 <= (others => '0');		s_d26 <= (others => '0');
			s_d02 <= (others => '0');       s_d07 <= (others => '0');       s_d12 <= (others => '0');       s_d17 <= (others => '0');       s_d22 <= (others => '0');       s_d27 <= (others => '0');
			s_d03 <= (others => '0');       s_d08 <= (others => '0');       s_d13 <= (others => '0');       s_d18 <= (others => '0');       s_d23 <= (others => '0');       
			s_d04 <= (others => '0');       s_d09 <= (others => '0');       s_d14 <= (others => '0');       s_d19 <= (others => '0');       s_d24 <= (others => '0');       
			s_d05 <= (others => '0');       s_d10 <= (others => '0');       s_d15 <= (others => '0');       s_d20 <= (others => '0');       s_d25 <= (others => '0');       
		elsif rising_edge(clk) then
			s_d01 <= s_sum;
			s_d02 <= s_d01;	s_d03 <= s_d02;	s_d04 <= s_d03;	s_d05 <= s_d04;	s_d06 <= s_d05;	s_d07 <= s_d06;	s_d08 <= s_d07;	s_d09 <= s_d08;	s_d10 <= s_d09; s_d11 <= s_d10;
			s_d12 <= s_d11;	s_d13 <= s_d12;	s_d14 <= s_d13;	s_d15 <= s_d14;	s_d16 <= s_d15;	s_d17 <= s_d16;	s_d18 <= s_d17;	s_d19 <= s_d18;	s_d20 <= s_d19; s_d21 <= s_d20;
			s_d22 <= s_d21; s_d23 <= s_d22; s_d24 <= s_d23; s_d25 <= s_d24; s_d26 <= s_d25; s_d27 <= s_d26; s_div <= s_d27;
		end if;
	end process;
	
	
--	s_d02 <= s_d01;	s_d03 <= s_d02;	s_d04 <= s_d03;	s_d05 <= s_d04;	s_d06 <= s_d05;	s_d07 <= s_d06;	s_d08 <= s_d07;	s_d09 <= s_d08;	s_d10 <= s_d09; s_d11 <= s_d10;
--	s_d12 <= s_d11;	s_d13 <= s_d12;	s_d14 <= s_d13;	s_d15 <= s_d14;	s_d16 <= s_d15;	s_d17 <= s_d16;	s_d18 <= s_d17;	s_d19 <= s_d18;	s_d20 <= s_d19; s_d21 <= s_d20;
--	s_d22 <= s_d21; s_d23 <= s_d22; s_d24 <= s_d23; s_d25 <= s_d24; s_d26 <= s_d25; s_d27 <= s_d26;
	
	
	 
	
	div01: process(clk, rst)
	variable tmp_sub : unsigned(s_r01'range);
	begin
		if rst = '0' then
			
			s_q01 <= (others => '0');
			s_r01 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r00 - s_d01;
			if s_r00 >= s_d01 then
				s_r01 <= shift_left(tmp_sub, 1);
				s_q01 <= s_q00(s_q00'length - 2 downto 0) & '1';
			else
				s_r01 <= shift_left(s_r00, 1);
				s_q01 <= s_q00(s_q00'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div02: process(clk, rst)
	variable tmp_sub : unsigned(s_r02'range);
	begin
		if rst = '0' then
			s_q02 <= (others => '0');
			s_r02 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r01 - s_d02;
			if s_r01 >= s_d02 then
				s_r02 <= shift_left(tmp_sub, 1);
				s_q02 <= s_q01(s_q01'length - 2 downto 0) & '1';
			else
				s_r02 <= shift_left(s_r01, 1);
				s_q02 <= s_q01(s_q01'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div03: process(clk, rst)
	variable tmp_sub : unsigned(s_r03'range);
	begin
		if rst = '0' then
			s_q03 <= (others => '0');
			s_r03 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r02 - s_d03;
			if s_r02 >= s_d03 then
				s_r03 <= shift_left(tmp_sub, 1);
				s_q03 <= s_q02(s_q02'length - 2 downto 0) & '1';
			else
				s_r03 <= shift_left(s_r02, 1);
				s_q03 <= s_q02(s_q02'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div04: process(clk, rst)
	variable tmp_sub : unsigned(s_r04'range);
	begin
		if rst = '0' then
			s_q04 <= (others => '0');
			s_r04 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r03 - s_d04;
			if s_r03 >= s_d04 then
				s_r04 <= shift_left(tmp_sub, 1);
				s_q04 <= s_q03(s_q03'length - 2 downto 0) & '1';
			else     
				s_r04 <= shift_left(s_r03, 1);
				s_q04 <= s_q03(s_q03'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div05: process(clk, rst)
	variable tmp_sub : unsigned(s_r05'range);
	begin
		if rst = '0' then
			s_q05 <= (others => '0');
			s_r05 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r04 - s_d05;
			if s_r04 >= s_d05 then
				s_r05 <= shift_left(tmp_sub, 1);
				s_q05 <= s_q04(s_q04'length - 2 downto 0) & '1';
			else     
				s_r05 <= shift_left(s_r04, 1);
				s_q05 <= s_q04(s_q04'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div06: process(clk, rst)
	variable tmp_sub : unsigned(s_r06'range);
	begin
		if rst = '0' then
			s_q06 <= (others => '0');
			s_r06 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r05 - s_d06;
			if s_r05 >= s_d06 then
				s_r06 <= shift_left(tmp_sub, 1);
				s_q06 <= s_q05(s_q05'length - 2 downto 0) & '1';
			else     
				s_r06 <= shift_left(s_r05, 1);
				s_q06 <= s_q05(s_q05'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div07: process(clk, rst)
	variable tmp_sub : unsigned(s_r07'range);
	begin
		if rst = '0' then
			s_q07 <= (others => '0');
			s_r07 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r06 - s_d07;
			if s_r06 >= s_d07 then
				s_r07 <= shift_left(tmp_sub, 1);
				s_q07 <= s_q06(s_q06'length - 2 downto 0) & '1';
			else     
				s_r07 <= shift_left(s_r06, 1);
				s_q07 <= s_q06(s_q06'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div08: process(clk, rst)
	variable tmp_sub : unsigned(s_r08'range);
	begin
		if rst = '0' then
			s_q08 <= (others => '0');
			s_r08 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r07 - s_d08;
			if s_r07 >= s_d08 then
				s_r08 <= shift_left(tmp_sub, 1);
				s_q08 <= s_q07(s_q07'length - 2 downto 0) & '1';
			else     
				s_r08 <= shift_left(s_r07, 1);
				s_q08 <= s_q07(s_q07'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div09: process(clk, rst)
	variable tmp_sub : unsigned(s_r09'range);
	begin
		if rst = '0' then
			s_q09 <= (others => '0');
			s_r09 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r08 - s_d09;
			if s_r08 >= s_d09 then
				s_r09 <= shift_left(tmp_sub, 1);
				s_q09 <= s_q08(s_q08'length - 2 downto 0) & '1';
			else     
				s_r09 <= shift_left(s_r08, 1);
				s_q09 <= s_q08(s_q08'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div10: process(clk, rst)
	variable tmp_sub : unsigned(s_r10'range);
	begin
		if rst = '0' then
			s_q10 <= (others => '0');
			s_r10 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r09 - s_d10;
			if s_r09 >= s_d10 then
				s_r10 <= shift_left(tmp_sub, 1);
				s_q10 <= s_q09(s_q09'length - 2 downto 0) & '1';
			else   
				s_r10 <= shift_left(s_r09, 1);
				s_q10 <= s_q09(s_q09'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div11: process(clk, rst)
	variable tmp_sub : unsigned(s_r11'range);
	begin
		if rst = '0' then
			s_q11 <= (others => '0');
			s_r11 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r10 - s_d11;
			if s_r10 >= s_d11 then
				s_r11 <= shift_left(tmp_sub, 1);
				s_q11 <= s_q10(s_q10'length - 2 downto 0) & '1';
			else    
				s_r11 <= shift_left(s_r10, 1);
				s_q11 <= s_q10(s_q10'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div12: process(clk, rst)
	variable tmp_sub : unsigned(s_r12'range);
	begin
		if rst = '0' then
			s_q12 <= (others => '0');
			s_r12 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r11 - s_d12;
			if s_r11 >= s_d12 then
				s_r12 <= shift_left(tmp_sub, 1);
				s_q12 <= s_q11(s_q11'length - 2 downto 0) & '1';
			else    
				s_r12 <= shift_left(s_r11, 1);
				s_q12 <= s_q11(s_q11'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div13: process(clk, rst)
	variable tmp_sub : unsigned(s_r13'range);
	begin
		if rst = '0' then
			s_q13 <= (others => '0');
			s_r13 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r12 - s_d13;
			if s_r12 >= s_d13 then
				s_r13 <= shift_left(tmp_sub, 1);
				s_q13 <= s_q12(s_q12'length - 2 downto 0) & '1';
			else    
				s_r13 <= shift_left(s_r12, 1);
				s_q13 <= s_q12(s_q12'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div14: process(clk, rst)
	variable tmp_sub : unsigned(s_r14'range);
	begin
		if rst = '0' then
			s_q14 <= (others => '0');
			s_r14 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r13 - s_d14;
			if s_r13 >= s_d14 then
				s_r14 <= shift_left(tmp_sub, 1);
				s_q14 <= s_q13(s_q13'length - 2 downto 0) & '1';
			else   
				s_r14 <= shift_left(s_r13, 1);
				s_q14 <= s_q13(s_q13'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div15: process(clk, rst)
	variable tmp_sub : unsigned(s_r15'range);
	begin
		if rst = '0' then
			s_q15 <= (others => '0');
			s_r15 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r14 - s_d15;
			if s_r14 >= s_d15 then
				s_r15 <= shift_left(tmp_sub, 1);
				s_q15 <= s_q14(s_q14'length - 2 downto 0) & '1';
			else    
				s_r15 <= shift_left(s_r14, 1);
				s_q15 <= s_q14(s_q14'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div16: process(clk, rst)
	variable tmp_sub : unsigned(s_r16'range);
	begin
		if rst = '0' then
			s_q16 <= (others => '0');
			s_r16 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r15 - s_d16;
			if s_r15 >= s_d16 then
				s_r16 <= shift_left(tmp_sub, 1);
				s_q16 <= s_q15(s_q15'length - 2 downto 0) & '1';
			else    
				s_r16 <= shift_left(s_r15, 1);
				s_q16 <= s_q15(s_q15'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div17: process(clk, rst)
	variable tmp_sub : unsigned(s_r17'range);
	begin
		if rst = '0' then
			s_q17 <= (others => '0');
			s_r17 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r16- s_d17;
			if s_r16 >= s_d17 then
				s_r17 <= shift_left(tmp_sub, 1);
				s_q17 <= s_q16(s_q16'length - 2 downto 0) & '1';
			else    
				s_r17 <= shift_left(s_r16, 1);
				s_q17 <= s_q16(s_q16'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div18: process(clk, rst)
	variable tmp_sub : unsigned(s_r18'range);
	begin
		if rst = '0' then
			s_q18 <= (others => '0');
			s_r18 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r17 - s_d18;
			if s_r17 >= s_d18 then
				s_r18 <= shift_left(tmp_sub, 1);
				s_q18 <= s_q17(s_q17'length - 2 downto 0) & '1';
			else    
				s_r18 <= shift_left(s_r17, 1);
				s_q18 <= s_q17(s_q17'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div19: process(clk, rst)
	variable tmp_sub : unsigned(s_r19'range);
	begin
		if rst = '0' then
			s_q19 <= (others => '0');
			s_r19 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r18 - s_d19;
			if s_r18 >= s_d19 then
				s_r19 <= shift_left(tmp_sub, 1);
				s_q19 <= s_q18(s_q18'length - 2 downto 0) & '1';
			else    
				s_r19 <= shift_left(s_r18, 1);
				s_q19 <= s_q18(s_q18'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div20: process(clk, rst)
	variable tmp_sub : unsigned(s_r20'range);
	begin
		if rst = '0' then
			s_q20 <= (others => '0');
			s_r20 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r19 - s_d20;
			if s_r19 >= s_d20 then
				s_r20 <= shift_left(tmp_sub, 1);
				s_q20 <= s_q19(s_q19'length - 2 downto 0) & '1';
			else    
				s_r20 <= shift_left(s_r19, 1);
				s_q20 <= s_q19(s_q19'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div21: process(clk, rst)
	variable tmp_sub : unsigned(s_r21'range);
	begin
		if rst = '0' then
			s_q21 <= (others => '0');
			s_r21 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r20 - s_d21;
			if s_r20 >= s_d21 then
				s_r21 <= shift_left(tmp_sub, 1);
				s_q21 <= s_q20(s_q20'length - 2 downto 0) & '1';
			else    
				s_r21 <= shift_left(s_r20, 1);
				s_q21 <= s_q20(s_q20'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div22: process(clk, rst)
	variable tmp_sub : unsigned(s_r22'range);
	begin
		if rst = '0' then
			s_q22 <= (others => '0');
			s_r22 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r21 - s_d22;
			if s_r21 >= s_d22 then
				s_r22 <= shift_left(tmp_sub, 1);
				s_q22 <= s_q21(s_q21'length - 2 downto 0) & '1';
			else      
				s_r22 <= shift_left(s_r21, 1);
				s_q22 <= s_q21(s_q21'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div23: process(clk, rst)
	variable tmp_sub : unsigned(s_r23'range);
	begin
		if rst = '0' then
			s_q23 <= (others => '0');
			s_r23 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r22 - s_d23;
			if s_r22 >= s_d23 then
				s_r23 <= shift_left(tmp_sub, 1);
				s_q23 <= s_q22(s_q22'length - 2 downto 0) & '1';
			else     
				s_r23 <= shift_left(s_r22, 1);
				s_q23 <= s_q22(s_q22'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div24: process(clk, rst)
	variable tmp_sub : unsigned(s_r24'range);
	begin
		if rst = '0' then
			s_q24 <= (others => '0');
			s_r24 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r23 - s_d24;
			if s_r23 >= s_d24 then
				s_r24 <= shift_left(tmp_sub, 1);
				s_q24 <= s_q23(s_q23'length - 2 downto 0) & '1';
			else     
				s_r24 <= shift_left(s_r23, 1);
				s_q24 <= s_q23(s_q23'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	
	div25: process(clk, rst)
	variable tmp_sub : unsigned(s_r25'range);
	begin
		if rst = '0' then
			s_q25 <= (others => '0');
			s_r25 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r24 - s_d25;
			if s_r24 >= s_d25 then
				s_r25 <= shift_left(tmp_sub, 1);
				s_q25 <= s_q24(s_q24'length - 2 downto 0) & '1';
			else     
				s_r25 <= shift_left(s_r24, 1);
				s_q25 <= s_q24(s_q24'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div26: process(clk, rst)
	variable tmp_sub : unsigned(s_r26'range);
	begin
		if rst = '0' then
			s_q26 <= (others => '0');
			s_r26 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r25 - s_d26;
			if s_r25 >= s_d26 then
				s_r26 <= shift_left(tmp_sub, 1);
				s_q26 <= s_q25(s_q25'length - 2 downto 0) & '1';
			else     
				s_r26 <= shift_left(s_r25, 1);
				s_q26 <= s_q25(s_q25'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
	div27: process(clk, rst)
	variable tmp_sub : unsigned(s_r27'range);
	begin
		if rst = '0' then
			s_q27 <= (others => '0');
			s_r27 <= (others => '0');
		elsif rising_edge(clk) then
			tmp_sub := s_r26 - s_d27;
			if s_r26 >= s_d27 then
				s_r27 <= shift_left(tmp_sub, 1);
				s_q27 <= s_q26(s_q26'length - 2 downto 0) & '1';
			else     
				s_r27 <= shift_left(s_r26, 1);
				s_q27 <= s_q26(s_q26'length - 2 downto 0) & '0';
			end if;
		end if;
	end process;
	
end op_divisor;