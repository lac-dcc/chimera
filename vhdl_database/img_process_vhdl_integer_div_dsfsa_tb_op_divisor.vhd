----------------------------------------------------------------------------
-- tb_op_divisor.vhd
--
-- section 9.2.3 srt dividers
--
-- test bench for sequential division
-- generates num_sim random cases
--
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all; --for signed operands
use std.textio.all;
use work.txt_util.all;
entity tb_op_divisor is 
generic (
				constant data_width : integer := 8;
				constant addr_cnt	:integer := 20
	);
end tb_op_divisor;

architecture test of tb_op_divisor is
	file result: text open write_mode is "result.dat";
  constant clk_period : time := 10 ns;
   signal s_Ix_in, s_Iy_in, s_It_in : std_logic_vector(data_width + 3 downto 0);
	signal s_in_data_addr : std_logic_vector(addr_cnt - 1 downto 0);
	signal s_in_data_valid : std_logic ;
	signal clk, rst : std_logic;
	signal s_r000, s_div ,s_qui, s_rem: std_logic_vector(data_width + 4 + data_width + 4 + 1   downto 0);
	signal s_u,s_v: std_logic_vector(data_width + data_width -1 downto 0);
    component op_divisor is
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
	end component;
	
	component op_div is
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
	end component;
	
begin
--	 divisor : op_divisor port map (
--        clk => clk,       
--        rst => rst,
--		Ix_in => s_Ix_in,
--		Iy_in => s_Iy_in,
--		It_in => s_It_in,
--		div => s_div,
--		r => s_rem,
--		qui => s_qui,
--		in_data_valid => s_in_data_valid,
--		in_data_addr => s_in_data_addr
--        );
		
		divisor2 : op_div port map (
        clk => clk,       
        rst => rst,
		Ix_in => s_Ix_in,
		Iy_in => s_Iy_in,
		It_in => s_It_in,
		r => s_rem,
		qui => s_qui,
		u => s_u,
		v => s_v,
		in_data_valid => s_in_data_valid,
		in_data_addr => s_in_data_addr
        );
	  -- clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	rst_process: process
	begin
		rst <= '0';
		wait for clk_period * 10;
		rst <= '1';
		wait;
	end process;
	
	valid: process(clk , rst)
	variable cnt : natural := 0;
	begin
		if rst = '0' then
			s_in_data_valid <= '0';
		elsif rising_edge(clk) then
			
			cnt := cnt + 1;
			if cnt > 2000 then
				s_in_data_valid <= '0';
			else
				s_in_data_valid <= '1';
			end if;
		end if;
	end process;
	
--	s_Ix_in <= x"00a";
--	s_Iy_in <= x"003";

	
	
	din: process(clk , rst)
	 variable outline : line;
	begin
		if rst = '0' then
			s_Ix_in <= x"00a";
			s_Iy_in <= x"003";
			s_It_in <= x"0ab";
		elsif rising_edge(clk) then
			s_Ix_in <= s_Ix_in + 1;
			s_Iy_in <= s_Iy_in + 1;
			s_It_in <= s_It_in + 1;
			write(outline, str(s_qui)&"   "&str(s_rem) &"     "&str(s_u) &"  " &str(s_v));
			writeline(result, outline);
		end if;
	end process;
end test;