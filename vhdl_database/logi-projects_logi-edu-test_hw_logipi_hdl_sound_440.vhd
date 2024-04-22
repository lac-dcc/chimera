----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:44:18 03/26/2014 
-- Design Name: 
-- Module Name:    sound_440 - Behavioral 
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
use work.logi_utils_pack.all ;

entity sound_440 is
generic(clk_freq_hz : positive := 100_000_000);
port(
	clk, reset : in std_logic ;
	sound_out : out std_logic 
);
end sound_440;

architecture Behavioral of sound_440 is
constant clk_divider : positive := 2*(clk_freq_hz/440) ;

signal divider_counter : std_logic_vector(nbit(clk_divider)-1 downto 0);
signal output_buffer : std_logic ;

begin


process(clk, reset)
begin
if reset = '1' then
	output_buffer  <= '0' ;
	divider_counter <= std_logic_vector(to_unsigned(clk_divider, nbit(clk_divider)));
elsif clk'event and clk = '1' then
	if divider_counter = 0 then
		divider_counter <= std_logic_vector(to_unsigned(clk_divider, nbit(clk_divider)));
		output_buffer <= not output_buffer ;
	else
		divider_counter <= divider_counter - 1 ;
	end if ;
end if ;
end process ;

sound_out <= output_buffer ;

end Behavioral;

