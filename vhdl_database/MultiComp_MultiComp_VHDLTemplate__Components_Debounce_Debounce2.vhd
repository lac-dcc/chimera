--------------------------------------------------------------------
-- Switch Debouncer
-- Turns Active low switch input into single "fast clock" pulse out
-- Uses "slow clock" to debounce switch (50 mS ish)
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Debouncer2 is
	port(
		i_clk				: in std_logic := '1';
		i_PinIn			: in std_logic := '1';
		o_PinOut			: out std_logic := '1'
	);

end Debouncer2;

architecture struct of Debouncer2 is
	
	signal w_dig_counter	: std_logic_vector (15 downto 0) := (others => '0');
	signal w_pulse50ms	: std_logic;
	
	signal w_dly1			: std_logic;
	signal w_dly2			: std_logic;
	signal w_dly3			: std_logic;
	signal w_dly4			: std_logic;
	signal w_dly5			: std_logic;
	signal w_dly6			: std_logic;
	signal w_dly7			: std_logic;
	signal w_dly8			: std_logic;

begin

	----------------------------------------------------------------------------
	-- Used for prescaling pushbuttons
	----------------------------------------------------------------------------
	process (i_clk) begin
		if rising_edge(i_clk) then
			w_dig_counter <= w_dig_counter+1;
			if w_dig_counter = 0 then
				w_pulse50ms <= '1';
			else
				w_pulse50ms <= '0';
			end if;
			w_dly3 <= w_dly2;
			w_dly4 <= w_dly3;
			w_dly5 <= w_dly4;
			w_dly6 <= w_dly5;
			w_dly7 <= w_dly6;
			w_dly8 <= w_dly7;
			o_PinOut <= not(w_dly8 and (not w_dly3));
		end if;
	end process;

	process(i_clk, w_pulse50ms)
	begin
		if(rising_edge(i_clk)) then
			if w_pulse50ms = '1' then
				w_dly1 <= not i_PinIn;
				w_dly2 <= w_dly1;
			end if;
		end if;
	end process;

end;
