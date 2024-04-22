----------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
----------------------------------------------------------------------
-- This file contains the UART Transmitter.	This transmitter is able
-- to transmit 8 bits of serial data, one start bit, one stop bit,
-- and no parity bit.	When transmit is complete o_tx_done will be
-- driven high for one clock cycle.
--
-- Set clock_divisor as follows:
-- Example: 100 MHz Clock, 115,200 baud UART
-- (100,000,000 / 115,200)-1 = 867
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_tx is
	port (
		i_clk		: in std_logic;
		i_tx_dv		: in std_logic;
		i_tx_byte	: in std_logic_vector(7 downto 0);
		o_tx_ready	: out std_logic;
		o_tx_serial : out std_logic;
		o_tx_done	: out std_logic;
		clock_divisor : in unsigned(15 downto 0)
	);
end uart_tx;

architecture rtl of uart_tx is

	type t_SM_MAIN is (s_IDLE, s_TX_START_BIT, s_TX_DATA_BITS, s_TX_STOP_BIT);
	signal r_SM_MAIN : t_SM_MAIN := s_IDLE;

	signal r_CLK_COUNT : integer range 0 to 65535 := 0;
	signal r_BIT_INDEX : integer range 0 to 7 := 0;	
	signal r_TX_READY		: std_logic := '0';									-- '1' if buffer full
	signal r_TX_DATA		: std_logic_vector(7 downto 0) := (others => '0');	-- byte being shifted out
	signal r_TX_DONE		: std_logic := '0';

begin

	p_UART_TX : process (i_clk)
	begin
	if rising_edge(i_clk) then
	
		case r_SM_MAIN is
			when s_IDLE =>
				o_tx_serial <= '1';		-- Drive Line High for Idle
				r_TX_DONE	<= '0';
				r_CLK_COUNT <= 0;
				r_BIT_INDEX <= 0;
				
				if i_tx_dv = '1' then
					r_TX_DATA <= i_tx_byte;
					r_TX_READY <= '0';
					r_SM_MAIN <= s_TX_START_BIT;
				else
					r_SM_MAIN <= s_IDLE;
					r_TX_READY <= '1';
				end if;

			-- Send out Start Bit. Start bit = 0
			when s_TX_START_BIT =>
				o_tx_serial <= '0';

				-- Wait CLKS_PER_BIT-1 clock cycles for start bit to finish
				if r_CLK_COUNT < clock_divisor then
					r_CLK_COUNT <= r_CLK_COUNT + 1;
					r_SM_MAIN	<= s_TX_START_BIT;
				else
					r_CLK_COUNT <= 0;
					r_SM_MAIN	<= s_TX_DATA_BITS;
				end if;

			-- Wait CLKS_PER_BIT-1 clock cycles for data bits to finish
			when s_TX_DATA_BITS =>
				o_tx_serial <= r_TX_DATA(r_BIT_INDEX);

				if r_CLK_COUNT < clock_divisor then
					r_CLK_COUNT <= r_CLK_COUNT + 1;
					r_SM_MAIN	<= s_TX_DATA_BITS;
				else
					r_CLK_COUNT <= 0;

					-- Check if we have sent out all bits
					if r_BIT_INDEX < 7 then
						r_BIT_INDEX <= r_BIT_INDEX + 1;
						r_SM_MAIN	<= s_TX_DATA_BITS;
					else
						r_BIT_INDEX <= 0;
						r_SM_MAIN	<= s_TX_STOP_BIT;
					end if;
				end if;

			-- Send out Stop bit.	Stop bit = 1
			when s_TX_STOP_BIT =>
				o_tx_serial <= '1';

				-- Wait CLKS_PER_BIT-1 clock cycles for Stop bit to finish
				if r_CLK_COUNT < clock_divisor then
					r_CLK_COUNT <= r_CLK_COUNT + 1;
					r_SM_MAIN	<= s_TX_STOP_BIT;
				else
					r_TX_DONE	<= '1';
					r_CLK_COUNT <= 0;
					r_SM_MAIN	<= s_IDLE;
				end if;

			when others =>
				r_SM_MAIN <= s_IDLE;
		end case;
		
	end if;
	end process p_UART_TX;

	o_tx_ready	<= r_TX_READY;
	o_tx_done	<= r_TX_DONE;

end rtl;
