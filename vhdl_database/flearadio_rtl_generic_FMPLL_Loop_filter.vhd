-- Note: Source contained in this file is not mine but was found online in a-- research document authored by Nursani Rahmatullah. Reference link:
-- http://read.pudn.com/downloads166/ebook/757199/full%20digital%20FM%20receiver.pdf
--
-- Use at your own risk!
--
-- This module essentially filters out the high pass crap from the phase
-- comparator which is essentially a mixer
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.numeric_std.ALL;
 
ENTITY loop_filter IS
	port ( 	CLK : in std_logic;
			RESET : in std_logic;
			C : in signed(7 downto 0);
			D1 : out signed(11 downto 0);
			D2 : out signed(11 downto 0)
		);
END loop_filter ;
 
ARCHITECTURE behavior OF loop_filter IS
	signal E : signed(11 downto 0);
	signal dtemp : signed(11 downto 0);
begin
	process(CLK, RESET)
	begin  
		if (RESET='1') then
			D1 <= (others => '0');
			D2 <= (others => '0');
			E <= (others => '0');
			dtemp <= (others => '0');
		elsif rising_edge(CLK) then
			dtemp <= ( C(7) & C(7) & C(7) & C & '0') + dtemp - E;
			E <= dtemp(11) & dtemp(11) & dtemp(11) & dtemp(11) & dtemp(11 downto 4);
			D1 <= dtemp;
			D2 <= dtemp(11 downto 4) & "0000";
		end if;
	end process;
END behavior;