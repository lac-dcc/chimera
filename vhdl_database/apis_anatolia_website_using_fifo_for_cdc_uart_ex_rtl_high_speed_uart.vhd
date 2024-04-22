----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2021 11:01:49 PM
-- Design Name: 
-- Module Name: high_speed_uart - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity high_speed_uart is
generic (
c_sysclkfreq	: integer := 100_000_000;
c_uartclkfreq	: integer := 250_000_000;
c_baudrate		: integer := 50_000_000;
c_stopbit		: integer := 2
);
port (
clk100		: in std_logic;
clk250		: in std_logic;
rx_i		: in std_logic;
tx_o		: out std_logic
);
end high_speed_uart;

architecture Behavioral of high_speed_uart is

------------------------------------------------------------------------------
-- SIGNAL DEFINITIONS
------------------------------------------------------------------------------

-- UART TRANSCIEVER SIGNALS
signal rx_sync		: std_logic := '1';
signal rx_done_tick	: std_logic := '0';
signal tx_start		: std_logic := '0';
signal tx_done_tick	: std_logic := '0';
signal dout			: std_logic_vector (7 downto 0) := (others => '0');
signal din			: std_logic_vector (7 downto 0) := (others => '0');
-- RECEIVE FIFO SIGNALS
signal rcv_fifo_wr_en 	: std_logic := '0';
signal rcv_fifo_rd_en 	: std_logic := '0';
signal rcv_fifo_empty 	: std_logic := '0';
signal rcv_fifo_dout 	: std_logic_vector (7 downto 0) := (others => '0');
-- TRANSMIT FIFO SIGNALS
signal xmit_fifo_wr_en 	: std_logic := '0';
signal xmit_fifo_rd_en 	: std_logic := '0';
signal xmit_fifo_empty 	: std_logic := '0';
signal xmit_fifo_din 	: std_logic_vector (7 downto 0) := (others => '0');
-- CONTROL SIGNALS
signal fetch_rcv_fifo_data 	: std_logic := '0';
signal fetch_xmit_fifo_data : std_logic := '0';
signal xmit_uart_busy 		: std_logic := '0';

begin
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- COMPONENT INSTANTIATIONS
------------------------------------------------------------------------------

I_uart_rx : entity work.uart_rx
generic map (
c_clkfreq		=> c_uartclkfreq	,
c_baudrate		=> c_baudrate
)
port map (
clk				=> clk250              ,
rx_i			=> rx_sync          ,
dout_o			=> dout             ,
rx_done_tick_o	=> rx_done_tick
);

I_uart_tx : entity work.uart_tx
generic map (
c_clkfreq		=> c_uartclkfreq	 ,
c_baudrate		=> c_baudrate	 ,
c_stopbit		=> c_stopbit	
)
port map (
clk				=> clk250             ,
din_i			=> din             ,
tx_start_i		=> tx_start        ,
tx_o			=> tx_o            ,
tx_done_tick_o	=> tx_done_tick
);

I_synchonizer : entity work.synchonizer
generic map (
c_ff_number	=> 3,
c_init_val	=> '1'
)
Port map ( 
clk 	=> clk250		,
data_i 	=> rx_i		,
data_o 	=> rx_sync
);

I_receive_fifo : entity work.receive_fifo
port map(
wr_clk 	=> clk250,
rd_clk 	=> clk100,
din 	=> dout,
wr_en 	=> rcv_fifo_wr_en,
rd_en 	=> rcv_fifo_rd_en,
dout 	=> rcv_fifo_dout,
full 	=> open,
empty 	=> rcv_fifo_empty
);

I_transmit_fifo : entity work.transmit_fifo
port map(
wr_clk 	=> clk100,
rd_clk 	=> clk250,
din 	=> xmit_fifo_din,
wr_en 	=> xmit_fifo_wr_en,
rd_en 	=> xmit_fifo_rd_en,
dout 	=> din,
full 	=> open,
empty 	=> xmit_fifo_empty
);

P_RECV : process (clk250) begin
if rising_edge(clk250) then

	rcv_fifo_wr_en	<= '0';

	if (rx_done_tick = '1') then
		rcv_fifo_wr_en	<= '1';
	end if;

end if;
end process P_RECV;

P_READ : process (clk100) begin
if rising_edge(clk100) then

	rcv_fifo_rd_en	<= '0';
	if (rcv_fifo_empty = '0') then
		rcv_fifo_rd_en	<= '1';
	end if;

	fetch_rcv_fifo_data <= '0';
	if (rcv_fifo_rd_en = '1') then
		fetch_rcv_fifo_data <= '1';
		rcv_fifo_rd_en		<= '0';
	end if;

end if;
end process P_READ;

P_WRITE : process (clk100) begin
if rising_edge(clk100) then

	xmit_fifo_wr_en <= '0';
	if (fetch_rcv_fifo_data = '1') then
		xmit_fifo_din 	<= rcv_fifo_dout;
		xmit_fifo_wr_en	<= '1';
	end if;

end if;
end process P_WRITE;

P_XMIT : process (clk250) begin
if rising_edge(clk250) then

	xmit_fifo_rd_en <= '0';
	if (xmit_fifo_empty = '0' and xmit_uart_busy = '0') then
		xmit_fifo_rd_en <= '1';
		xmit_uart_busy	<= '1';
	end if;
	
	fetch_xmit_fifo_data <= '0';
	if (xmit_fifo_rd_en = '1') then
		fetch_xmit_fifo_data <= '1';
	end if;

	tx_start <= '0';
	if (fetch_xmit_fifo_data = '1') then
		tx_start <= '1';
	end if;

	if (tx_done_tick = '1') then
		xmit_uart_busy	<= '0';
	end if;

end if;
end process P_XMIT;



end Behavioral;