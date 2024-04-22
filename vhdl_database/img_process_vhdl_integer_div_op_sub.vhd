library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity op_sub is
generic (
			constant data_width : integer := 8;
			constant addr_cnt	:integer := 20
);
port (
		clk : in std_logic;
		rst : in std_logic;	
		--valid_in : in std_logic;
		--valid_out: out std_logic;		
		q0,r0,d0 : in unsigned(data_width - 1 downto 0);
		d1,q1, r1: out unsigned(data_width - 1 downto 0)		
	);
end op_sub;

architecture op_sub of op_sub is
	signal s_q0, s_r0, s_d0, s_d1, s_q1, s_r1 : unsigned(data_width - 1 downto 0);
	--signal s_valid_in, s_valid_out : std_logic;
begin
	
	s_q0 <=  q0 ;
	s_r0 <=  r0 ;
	s_d0 <=  d0 ;
	--s_valid_in <= valid_in;
	
	
	q1 <=  s_q1 ;
	r1 <=  s_r1 ;
	d1 <=  s_d1;
	--valid_out <= s_valid_out;

	process(clk, rst)
	variable tmp_sub : unsigned(s_r0'range);
	begin
		if rst = '0' then			
			s_q1 <= (others => '0');
			s_r1 <= (others => '0');
			s_d1 <= (others => '0');
			--s_valid_out <= '0';
		elsif rising_edge(clk) then
			tmp_sub := s_r0 - s_d0;
			if s_r0 >= s_d0 then
				s_r1 <= shift_left(tmp_sub, 1);
				s_q1 <= s_q0(s_q0'length - 2 downto 0) & '1';
			else
				s_r1 <= shift_left(s_r0, 1);
				s_q1 <= s_q0(s_q0'length - 2 downto 0) & '0';
			end if;
			
			s_d1 <= s_d0;
			--s_valid_out <= s_valid_in;
		end if;
	end process;
end op_sub;