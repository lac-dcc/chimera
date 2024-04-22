library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Simplistic UART, handles 8N2 RS232 Rx/Tx with baud rate specified by a generic.


entity simple_uart is
	port(
		clk		: in std_logic;
		reset	: in std_logic;
		txdata	: in std_logic_vector(7 downto 0);
		txgo	: in std_logic;			-- trigger transmission
		txready	: out std_logic;		-- ready to transmit
		rxdata	: out std_logic_vector(7 downto 0);

		rxint	: out std_logic;		-- Interrupt, momentary pulse when character received
		txint	: out std_logic;		-- Interrupt, momentary pulse when data has finished sending

		clock_divisor		: in unsigned(15 downto 0);
		clock_divisor_read	: out unsigned(15 downto 0);
		clock_divisor_rst	: in std_logic;		-- reset clock_divisor_read
		-- physical ports

		rxd : in std_logic;
		txd : out std_logic
	);
end simple_uart;

architecture rtl of simple_uart is
begin

rx_uart: entity work.uart_rx
	port map (
		i_clk		=>	clk,
		o_rx_dv		=>	rxint,
		o_rx_byte	=>	rxdata,
		i_rx_serial =>	rxd,
		clock_divisor => clock_divisor,
		clock_divisor_read => clock_divisor_read,
		clock_divisor_rst => clock_divisor_rst
	);

tx_uart: entity work.uart_tx
	port map (
		i_clk		=>	clk,
		i_tx_dv		=>	txgo,
		i_tx_byte	=>	txdata,
		o_tx_ready	=>	txready,
		o_tx_serial =>	txd,
		o_tx_done	=>	txint,
		clock_divisor => clock_divisor
	);


end architecture;
