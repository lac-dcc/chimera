----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:42 01/14/2015 
-- Design Name: 
-- Module Name:    sseg_4x - Behavioral 
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


entity sseg_4x is
generic(
		  clock_freq_hz : natural := 100_000_000;
		  refresh_rate_hz : natural := 100
	 );
port(
		  clk, reset : in std_logic ;
		  bcd_in : in std_logic_vector(15 downto 0);
			
			  -- SSEG to EDU from Host
		  sseg_cathode_out : out std_logic_vector(4 downto 0); -- common cathode
		  sseg_anode_out : out std_logic_vector(7 downto 0) -- sseg anode	  

);
end sseg_4x;

architecture Behavioral of sseg_4x is
	constant clk_divider : positive := clock_freq_hz/(refresh_rate_hz*5);
	signal divider_counter : std_logic_vector(nbit(clk_divider)-1 downto 0);
	signal divider_end : std_logic ;
	signal cathode_buffer : std_logic_vector(4 downto 0);

	signal segs :  slv8_array(0 to 3) ;
	
	
	
begin


gen_seg_decoder : for i in 0 to 3 generate

with bcd_in(((i+1)*4)-1 downto (i*4)) select
	segs(i) <= X"3F" when "0000",
					X"06" when "0001",
					X"5B" when "0010",
					X"4F" when "0011",
					X"66" when "0100",
					X"6D" when "0101",
					X"7D" when "0110",
					X"07" when "0111",
					X"7F" when "1000",
					X"6F" when "1001",
					X"77" when "1010",
					X"7C" when "1011",
					X"39" when "1100",
					X"5E" when "1101",
					X"79" when "1110",
					X"71" when others;
					
end generate ;


-- sseg logic
process(clk, reset)
begin
	if reset = '1' then
		divider_counter <= std_logic_vector(to_unsigned(clk_divider, nbit(clk_divider)));
	elsif clk'event and clk = '1' then
		if divider_counter = 0 then
			divider_counter <= std_logic_vector(to_unsigned(clk_divider, nbit(clk_divider)));
		else
			divider_counter <= divider_counter - 1 ;
		end if ;
	end if ;
end process ;

divider_end <= '1' when divider_counter = 0 else
					'0' ;



process(clk, reset)
begin
	if reset = '1' then
		cathode_buffer(0) <= '1' ;
		cathode_buffer(4 downto 1) <= (others => '0');
	elsif clk'event and clk = '1' then
		if divider_end = '1' then
			cathode_buffer(4 downto 1) <= cathode_buffer(3 downto 0);
			cathode_buffer(0) <= cathode_buffer(4);
		end if ;
	end if ;
end process ;





with cathode_buffer select
	sseg_anode_out <=     segs(0) when 	"01000",
								 segs(1) when  "00100",
								 segs(2) when 	"00010",
								 segs(3) when "00001",
								 (others => '0') when others ;
								 
								 
sseg_cathode_out <= cathode_buffer ;

end Behavioral;

