----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:36:55 02/19/2014 
-- Design Name: 
-- Module Name:    heart_beat - Behavioral 
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

library work ;
use work.logi_utils_pack.all ;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity heart_beat is
    generic(clk_period_ns : positive := 10; 
				beat_period_ns : positive := 900_000_000;
				beat_length_ns : positive := 100_000_000);
	 port ( gls_clk : in  STD_LOGIC;
           gls_reset : in  STD_LOGIC;
           beat_out : out  STD_LOGIC);
end heart_beat;

architecture RTL of heart_beat is
constant period_count : positive := beat_period_ns/clk_period_ns ;
constant beat_count : positive := beat_length_ns/clk_period_ns ;
constant nb_beat : positive := 2 ;

signal cycle_counter : std_logic_vector(1 downto 0);
signal time_counter,load_value : std_logic_vector(nbit(period_count)-1 downto 0);
signal load_counter : std_logic ;
begin

time_count0 : process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
		time_counter <= std_logic_vector(to_unsigned(period_count, nbit(period_count)));
	elsif gls_clk'event and gls_clk = '1' then
		if load_counter = '1' then
			time_counter <= load_value ;
		else
			time_counter <= time_counter - 1 ;
		end if ;
	end if ;
end process ;
load_counter <= '1' when time_counter = 0 else
					 '0' ;

cycle_count0 : process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
		cycle_counter <= (others => '0');
	elsif gls_clk'event and gls_clk = '1' then
		if time_counter = 0 then
			cycle_counter <= cycle_counter + 1 ;
		end if ;
	end if ;
end process ;

with cycle_counter select
	load_value <= std_logic_vector(to_unsigned(beat_count, nbit(period_count))) when "00",
					 std_logic_vector(to_unsigned(beat_count, nbit(period_count))) when "01",
					 std_logic_vector(to_unsigned(beat_count, nbit(period_count))) when "10",
					 std_logic_vector(to_unsigned(period_count, nbit(period_count))) when others ;


beat_out <= '1' when cycle_counter = 1 else
				'1' when cycle_counter = 3 else
				'0' ;

end RTL;

