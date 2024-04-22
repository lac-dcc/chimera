-------------------------------------------------------------------------------
-- UART
-- Simple loopback
-------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.math_real.all;

entity loopback is
    generic (
        baud            : positive;
        clock_frequency : positive
    );
    port (  
        clock           : in std_logic;
        reset           : in std_logic;    
        rx              : in std_logic;
        tx              : out std_logic
    );
end loopback;

architecture rtl of loopback is
    ---------------------------------------------------------------------------
    -- Component declarations
    ---------------------------------------------------------------------------
    component uart is
        generic (
            baud                : positive;
            clock_frequency     : positive
        );
        port (
            clock               :   in      std_logic;
            reset               :   in      std_logic;    
            data_stream_in      :   in      std_logic_vector(7 downto 0);
            data_stream_in_stb  :   in      std_logic;
            data_stream_in_ack  :   out     std_logic;
            data_stream_out     :   out     std_logic_vector(7 downto 0);
            data_stream_out_stb :   out     std_logic;
            tx                  :   out     std_logic;
            rx                  :   in      std_logic
        );
    end component uart;

    component generic_fifo is
        generic (
            fifo_width : positive := 32;
            fifo_depth : positive := 1024
        );
        port (
            clock       : in std_logic;
            reset       : in std_logic;
            write_data  : in std_logic_vector(FIFO_WIDTH-1 downto 0);
            read_data   : out std_logic_vector(FIFO_WIDTH-1 downto 0);
            write_en    : in std_logic;
            read_en     : in std_logic;
            full        : out std_logic;
            empty       : out std_logic;
            level       : out std_logic_vector(
                integer(ceil(log2(real(fifo_depth))))-1 downto 0
            )
        );
    end component;
    ---------------------------------------------------------------------------
    -- UART signals
    ---------------------------------------------------------------------------
    signal uart_data_in : std_logic_vector(7 downto 0);
    signal uart_data_out : std_logic_vector(7 downto 0);
    signal uart_data_in_stb : std_logic := '0';
    signal uart_data_in_ack : std_logic := '0';
    signal uart_data_out_stb : std_logic := '0';
    -- Transmit buffer signals
    constant buffer_depth : integer   := 1024;
    signal fifo_data_out : std_logic_vector(7 downto 0);
    signal fifo_data_in  : std_logic_vector(7 downto 0);
    signal fifo_data_in_stb : std_logic;
    signal fifo_data_out_stb : std_logic;
    signal fifo_full : std_logic;
    signal fifO_empty : std_logic;
begin
    ---------------------------------------------------------------------------
    -- UART instantiation
    ---------------------------------------------------------------------------
    uart_inst : uart
    generic map (
        baud                => baud,
        clock_frequency     => clock_frequency
    )
    port map    (  
        -- general
        clock               => clock,
        reset               => reset,
        data_stream_in      => uart_data_in,
        data_stream_in_stb  => uart_data_in_stb,
        data_stream_in_ack  => uart_data_in_ack,
        data_stream_out     => uart_data_out,
        data_stream_out_stb => uart_data_out_stb,
        tx                  => tx,
        rx                  => rx
    );

    -- Intermediate buffer for storing bytes received by the UART
    -- Bytes stored in this buffer are immediately retransmitted.
    receive_buffer : generic_fifo
    generic map(
        fifo_width  => 8,
        fifo_depth  => buffer_depth
    )
    port map(
        clock        => clock,
        reset        => reset,
        write_data   => fifo_data_in,
        read_data    => fifo_data_out,
        write_en     => fifo_data_in_stb,
        read_en      => fifo_data_out_stb,
        full         => fifo_full,
        empty        => fifo_empty,
        level        => open
    );

    ---------------------------------------------------------------------------
    -- Simple loopback, retransmit any received data
    ---------------------------------------------------------------------------
    uart_loopback : process (clock)
    begin
        if rising_edge(clock) then
            if reset = '1' then
                uart_data_in_stb        <= '0';
                uart_data_in            <= (others => '0');
                fifo_data_out_stb       <= '0';
                fifo_data_in_stb        <= '0';
            else
                -- Acknowledge data receive strobes and set up a transmission
                -- request
                fifo_data_in_stb    <= '0';
                if uart_data_out_stb = '1' and fifo_full = '0' then
                    fifo_data_in_stb    <= '1';
                    fifo_data_in        <= uart_data_out;
                end if;
                -- Clear transmission request strobe upon acknowledge.
                if uart_data_in_ack = '1' then
                    uart_data_in_stb    <= '0';
                end if;
                -- Transmit any data in the buffer
                fifo_data_out_stb <= '0';
                if fifo_empty = '0' then
                    if uart_data_in_stb = '0' then
                        uart_data_in_stb <= '1';
                        fifo_data_out_stb <= '1';
                        uart_data_in <= fifo_data_out;
                    end if;
                end if;
            end if;
        end if;
    end process;    
end rtl;
