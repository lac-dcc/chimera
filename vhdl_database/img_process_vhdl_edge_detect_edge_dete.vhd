library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity edge_dete is
generic (
			constant data_width : integer := 8;
            constant addr_cnt	:integer := 20
);
port (
		clk : in std_logic;
		rst : in std_logic;
		r33, r32, r31, r23,r22,r21,r13,r12,r11 : in std_logic_vector(data_width-1 downto 0);
		in_data_valid : in std_logic;
		out_data_valid : out std_logic;
		dout : out std_logic_vector(data_width-1 downto 0)
	  );
end edge_dete;

architecture gaussian of edge_dete is

	signal s_in_addr : std_logic_vector(addr_cnt -1 downto 0);
	signal s_out_addr : std_logic_vector(addr_cnt -1 downto 0);
	signal s_dout : std_logic_vector(data_width - 1 downto 0);
	
	signal s_in_valid: std_logic;
	signal s_out_valid: std_logic;
	signal s_r33, s_r32, s_r31, s_r23,s_r22,s_r21,s_r13,s_r12,s_r11 : integer range -4095 to 4095;
	
	
	signal s_step1_out_1, s_step1_out_2, s_step1_out_3 :integer range -4095 to 4095;
	signal s_step2_out_1, s_step2_out_2: integer range -4095 to 4095;
	signal s_step3_out_1  : integer range -4095 to 4095;
	signal s_step4_out_1  : integer range -4095 to 4095;
	signal valid_step1, valid_step2, valid_step3, valid_step4 : std_logic;
	signal addr_step1, addr_step2, addr_step3, addr_step4: std_logic_vector(addr_cnt -1 downto 0);
	
begin
	--external module input signal
	s_r11	<=	conv_integer(r11) ;
	s_r12	<=	conv_integer(r12) ;
	s_r13	<=	conv_integer(r13) ;
	s_r21	<=	conv_integer(r21) ;
	s_r22	<=	conv_integer(r22) ;
	s_r23	<=	conv_integer(r23) ;
	s_r31	<=	conv_integer(r31) ;
	s_r32	<=	conv_integer(r32) ;
	s_r33	<=	conv_integer(r33) ;
	

	s_in_valid <= in_data_valid;
		
	--external module output signal
	out_data_valid <= s_out_valid;	
	dout	<=	s_dout;	
	s_out_valid <= valid_step4;
	
	--internal module signal
	s_dout <= conv_std_logic_vector(s_step4_out_1, data_width );
		
	--dege detector
	--	|1 0 -1|
	--	|1 0 -1|	
	--	|1 0 -1|
	
	valid_pro: process(clk ,rst)
	begin
		if rst = '0' then
			valid_step1 <= '0';	     addr_step1 <= (others => '0');
			valid_step2 <= '0';      addr_step2 <= (others => '0');
			valid_step3 <= '0';      addr_step3 <= (others => '0');
			valid_step4 <= '0';      addr_step4 <= (others => '0');
		elsif rising_edge(clk) then
			valid_step1 <= s_in_valid;   addr_step1 <= s_in_addr;
			valid_step2 <= valid_step1;  addr_step2 <= addr_step1;
			valid_step3 <= valid_step2;  addr_step3 <= addr_step2;
			valid_step4 <= valid_step3;  addr_step4 <= addr_step3;
		end if;                                        
	end process;
	
	step1: process(clk, rst)
	begin
		if rst = '0' then
			s_step1_out_1 <= 0;
			s_step1_out_2 <= 0;
			s_step1_out_3 <= 0;
		elsif rising_edge(clk) then
			s_step1_out_1 <=  s_r13 - s_r11;
			s_step1_out_2 <=  s_r23 - s_r21;
			s_step1_out_3 <=  s_r33 - s_r31;
		end if;
	end process;
	
	step2: process(clk, rst)
	begin
		if rst = '0' then
			s_step2_out_1 <= 0;
			s_step2_out_2 <= 0;
		elsif rising_edge(clk) then			
			s_step2_out_1 <= s_step1_out_1 + s_step1_out_2;
			s_step2_out_2 <= s_step1_out_3;
		end if;
	end process;

	
	step3: process(clk, rst)
	begin
		if rst = '0' then
			s_step3_out_1 <= 0;	
		elsif rising_edge(clk) then
			s_step3_out_1 <= s_step2_out_1 + s_step2_out_2;		
		end if;
	end process;
	
	step4: process(clk, rst)
	begin
		if rst = '0' then
			s_step4_out_1 <=0;	
		elsif rising_edge(clk) then			
			if s_step3_out_1 > 255 then
				s_step4_out_1 <= 255;
			elsif s_step3_out_1 < 0 then
				s_step4_out_1 <= 0;
			else
				s_step4_out_1 <= s_step3_out_1;
			end if;
		end if;
	end process;
end gaussian;
