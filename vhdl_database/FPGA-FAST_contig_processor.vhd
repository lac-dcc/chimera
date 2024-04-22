----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:24:18 01/31/2008 
-- Design Name: 
-- Module Name:    contig_processor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:39:51 09/01/2010 
-- Design Name: 
-- Module Name:    FIFO_delay_input - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contig_processor is
port(
		input_d, input_b : in std_logic_vector(15 downto 0);
		clk, rst, ce : in std_logic;
		contig : out std_logic
		);
end contig_processor;

architecture Behavioral of contig_processor is

signal contig_d, contig_b : std_logic;
signal contig_d1, contig_d2, contig_d3 : std_logic;


--signal it0_1d, it0_2d, it1_1d, it1_2d, it2_1d, it2_2d, it3_1d, it3_2d, it4_1d, it4_2d, it5_1d, it5_2d, it6_1d, it6_2d, it7_1d, it7_2d : std_logic;
--signal it8_1d, it8_2d, it9_1d, it9_2d, it10_1d, it10_2d, it11_1d, it11_2d, it12_1d, it12_2d, it13_1d, it13_2d, it14_1d, it14_2d, it15_1d, it15_2d : std_logic;

--signal it0_1b, it0_2b, it1_1b, it1_2b, it2_1b, it2_2b, it3_1b, it3_2b, it4_1b, it4_2b, it5_1b, it5_2b, it6_1b, it6_2b, it7_1b, it7_2b : std_logic;
--signal it8_1b, it8_2b, it9_1b, it9_2b, it10_1b, it10_2b, it11_1b, it11_2b, it12_1b, it12_2b, it13_1b, it13_2b, it14_1b, it14_2b, it15_1b, it15_2b : std_logic;


begin

check_contig_d : process(clk)
begin
	if clk='1' and clk'event then
		if rst='1' then
			contig_d <= '0';
		elsif ce='1' then	
			if std_match(input_d, "111111111-------") then
				contig_d<='1';
			elsif std_match(input_d, "-111111111------") then
				contig_d<='1';
			elsif std_match(input_d, "--111111111-----") then
				contig_d<='1';
			elsif std_match(input_d, "---111111111----") then
				contig_d<='1';
			elsif std_match(input_d, "----111111111---") then
				contig_d<='1';
			elsif std_match(input_d, "-----111111111--") then
				contig_d<='1';
			elsif std_match(input_d, "------111111111-") then
				contig_d<='1';
			elsif std_match(input_d, "-------111111111") then
				contig_d<='1';
			elsif std_match(input_d, "1-------11111111") then
				contig_d<='1';
			elsif std_match(input_d, "11-------1111111") then
				contig_d<='1';
			elsif std_match(input_d, "111-------111111") then
				contig_d<='1';
			elsif std_match(input_d, "1111-------11111") then
				contig_d<='1';
			elsif std_match(input_d, "11111-------1111") then
				contig_d<='1';
			elsif std_match(input_d, "111111-------111") then
				contig_d<='1';
			elsif std_match(input_d, "1111111-------11") then
				contig_d<='1';
			elsif std_match(input_d, "11111111-------1") then
				contig_d<='1';
			else
				contig_d<='0';
			end if;
		end if;
	end if;
end process check_contig_d;		

check_contig_b : process(clk)
begin
	if clk='1' and clk'event then
		if rst='1' then
			contig_b <= '0';
		elsif ce='1' then	
			if std_match(input_b, "111111111-------") then
				contig_b<='1';
			elsif std_match(input_b, "-111111111------") then
				contig_b<='1';
			elsif std_match(input_b, "--111111111-----") then
				contig_b<='1';
			elsif std_match(input_b, "---111111111----") then
				contig_b<='1';
			elsif std_match(input_b, "----111111111---") then
				contig_b<='1';
			elsif std_match(input_b, "-----111111111--") then
				contig_b<='1';
			elsif std_match(input_b, "------111111111-") then
				contig_b<='1';
			elsif std_match(input_b, "-------111111111") then
				contig_b<='1';
			elsif std_match(input_b, "1-------11111111") then
				contig_b<='1';
			elsif std_match(input_b, "11-------1111111") then
				contig_b<='1';
			elsif std_match(input_b, "111-------111111") then
				contig_b<='1';
			elsif std_match(input_b, "1111-------11111") then
				contig_b<='1';
			elsif std_match(input_b, "11111-------1111") then
				contig_b<='1';
			elsif std_match(input_b, "111111-------111") then
				contig_b<='1';
			elsif std_match(input_b, "1111111-------11") then
				contig_b<='1';
			elsif std_match(input_b, "11111111-------1") then
				contig_b<='1';
			else
				contig_b<='0';
			end if;
		end if;
	end if;
end process check_contig_b;

b_and_d : process(clk)
begin
	if clk'event and clk='1' then
		if rst='1' then 
			contig <= '0';
			contig_d1 <= '0';
			contig_d2 <= '0';
			contig_d3 <= '0';
		elsif ce='1' then
			contig_d1 <=contig_d or contig_b; 	-- combine conditions
			contig_d2 <= contig_d1;
			contig_d3 <= contig_d2;
			contig <= contig_d3;
		end if;
	end if;
end process b_and_d;	


end Behavioral;
