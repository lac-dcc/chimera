----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:31:52 08/26/2013 
-- Design Name: 
-- Module Name:    compute_adc_mean - Behavioral 
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

library work ;
use work.utils_pack.all ;

entity compute_adc_mean is
generic(NB_SAMPLES : positive := 512);
port(
	clk, resetn : in std_logic ;
	
	sample_in : in std_logic_vector(9 downto 0);
	dv_in : in std_logic ;
	
	mean_val : out std_logic_vector(9 downto 0)
);
end compute_adc_mean;

architecture Behavioral of compute_adc_mean is
constant acc_size : integer := (nbit(NB_SAMPLES) + 10) ;

signal sample_count : std_logic_vector(15 downto 0);
signal accumulator : std_logic_vector(acc_size-1 downto 0);

signal reset_sample_count, reset_accumulator, latch_output : std_logic ;

begin

process(clk, resetn)
begin
	if resetn = '0' then
		sample_count <= (others => '0');
	elsif clk'event and clk='1' then
		if reset_sample_count = '1' then
			sample_count <= (others => '0');
		elsif dv_in = '1' then
			sample_count <= sample_count + 1 ;
		end if ;
	end if ;
end process ;

reset_sample_count <= '1' when sample_count = NB_SAMPLES else
							 '0' ;

reset_accumulator <= '1' when sample_count = NB_SAMPLES else
							 '0' ;
							 
latch_output <= '1' when sample_count = NB_SAMPLES else
							 '0' ;
							 
process(clk, resetn)
begin
	if resetn = '0' then
		accumulator <= (others => '0');
	elsif clk'event and clk='1' then
		if reset_accumulator = '1' then
			accumulator <= (others => '0');
		elsif dv_in = '1' then
			accumulator <= accumulator + std_logic_vector(resize(unsigned(sample_in), acc_size)) ;
		end if ;
	end if ;
end process ;

process(clk, resetn)
begin
	if resetn = '0' then
		mean_val <= (others => '0');
	elsif clk'event and clk='1' then
		if latch_output = '1' then
			mean_val <= accumulator((acc_size-1) downto nbit(NB_SAMPLES));
		end if ;
	end if ;
end process ;

end Behavioral;

