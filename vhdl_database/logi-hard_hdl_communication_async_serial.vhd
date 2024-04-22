----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:58:56 03/22/2014 
-- Design Name: 
-- Module Name:    async_serial - Behavioral 
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


library work ;
use work.logi_utils_pack.all ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity async_serial is
generic(CLK_FREQ : positive := 100_000_000; BAUDRATE : positive := 115_200) ;
port( clk, reset : in std_logic ;
		rx : in std_logic ;
		tx : out std_logic ;
		data_out : out std_logic_vector(7 downto 0);
		data_in : in std_logic_vector(7 downto 0);
		data_ready : out std_logic ;
		data_send : in std_logic ;
		available : out std_logic 
);

end async_serial;

architecture Behavioral of async_serial is
type rx_states is (WAIT_START, RECEIVE, DONE);
constant clk_divider : positive := (CLK_FREQ/BAUDRATE) - 1  ; --divides main clock to generate baudrate
constant fast_clk_divider : positive := 9  ; -- trying to re-sync on start bit
constant clk_divider_x2 : positive := clk_divider/2  ; --allows to center sampling after start bit is detected


-- serial rx signals
signal rx_current, rx_next : rx_states;
signal rx_end_prediv, tx_end_prediv : std_logic ;
signal buffered_rx : std_logic ;
signal rx_baud_counter, tx_baud_counter : std_logic_vector(nbit(clk_divider) downto 0);
signal rx_baud_counter_load_value : std_logic_vector(nbit(clk_divider) downto 0);
signal baud_counter_x2 : std_logic_vector(nbit(clk_divider_x2)-1 downto 0);
signal data_receive_buffer, data_send_buffer : std_logic_vector(9 downto 0) ;
signal rx_bit_counter : std_logic_vector(3 downto 0);
signal data_ready_temp : std_logic ;
signal data_out_temp : std_logic_vector(7 downto 0) ;

-- serial tx signals
signal data_transmit_buffer : std_logic_vector(9 downto 0) ;
signal tx_bit_counter : std_logic_vector(3 downto 0);

begin


process(clk, reset)
begin
	if reset = '1' then
		buffered_rx <= '1' ;
	elsif clk'event and clk = '1' then
		buffered_rx <= rx ;
	end if ;
end process ;


process(clk, reset)
begin
	if reset = '1' then
		rx_baud_counter <= std_logic_vector(to_unsigned(fast_clk_divider ,nbit(clk_divider)+1));
	elsif clk'event and clk = '1' then
		if rx_baud_counter = 0 then
			rx_baud_counter <= rx_baud_counter_load_value ;
		else
			rx_baud_counter <= rx_baud_counter - 1 ;
		end if ;
	end if ;
end process ;

rx_end_prediv <= '1' when rx_baud_counter = 0 else
				  '0' ; 
				

rx_baud_counter_load_value <=    std_logic_vector(to_unsigned(fast_clk_divider ,nbit(clk_divider)+1)) when rx_current = WAIT_START and buffered_rx = '1' else -- load fast baudrate to detect start bit
											std_logic_vector(to_unsigned(fast_clk_divider ,nbit(clk_divider)+1)) when rx_current = DONE else -- load fast baudrate after stop is detected
											std_logic_vector(to_unsigned(fast_clk_divider ,nbit(clk_divider)+1)) when rx_current = RECEIVE and rx_bit_counter = 8 else -- load fast baudrate when stop si detected
											std_logic_vector(to_unsigned(clk_divider+clk_divider_x2 ,nbit(clk_divider)+1)) when rx_current = WAIT_START and buffered_rx = '0' else -- load 1.5 baudrate counter after start is detected
											std_logic_vector(to_unsigned(clk_divider ,nbit(clk_divider)+1)) ; -- load baudrate counter to detect byte bits

process(clk, reset)
begin
	if reset = '1' then
		data_receive_buffer <= (others => '1');
	elsif clk'event and clk = '1' then
		if rx_current = DONE then
			data_receive_buffer <= (others => '1');
		elsif rx_end_prediv = '1' then
			data_receive_buffer(8 downto 0) <= data_receive_buffer(9 downto 1);
			data_receive_buffer(9) <= buffered_rx;
			
		end if ;
	end if ;
end process ;

process(clk, reset)
begin
	if reset = '1' then
		rx_current <= WAIT_START ;
	elsif clk'event and clk = '1' then
		rx_current <= rx_next ;
	end if ;
end process ;

process(clk, reset)
begin
	if reset = '1' then
		rx_bit_counter <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if rx_current = WAIT_START then
			rx_bit_counter <= (others => '0') ;
		elsif rx_end_prediv = '1' then
			rx_bit_counter <= rx_bit_counter + 1 ;
		end if ;
	end if ;
end process ;

process(rx_current, rx_end_prediv, rx)
begin
	rx_next <= rx_current ;
	case rx_current is
		when WAIT_START => 
			if buffered_rx = '0' and rx_end_prediv = '1' then
				rx_next <= RECEIVE ;
			end if;
		when RECEIVE => 
			if rx_bit_counter = 8 and rx_end_prediv = '1' then
				rx_next <= DONE ;
			end if ;
		when DONE => 
			rx_next <= WAIT_START ;
		when others =>
			rx_next <= WAIT_START ;
	end case ;
end process ;

				  
data_ready_temp <= '1' when data_receive_buffer(9) = '1' and data_receive_buffer(0) = '0' and rx_current = DONE else
				  '0' ;
				  
data_out_temp <= data_receive_buffer(8 downto 1);

process(clk, reset)
begin
	if reset = '1' then
		data_out <= (others => '0');
		data_ready <= '0' ;
	elsif clk'event and clk = '1' then
		data_ready <= data_ready_temp ;
		if data_ready_temp = '1' then
			data_out <= data_out_temp;
		end if ;
	end if ;
end process ;


-- serial tx logic

process(clk, reset)
begin
	if reset = '1' then
		tx_baud_counter <= std_logic_vector(to_unsigned(clk_divider ,nbit(clk_divider)+1));
	elsif clk'event and clk = '1' then
		if data_send = '1' then
			tx_baud_counter <= std_logic_vector(to_unsigned(clk_divider ,nbit(clk_divider)+1));
		elsif tx_baud_counter = 0 then
			tx_baud_counter <= std_logic_vector(to_unsigned(clk_divider ,nbit(clk_divider)+1));
		else
			tx_baud_counter <= tx_baud_counter - 1 ;
		end if ;
	end if ;
end process ;

tx_end_prediv <= '1' when tx_baud_counter = 0 else
				  '0' ;

process(clk, reset)
begin
	if reset = '1' then
		data_transmit_buffer <= (others => '1');
		tx_bit_counter <= "1001";
		tx <= '1' ;
	elsif clk'event and clk = '1' then
		if data_send = '1' then
			data_transmit_buffer <= '1' & data_in & '0' ;
			tx_bit_counter <= (others => '0');
		elsif tx_bit_counter < 9 and tx_end_prediv = '1' then
			data_transmit_buffer(8 downto 0) <= data_transmit_buffer(9 downto 1);
			data_transmit_buffer(9) <= '1' ; 
			tx_bit_counter <= tx_bit_counter + 1 ;
		end if ;
		
		if data_send = '0' then
			tx <= data_transmit_buffer(0) ;
		else
			tx <= '1' ;
		end if ;
	end if ;
end process ;
available <= '1' when tx_bit_counter = 9 else '0' ;

end Behavioral;

