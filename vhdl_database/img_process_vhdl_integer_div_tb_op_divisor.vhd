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

	signal clk, rst : std_logic;
	signal s_dividend, s_divisor : std_logic_vector(data_width - 1 downto 0);
	signal s_quotient, s_remain : std_logic_vector(data_width - 1 downto 0);
	signal s_in_valid , s_out_valid : std_logic;
	

	component op_div is
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
	end component;
	
begin
		
		divisor : op_div port map (
			clk => clk,       
			rst => rst,
			
			dividend => s_dividend,
			divisor => s_divisor,
			remain => s_remain,
			quotient => s_quotient,
			in_valid => s_in_valid,
			out_valid => s_out_valid
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
			s_in_valid <= '0';
			s_divisor <= x"02";
			s_dividend <= x"00";
		elsif rising_edge(clk) then

			s_in_valid <= '1';
			if(s_in_valid = '1') then
				s_divisor <= s_divisor + x"01";
			end if;
		end if;
	end process;

	
	
	--din: process(clk , rst)
	-- variable outline : line;
	--begin
	--	if rst = '0' then			
	--		s_divisor <= x"23";
	--	elsif rising_edge(clk) then
	--		s_divisor <= s_divisor + x"04";
	--	end if;
	--end process;
end test;