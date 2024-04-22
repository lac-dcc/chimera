----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:59 09/30/2014 
-- Design Name: 
-- Module Name:    ADCS7476_ctrl - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADCS7476_ctrl is
generic(clk_period_ns : positive := 10;
		  sclk_period_ns : positive := 40;
		  time_between_sample_ns : positive :=20_833);
port(
	clk, resetn : in std_logic;
	sclk, ss : out std_logic ;
	miso : in std_logic ;
	sample_out : out std_logic_vector(11 downto 0);
	sample_valid : out std_logic 
);
end ADCS7476_ctrl;

architecture Behavioral of ADCS7476_ctrl is

constant divider_modulo : positive := ((sclk_period_ns/clk_period_ns)/2)-1 ;
constant tick_between_samples : positive := (time_between_sample_ns/sclk_period_ns);
type com_state is (WAIT_SAMPLE, ASSERT_SS, SCLK_LOW, SCLK_HIGH, DEASSERT_SS);
signal cur_state, next_state : com_state ;
signal bit_counter : std_logic_vector(15 downto 0);
signal bit_counter_en, bit_counter_reset : std_logic ;
signal clk_divider : std_logic_vector(15 downto 0);
signal end_divider : std_logic ;
signal shift_in : std_logic ;
signal data_reg : std_logic_vector(15 downto 0);


signal ss_comb, sclk_comb, miso_latched : std_logic ;

begin

process(clk, resetn)
begin
if resetn = '0' then
	clk_divider <= std_logic_vector(to_unsigned(divider_modulo, 16));
elsif clk'event and clk = '1' then
	if clk_divider = 0 then
			clk_divider <= std_logic_vector(to_unsigned(divider_modulo, 16));
	else
			clk_divider <= clk_divider - 1 ;
	end if ;
end if;
end process ;
end_divider <= '1' when clk_divider = 0 else
					'0' ;
					
					
process(clk, resetn)
begin
if resetn = '0' then
	bit_counter <= (others => '0');
elsif clk'event and clk = '1' then
	if bit_counter_reset = '1' then
			bit_counter <= (others => '0');
	elsif bit_counter_en = '1' then
			bit_counter <= bit_counter + 1;
	end if ;
end if;
end process ;


process(clk, resetn)
begin
if resetn = '0' then
	cur_state <= WAIT_SAMPLE;
elsif clk'event and clk = '1' then
	cur_state <= next_state;
end if ;
end process ;

process(clk, resetn)
begin
if resetn = '0' then
	data_reg <= (others => '0');
elsif clk'event and clk = '1' then
	if shift_in = '1' then
		data_reg(15 downto 1) <= data_reg(14 downto 0);
		data_reg(0) <= miso_latched ;
	end if ;
end if;
end process ;

		

process(cur_state, bit_counter, end_divider)
begin
next_state <= cur_state ;
case cur_state is
	when WAIT_SAMPLE =>
		if bit_counter = tick_between_samples and end_divider = '1' then
			next_state <= ASSERT_SS ;
		end if ;
	when ASSERT_SS =>
		if bit_counter = 1 and end_divider = '1' then
			next_state <= SCLK_LOW ;
		end if ;
	when SCLK_LOW =>
		if end_divider = '1' then
			next_state <= SCLK_HIGH ;
		end if ;
	when SCLK_HIGH =>
		if bit_counter = 15 and end_divider = '1' then
			next_state <= DEASSERT_SS ;
		elsif end_divider = '1' then
			next_state <= SCLK_LOW ;
		end if ;
	when DEASSERT_SS =>
		if bit_counter = 1 and end_divider = '1' then
			next_state <= WAIT_SAMPLE ;
		end if ;
	when others => next_state <= WAIT_SAMPLE ;
end case;
end process ;		

with cur_state select 
	bit_counter_en <= end_divider when SCLK_HIGH,
							'0' when SCLK_LOW,
							end_divider when others ;
	bit_counter_reset <= '1' when cur_state = ASSERT_SS and next_state = SCLK_LOW else
								'1' when cur_state = WAIT_SAMPLE and next_state = ASSERT_SS else
								'1' when cur_state = SCLK_HIGH and next_state = DEASSERT_SS else
								'1' when cur_state = DEASSERT_SS and next_state = WAIT_SAMPLE else
								'0';
	shift_in <= '1' when cur_state = SCLK_LOW and next_state = SCLK_HIGH else
					'0' ;
	sample_valid <= '1' when cur_state = SCLK_HIGH and next_state = DEASSERT_SS else
						 '0' ;
	sample_out <= data_reg(12 downto 1);
	
	ss_comb <= '1' when cur_state = WAIT_SAMPLE else
			'1' when cur_state = DEASSERT_SS else
			'0' ;
			
	with cur_state select
		sclk_comb <= 	'0' when SCLK_LOW,
					'1' when others ;
	
	process(clk, resetn)
begin
if resetn = '0' then
	ss <= '1' ;
	sclk <= '1' ;
	miso_latched <= '0' ;
elsif clk'event and clk = '1' then
	ss <= ss_comb;
	sclk <= sclk_comb ;
	miso_latched <= miso ;
end if;
end process ;
	
	
end Behavioral;

