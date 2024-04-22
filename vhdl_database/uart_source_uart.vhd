-------------------------------------------------------------------------------
-- UART
-- Implements a universal asynchronous receiver transmitter
-------------------------------------------------------------------------------
-- clock
--      Input clock, must match frequency value given on clock_frequency
--      generic input.
-- reset
--      Synchronous reset.  
-- data_stream_in
--      Input data bus for bytes to transmit.
-- data_stream_in_stb
--      Input strobe to qualify the input data bus.
-- data_stream_in_ack
--      Output acknowledge to indicate the UART has begun sending the byte
--      provided on the data_stream_in port.
-- data_stream_out
--      Data output port for received bytes.
-- data_stream_out_stb
--      Output strobe to qualify the received byte. Will be valid for one clock
--      cycle only. 
-- tx
--      Serial transmit.
-- rx
--      Serial receive
-------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.math_real.all;

entity uart is
    generic (
        baud                : positive;
        clock_frequency     : positive
    );
    port (  
        clock               :   in  std_logic;
        reset               :   in  std_logic;    
        data_stream_in      :   in  std_logic_vector(7 downto 0);
        data_stream_in_stb  :   in  std_logic;
        data_stream_in_ack  :   out std_logic;
        data_stream_out     :   out std_logic_vector(7 downto 0);
        data_stream_out_stb :   out std_logic;
        tx                  :   out std_logic;
        rx                  :   in  std_logic
    );
end uart;

architecture rtl of uart is
    ---------------------------------------------------------------------------
    -- Baud generation constants
    ---------------------------------------------------------------------------
    constant c_tx_div       : integer := clock_frequency / baud;
    constant c_rx_div       : integer := clock_frequency / (baud * 16);
    constant c_tx_div_width : integer 
        := integer(log2(real(c_tx_div))) + 1;   
    constant c_rx_div_width : integer 
        := integer(log2(real(c_rx_div))) + 1;
    ---------------------------------------------------------------------------
    -- Baud generation signals
    ---------------------------------------------------------------------------
    signal tx_baud_counter : unsigned(c_tx_div_width - 1 downto 0) 
        := (others => '0');   
    signal tx_baud_tick : std_logic := '0';
    signal rx_baud_counter : unsigned(c_rx_div_width - 1 downto 0) 
        := (others => '0');   
    signal rx_baud_tick : std_logic := '0';
    ---------------------------------------------------------------------------
    -- Transmitter signals
    ---------------------------------------------------------------------------
    type uart_tx_states is ( 
        tx_send_start_bit,
        tx_send_data,
        tx_send_stop_bit
    );             
    signal uart_tx_state : uart_tx_states := tx_send_start_bit;
    signal uart_tx_data_vec : std_logic_vector(7 downto 0) := (others => '0');
    signal uart_tx_data : std_logic := '1';
    signal uart_tx_count : unsigned(2 downto 0) := (others => '0');
    signal uart_rx_data_in_ack : std_logic := '0';
    ---------------------------------------------------------------------------
    -- Receiver signals
    ---------------------------------------------------------------------------
    type uart_rx_states is ( 
        rx_get_start_bit, 
        rx_get_data, 
        rx_get_stop_bit
    );            
    signal uart_rx_state : uart_rx_states := rx_get_start_bit;
    signal uart_rx_bit : std_logic := '1';
    signal uart_rx_data_vec : std_logic_vector(7 downto 0) := (others => '0');
    signal uart_rx_data_sr : std_logic_vector(1 downto 0) := (others => '1');
    signal uart_rx_filter : unsigned(1 downto 0) := (others => '1');
    signal uart_rx_count : unsigned(2 downto 0) := (others => '0');
    signal uart_rx_data_out_stb : std_logic := '0';
    signal uart_rx_bit_spacing : unsigned (3 downto 0) := (others => '0');
    signal uart_rx_bit_tick : std_logic := '0';
begin
    -- Connect IO
    data_stream_in_ack  <= uart_rx_data_in_ack;
    data_stream_out     <= uart_rx_data_vec;
    data_stream_out_stb <= uart_rx_data_out_stb;
    tx                  <= uart_tx_data;
    ---------------------------------------------------------------------------
    -- OVERSAMPLE_CLOCK_DIVIDER
    -- generate an oversampled tick (baud * 16)
    ---------------------------------------------------------------------------
    oversample_clock_divider : process (clock)
    begin
        if rising_edge (clock) then
            if reset = '1' then
                rx_baud_counter <= (others => '0');
                rx_baud_tick <= '0';    
            else
                if rx_baud_counter = c_rx_div then
                    rx_baud_counter <= (others => '0');
                    rx_baud_tick <= '1';
                else
                    rx_baud_counter <= rx_baud_counter + 1;
                    rx_baud_tick <= '0';
                end if;
            end if;
        end if;
    end process oversample_clock_divider;
    ---------------------------------------------------------------------------
    -- RXD_SYNCHRONISE
    -- Synchronise rxd to the oversampled baud
    ---------------------------------------------------------------------------
    rxd_synchronise : process(clock)
    begin
        if rising_edge(clock) then
            if reset = '1' then
                uart_rx_data_sr <= (others => '1');
            else
                if rx_baud_tick = '1' then
                    uart_rx_data_sr(0) <= rx;
                    uart_rx_data_sr(1) <= uart_rx_data_sr(0);
                end if;
            end if;
        end if;
    end process rxd_synchronise;
    ---------------------------------------------------------------------------
    -- RXD_FILTER
    -- Filter rxd with a 2 bit counter.
    ---------------------------------------------------------------------------
    rxd_filter : process(clock)
    begin
        if rising_edge(clock) then
            if reset = '1' then
                uart_rx_filter <= (others => '1');
                uart_rx_bit <= '1';
            else
                if rx_baud_tick = '1' then
                    -- filter rxd.
                    if uart_rx_data_sr(1) = '1' and uart_rx_filter < 3 then
                        uart_rx_filter <= uart_rx_filter + 1;
                    elsif uart_rx_data_sr(1) = '0' and uart_rx_filter > 0 then
                        uart_rx_filter <= uart_rx_filter - 1;
                    end if;
                    -- set the rx bit.
                    if uart_rx_filter = 3 then
                        uart_rx_bit <= '1';
                    elsif uart_rx_filter = 0 then
                        uart_rx_bit <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process rxd_filter;
    ---------------------------------------------------------------------------
    -- RX_BIT_SPACING
    ---------------------------------------------------------------------------
    rx_bit_spacing : process (clock)
    begin
        if rising_edge(clock) then
            uart_rx_bit_tick <= '0';
            if rx_baud_tick = '1' then       
                if uart_rx_bit_spacing = 15 then
                    uart_rx_bit_tick <= '1';
                    uart_rx_bit_spacing <= (others => '0');
                else
                    uart_rx_bit_spacing <= uart_rx_bit_spacing + 1;
                end if;
                if uart_rx_state = rx_get_start_bit then
                    uart_rx_bit_spacing <= (others => '0');
                end if; 
            end if;
        end if;
    end process rx_bit_spacing;
    ---------------------------------------------------------------------------
    -- UART_RECEIVE_DATA
    ---------------------------------------------------------------------------
    uart_receive_data   : process(clock)
    begin
        if rising_edge(clock) then
            if reset = '1' then
                uart_rx_state <= rx_get_start_bit;
                uart_rx_data_vec <= (others => '0');
                uart_rx_count <= (others => '0');
                uart_rx_data_out_stb <= '0';
            else
                uart_rx_data_out_stb <= '0';
                case uart_rx_state is
                    when rx_get_start_bit =>
                        if rx_baud_tick = '1' and uart_rx_bit = '0' then
                            uart_rx_state <= rx_get_data;
                        end if;
                    when rx_get_data =>
                        if uart_rx_bit_tick = '1' then
                            uart_rx_data_vec(uart_rx_data_vec'high) 
                                <= uart_rx_bit;
                            uart_rx_data_vec(
                                uart_rx_data_vec'high-1 downto 0
                            ) <= uart_rx_data_vec(
                                uart_rx_data_vec'high downto 1
                            );
                            if uart_rx_count < 7 then
                                uart_rx_count   <= uart_rx_count + 1;
                            else
                                uart_rx_count <= (others => '0');
                                uart_rx_state <= rx_get_stop_bit;
                            end if;
                        end if;
                    when rx_get_stop_bit =>
                        if uart_rx_bit_tick = '1' then
                            if uart_rx_bit = '1' then
                                uart_rx_state <= rx_get_start_bit;
                                uart_rx_data_out_stb <= '1';
                            end if;
                        end if;                            
                    when others =>
                        uart_rx_state <= rx_get_start_bit;
                end case;
            end if;
        end if;
    end process uart_receive_data;
    ---------------------------------------------------------------------------
    -- TX_CLOCK_DIVIDER
    -- Generate baud ticks at the required rate based on the input clock
    -- frequency and baud rate
    ---------------------------------------------------------------------------
    tx_clock_divider : process (clock)
    begin
        if rising_edge (clock) then
            if reset = '1' then
                tx_baud_counter <= (others => '0');
                tx_baud_tick <= '0';    
            else
                if tx_baud_counter = c_tx_div then
                    tx_baud_counter <= (others => '0');
                    tx_baud_tick <= '1';
                else
                    tx_baud_counter <= tx_baud_counter + 1;
                    tx_baud_tick <= '0';
                end if;
            end if;
        end if;
    end process tx_clock_divider;
    ---------------------------------------------------------------------------
    -- UART_SEND_DATA 
    -- Get data from data_stream_in and send it one bit at a time upon each 
    -- baud tick. Send data lsb first.
    -- wait 1 tick, send start bit (0), send data 0-7, send stop bit (1)
    ---------------------------------------------------------------------------
    uart_send_data : process(clock)
    begin
        if rising_edge(clock) then
            if reset = '1' then
                uart_tx_data <= '1';
                uart_tx_data_vec <= (others => '0');
                uart_tx_count <= (others => '0');
                uart_tx_state <= tx_send_start_bit;
                uart_rx_data_in_ack <= '0';
            else
                uart_rx_data_in_ack <= '0';
                case uart_tx_state is
                    when tx_send_start_bit =>
                        if tx_baud_tick = '1' and data_stream_in_stb = '1' then
                            uart_tx_data  <= '0';
                            uart_tx_state <= tx_send_data;
                            uart_tx_count <= (others => '0');
                            uart_rx_data_in_ack <= '1';
                            uart_tx_data_vec <= data_stream_in;
                        end if;
                    when tx_send_data =>
                        if tx_baud_tick = '1' then
                            uart_tx_data <= uart_tx_data_vec(0);
                            uart_tx_data_vec(
                                uart_tx_data_vec'high-1 downto 0
                            ) <= uart_tx_data_vec(
                                uart_tx_data_vec'high downto 1
                            );
                            if uart_tx_count < 7 then
                                uart_tx_count <= uart_tx_count + 1;
                            else
                                uart_tx_count <= (others => '0');
                                uart_tx_state <= tx_send_stop_bit;
                            end if;
                        end if;
                    when tx_send_stop_bit =>
                        if tx_baud_tick = '1' then
                            uart_tx_data <= '1';
                            uart_tx_state <= tx_send_start_bit;
                        end if;
                    when others =>
                        uart_tx_data <= '1';
                        uart_tx_state <= tx_send_start_bit;
                end case;
            end if;
        end if;
    end process uart_send_data;    
end rtl;