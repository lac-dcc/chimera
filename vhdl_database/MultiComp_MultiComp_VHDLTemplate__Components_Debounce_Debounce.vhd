--------------------------------------------------------------------
-- Switch Debouncer
-- Turns Active low switch input into single "fast clock" pulse out
-- Uses "slow clock" to debounce switch (50 mS ish)
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Debouncer is
	port(
		i_clk				: in std_logic := '1';
		i_PinIn			: in std_logic := '1';
		o_PinOut			: out std_logic := '1'
	);

end Debouncer;

architecture struct of Debouncer is
	
	signal w_dig_counter	: std_logic_vector (19 downto 0) := (others => '0');
	signal w_pulse50ms	: std_logic;
	
	signal w_dly1			: std_logic;
	signal w_dly2			: std_logic;
	signal w_dly3			: std_logic;
	signal w_dly4			: std_logic;

begin

	----------------------------------------------------------------------------
	-- 50 mS counter
	-- 2^18 = 256,000, 50MHz/250K = 200 Hz = 5 mS ticks
	-- Used for prescaling pushbuttons
	-- w_pulse50ms = single 20 nS clock pulse every 200 mSecs
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
			o_PinOut <= not(w_dly4 and (not w_dly3));
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
