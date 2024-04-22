----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:23 12/19/2013 
-- Design Name: 
-- Module Name:    virtual_top_level - Behavioral 
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

entity virtual_top_level is

port(
	clk, reset : in std_logic ;
	pb, sw : in std_logic_vector(7 downto 0);
	led : out std_logic_vector(7 downto 0);
	sseg_anode : out std_logic_vector(7 downto 0);
	sseg_common_cathode : out std_logic_vector(7 downto 0)
);
end virtual_top_level;

architecture Behavioral of virtual_top_level is
	constant DIVIDER1HZ : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(100_000_000, 32));
	constant DIVIDER5HZ : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(20_000_000, 32));
	constant DIVIDER10HZ : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(10_000_000, 32));
	constant DIVIDER100HZ : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(1_000_000, 32));

	signal divider_output1hz,divider_output5hz ,divider_output10hz ,divider_output100hz  : std_logic_vector(31 downto 0);
	signal onehz_signal, fivehz_signal, tenhz_signal, onehundredhz_signal : std_logic ;
	signal update_count_output: std_logic;
	
	signal counter_output : std_logic_vector(7 downto 0);
	signal counter_enable, counter_reset : std_logic ;
	signal sel: std_logic_vector(1 downto 0);

begin

	process(clk, reset)
begin
	if reset='1' then
		divider_output1hz <= DIVIDER1HZ ;
		divider_output5hz <= DIVIDER5HZ ;
		divider_output10hz <= DIVIDER10HZ;
		divider_output100hz <= DIVIDER100HZ;
	elsif clk'event and clk = '1' then
		if divider_output1hz = 0 then
			divider_output1hz <= DIVIDER1HZ ;
		else
			divider_output1hz <= divider_output1hz - 1 ;
		end if ;
		
		if divider_output5hz = 0 then
			divider_output5hz <= DIVIDER5HZ ;
		else
			divider_output5hz <= divider_output5hz - 1 ;
		end if ;
		
		if divider_output10hz = 0 then
			divider_output10hz <= DIVIDER10HZ ;
		else
			divider_output10hz <= divider_output10hz - 1 ;
		end if ;
		
		if divider_output100hz = 0 then
			divider_output100hz <= DIVIDER100HZ ;
		else
			divider_output100hz <= divider_output100hz - 1 ;
		end if ;
		
	end if ;
end process ;
onehz_signal <= '1' when divider_output1hz = 0 else
					'0' ;
fivehz_signal <= '1' when divider_output5hz = 0 else
					'0' ;
tenhz_signal <= '1' when divider_output10hz = 0 else
					'0' ;
onehundredhz_signal <= '1' when divider_output100hz = 0 else
					'0' ;


	--mux the count out enable input different frequncy values
	with sw(7 downto 6) select
				update_count_output <= 	onehz_signal when 	"00",
												fivehz_signal  when "01",
												tenhz_signal  when "10",
												onehundredhz_signal  when "11";
				
	 
	 
	 counter_enable  <= sw(0);
	 counter_reset  <= pb(1);
	 process(clk, reset)
	 begin
		if reset = '1' then
			counter_output <= (others => '0');
		elsif clk'event and clk = '1' then
			if counter_reset = '1' then
				counter_output <= (others => '0');
			elsif counter_enable = '1' and update_count_output = '1' then --100 hz updateupdate_count_output
				counter_output <= counter_output + 1;
			end if ;
		end if ;
	 end process ;
	 led(7 downto 0) <= counter_output;


	sseg_common_cathode <= (others => '0');
	sseg_anode(7) <= '0' ;  -- dot point
		with counter_output(3 downto 0) select
					--"gfedcba" segments
		sseg_anode(6 downto 0)<=		 "0111111"		 when "0000",--0
					 "0000110"    	 when "0001",--1
					 "1011011"   	 when "0010",--2
					 "1001111"   	 when "0011",--3
					 "1100110"   	 when "0100",--4
					 "1101101"   	 when "0101",--5
					 "1111101"   	 when "0110",--6
					 "0000111"   	 when "0111",--7
					 "1111111"   	 when "1000",--8
					 "1101111"   	 when "1001",--9
					 "1110111"      when "1010", --a
					 "1111100"   	 when "1011", --b
					 "0111001"   	 when "1100", --c
					 "1011110"   	 when "1101", --d
					 "1111001"   	 when "1110", --e
					 "1110001" 	 	when others; --f  


end Behavioral;

