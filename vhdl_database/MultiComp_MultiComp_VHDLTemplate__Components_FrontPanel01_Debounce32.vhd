-- Debouncer32
-- Active low input produces a single clock wide low pulse

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Debouncer32 is
	port(
		i_slowClk		: in std_logic := '1';
		i_fastClk		: in std_logic := '1';
		i_PinsIn			: in std_logic_vector(31 downto 0);
		o_LdStrobe		: out std_logic := '1';
		o_PinsOut		: out std_logic_vector(31 downto 0)
	);

end Debouncer32;

architecture struct of Debouncer32 is
	
	signal w_dig_counter	: std_logic_vector (6 downto 0) := (others => '0');
	signal w_termCount	: std_logic;
	
	signal w_pbPressed	: std_logic;

	signal w_dly1		: std_logic;
	signal w_dly2		: std_logic;
	signal w_dly3		: std_logic;
	signal w_dly4		: std_logic;

	attribute syn_keep: boolean;
	attribute syn_keep of w_pbPressed:		signal is true;
	attribute syn_keep of w_dig_counter:	signal is true;
	attribute syn_keep of i_slowClk:			signal is true;
	attribute syn_keep of w_termCount:		signal is true;
	attribute syn_keep of w_dly3:				signal is true;
	attribute syn_keep of o_PinsOut:			signal is true;
	attribute syn_keep of o_LdStrobe:		signal is true;

begin

	w_pbPressed <= i_PinsIn(31) or i_PinsIn(30) or i_PinsIn(29) or i_PinsIn(28) or i_PinsIn(27) or i_PinsIn(26) or i_PinsIn(25) or i_PinsIn(24) or 
						i_PinsIn(23) or i_PinsIn(22) or i_PinsIn(21) or i_PinsIn(20) or i_PinsIn(19) or i_PinsIn(18) or i_PinsIn(17) or i_PinsIn(16) or 
						i_PinsIn(15) or i_PinsIn(14) or i_PinsIn(13) or i_PinsIn(12) or i_PinsIn(11) or i_PinsIn(10) or i_PinsIn(9)  or i_PinsIn(8) or 
						i_PinsIn(7)  or i_PinsIn(6)  or i_PinsIn(5)  or i_PinsIn(4)  or i_PinsIn(3)  or i_PinsIn(2)  or i_PinsIn(1)  or i_PinsIn(0);
	
	----------------------------------------------------------------------------
	-- ~100 mS counter
	-- 2^7 = 128 counts
	-- Used for prescaling pushbuttons
	----------------------------------------------------------------------------
	process (i_slowClk, w_pbPressed) begin
		if rising_edge(i_slowClk) then
			if w_pbPressed = '0' then
				w_dig_counter <= (others => '0');
				w_termCount <= '0';
			elsif w_dig_counter = "1111111" then
				w_termCount <= '1';
			else
				w_dig_counter <= w_dig_counter+1;
			end if;
		end if;
	end process;

	-- edge detect the debounce count
	process(i_fastClk)
	begin
		if(rising_edge(i_fastClk)) then
			w_dly1		<= w_termCount;
			w_dly2		<= w_dly1;
			w_dly3 		<= w_dly1 and not w_dly2;
			o_LdStrobe	<= w_dly3;
		end if;
	end process;
	
	o_PinsOut <= i_PinsIn	when w_termCount = '1' else		-- set
					x"00000000"	when w_pbPressed = '0';

end;
