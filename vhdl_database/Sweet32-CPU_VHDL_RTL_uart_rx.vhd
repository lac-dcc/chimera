----------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
----------------------------------------------------------------------
-- This file contains the UART Receiver.	This receiver is able to
-- receive 8 bits of serial data, one start bit, one stop bit,
-- and no parity bit.	When receive is complete o_rx_dv will be
-- driven high for one clock cycle.
--
-- Set clock_divisor as follows:
-- Example: 100 MHz Clock, 115,200 baud UART
-- (100,000,000 Hz / 115,200 baud)-1 = 867
--
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity uart_rx is
	port (
		i_clk		: in std_logic;
		i_rx_serial : in std_logic;
		o_rx_active : out std_logic;
		o_rx_dv		: out std_logic;
		o_rx_byte	: out std_logic_vector(7 downto 0);
		clock_divisor : in unsigned(15 downto 0);
		clock_divisor_read : out unsigned(15 downto 0);
		clock_divisor_rst	: in std_logic
	);
end uart_rx;

architecture rtl of uart_rx is

	type t_SM_MAIN is (s_IDLE, s_RX_START_BIT, s_RX_DATA_BITS, s_RX_STOP_BIT);
	signal r_SM_MAIN	: t_SM_MAIN := s_IDLE;

	signal r_RX_IN_R	: std_logic_vector(3 downto 0) := (others => '0');
	signal r_RX_IN		: std_logic := '0';

	signal r_CLK_COUNT : integer range 0 to 65535 := 0;
	signal r_BIT_INDEX : integer range 0 to 7 := 0;	
	signal r_RX_BYTE	: std_logic_vector(7 downto 0) := (others => '0');
	signal r_RX_DATA	: std_logic_vector(7 downto 0) := (others => '0');
	signal r_RX_DV		: std_logic := '0';
	signal r_RX_ACTIVE	: std_logic := '0';
	signal r_RX_BITRATE	: unsigned(15 downto 0) := (others => '1');
	signal r_RX_BITCOUNT : unsigned(15 downto 0) := (others => '0');
	signal r_RX_LAST	 : std_logic := '0';

begin

	-- Purpose: Double-register the incoming data.
	-- This allows it to be used in the UART RX Clock Domain.
	-- (It removes problems caused by metastabiliy)
	p_SAMPLE : process (i_clk)
	begin
		if rising_edge(i_clk) then
			r_RX_IN_R	<= i_rx_serial & r_RX_IN_R(3 downto 1);
			if r_RX_IN_R = "0000" then
				r_RX_IN		<= '0';
			elsif r_RX_IN_R = "1111" then
				r_RX_IN		<= '1';
			end if;
		end if;
	end process p_SAMPLE;

	-- Purpose: Control RX state machine
	p_UART_RX : process (i_clk)
	begin
		if rising_edge(i_clk) then
			case r_SM_MAIN is

			when s_IDLE =>
				r_RX_ACTIVE	<= '0';
				r_RX_DV		<= '0';
				r_CLK_COUNT <= 0;
				r_BIT_INDEX <= 0;

				if r_RX_IN = '0' then		-- Start bit detected
					r_SM_MAIN <= s_RX_START_BIT;
				else
					r_SM_MAIN <= s_IDLE;
				end if;

			-- Wait (CLKS_PER_BIT-1)/2 to sample middle of bits. Make sure start bit is still low
			when s_RX_START_BIT =>
				r_RX_ACTIVE <= '1';
				if r_CLK_COUNT < ("0" & clock_divisor(15 downto 1)) then
					r_CLK_COUNT <= r_CLK_COUNT + 1;
					r_SM_MAIN	<= s_RX_START_BIT;
				else
					if r_RX_IN = '0' then
						r_CLK_COUNT <= 0;	-- reset counter since we found the middle
						r_SM_MAIN	<= s_RX_DATA_BITS;
					else
						r_SM_MAIN	<= s_IDLE;
					end if;
				end if;

			-- Wait CLKS_PER_BIT-1 clock cycles to sample serial data
			when s_RX_DATA_BITS =>
				if r_CLK_COUNT < clock_divisor then
					r_CLK_COUNT <= r_CLK_COUNT + 1;
					r_SM_MAIN	<= s_RX_DATA_BITS;
				else
					r_CLK_COUNT				<= 0;
					r_RX_DATA(r_BIT_INDEX)	<= r_RX_IN;

					-- Check if we have sent out all bits
					if r_BIT_INDEX < 7 then
						r_BIT_INDEX <= r_BIT_INDEX + 1;
						r_SM_MAIN	<= s_RX_DATA_BITS;
					else
						r_BIT_INDEX <= 0;
						r_SM_MAIN	<= s_RX_STOP_BIT;
					end if;
				end if;

			-- Receive Stop bit.	Stop bit = 1
			when s_RX_STOP_BIT =>
				-- Wait CLKS_PER_BIT-1 clock cycles for Stop bit to finish
				if r_CLK_COUNT < clock_divisor then
					r_CLK_COUNT <= r_CLK_COUNT + 1;
					r_SM_MAIN	<= s_RX_STOP_BIT;
				else
					if r_RX_IN = '1' then
						r_RX_BYTE	<= r_RX_DATA;	-- buffer completed byte
						r_RX_DV		<= '1';
					end if;
					r_CLK_COUNT <= 0;
					r_SM_MAIN	<= s_IDLE;
				end if;

			when others =>
				r_SM_MAIN <= s_IDLE;

			end case;
		end if;
	end process p_UART_RX;

	p_BITRATE : process (i_clk)
	begin
		if rising_edge(i_clk) then
			r_RX_BITCOUNT <= r_RX_BITCOUNT + 1;

			if r_RX_IN = '0' AND R_RX_LAST = '1' then
				r_RX_BITCOUNT <= (others => '0');
			end if;
		
			if r_RX_IN = '1' AND R_RX_LAST = '0' then
				if r_RX_BITCOUNT < r_RX_BITRATE then
					r_RX_BITRATE <= r_RX_BITCOUNT;
				end if;
			end if;

			if clock_divisor_rst = '1' then
				r_RX_BITRATE <= (others => '1');
			end if;

			R_RX_LAST <= r_RX_IN;
		end if;
	end process p_BITRATE;

	o_rx_active	<= r_RX_ACTIVE;
	o_rx_dv		<= r_RX_DV;
	o_rx_byte	<= r_RX_BYTE;
	
	clock_divisor_read <= r_RX_BITRATE;

end rtl;
