library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UART is
    Generic (
        CLK_FREQ    : integer := 50e6;   -- set system clock frequency in Hz
        BAUD_RATE   : integer := 115200; -- baud rate value
        PARITY_BIT  : string  := "none"  -- legal values: "none", "even", "odd", "mark", "space"
    );
    Port (
        CLK         : in  std_logic; -- system clock
        RST         : in  std_logic; -- high active synchronous reset
        -- UART INTERFACE
        UART_TXD    : out std_logic;
        UART_RXD    : in  std_logic;
        -- USER DATA INPUT INTERFACE
        DATA_IN     : in  std_logic_vector(7 downto 0);
        DATA_SEND   : in  std_logic; -- when DATA_SEND = 1, data on DATA_IN will be transmit, DATA_SEND can set to 1 only when BUSY = 0
        BUSY        : out std_logic; -- when BUSY = 1 transiever is busy, you must not set DATA_SEND to 1
        -- USER DATA OUTPUT INTERFACE
        DATA_OUT    : out std_logic_vector(7 downto 0);
        DATA_VLD    : out std_logic; -- when DATA_VLD = 1, data on DATA_OUT are valid
        FRAME_ERROR : out std_logic  -- when FRAME_ERROR = 1, stop bit was invalid, current and next data may be invalid
    );
end UART;

architecture FULL of UART is

    constant divider_value    : integer := CLK_FREQ/(16*BAUD_RATE);

    signal uart_ticks         : integer range 0 to divider_value-1;
    signal uart_clk_en        : std_logic;
    signal uart_rxd_shreg     : std_logic_vector(3 downto 0);
    signal uart_rxd_debounced : std_logic;

begin

    -- -------------------------------------------------------------------------
    -- UART OVERSAMPLING CLOCK DIVIDER
    -- -------------------------------------------------------------------------

    uart_oversampling_clk_divider : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                uart_ticks <= 0;
                uart_clk_en <= '0';
            elsif (uart_ticks = divider_value-1) then
                uart_ticks <= 0;
                uart_clk_en <= '1';
            else
                uart_ticks <= uart_ticks + 1;
                uart_clk_en <= '0';
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    -- UART RXD DEBAUNCER
    -- -------------------------------------------------------------------------

    uart_rxd_debouncer : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                uart_rxd_shreg <= (others => '1');
                uart_rxd_debounced <= '1';
            else
                uart_rxd_shreg <= UART_RXD & uart_rxd_shreg(3 downto 1);
                uart_rxd_debounced <= uart_rxd_shreg(0) OR
                                      uart_rxd_shreg(1) OR
                                      uart_rxd_shreg(2) OR
                                      uart_rxd_shreg(3);
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    -- UART TRANSMITTER
    -- -------------------------------------------------------------------------

    uart_tx_i: entity work.UART_TX
    generic map (
        PARITY_BIT => PARITY_BIT
    )
    port map (
        CLK         => CLK,
        RST         => RST,
        -- UART INTERFACE
        UART_CLK_EN => uart_clk_en,
        UART_TXD    => UART_TXD,
        -- USER DATA INPUT INTERFACE
        DATA_IN     => DATA_IN,
        DATA_SEND   => DATA_SEND,
        BUSY        => BUSY
    );

    -- -------------------------------------------------------------------------
    -- UART RECEIVER
    -- -------------------------------------------------------------------------

    uart_rx_i: entity work.UART_RX
    generic map (
        PARITY_BIT => PARITY_BIT
    )
    port map (
        CLK         => CLK,
        RST         => RST,
        -- UART INTERFACE
        UART_CLK_EN => uart_clk_en,
        UART_RXD    => uart_rxd_debounced,
        -- USER DATA OUTPUT INTERFACE
        DATA_OUT    => DATA_OUT,
        DATA_VLD    => DATA_VLD,
        FRAME_ERROR => FRAME_ERROR
    );

end FULL;