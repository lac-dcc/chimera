library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UART_RX is
    Generic (
        PARITY_BIT  : string := "none" -- legal values: "none", "even", "odd", "mark", "space"
    );
    Port (
        CLK         : in  std_logic; -- system clock
        RST         : in  std_logic; -- high active synchronous reset
        -- UART INTERFACE
        UART_CLK_EN : in  std_logic; -- oversampling (16x) UART clock enable
        UART_RXD    : in  std_logic;
        -- USER DATA OUTPUT INTERFACE
        DATA_OUT    : out std_logic_vector(7 downto 0);
        DATA_VLD    : out std_logic; -- when DATA_VLD = 1, data on DATA_OUT are valid
        FRAME_ERROR : out std_logic  -- when FRAME_ERROR = 1, stop bit was invalid, current and next data may be invalid
    );
end UART_RX;

architecture FULL of UART_RX is

    signal rx_clk_en          : std_logic;
    signal rx_ticks           : unsigned(3 downto 0);
    signal rx_clk_divider_en  : std_logic;
    signal rx_data            : std_logic_vector(7 downto 0);
    signal rx_bit_count       : unsigned(2 downto 0);
    signal rx_bit_count_en    : std_logic;
    signal rx_data_shreg_en   : std_logic;
    signal rx_parity_bit      : std_logic;
    signal rx_parity_error    : std_logic;
    signal rx_parity_check_en : std_logic;
    signal rx_output_reg_en   : std_logic;

    type state is (idle, startbit, databits, paritybit, stopbit);
    signal rx_pstate : state;
    signal rx_nstate : state;

begin

    -- -------------------------------------------------------------------------
    -- UART RECEIVER CLOCK DIVIDER
    -- -------------------------------------------------------------------------

    uart_rx_clk_divider : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (rx_clk_divider_en = '1') then
                if (uart_clk_en = '1') then
                    if (rx_ticks = "1111") then
                        rx_ticks <= (others => '0');
                        rx_clk_en <= '0';
                    elsif (rx_ticks = "0111") then
                        rx_ticks <= rx_ticks + 1;
                        rx_clk_en <= '1';
                    else
                        rx_ticks <= rx_ticks + 1;
                        rx_clk_en <= '0';
                    end if;
                else
                    rx_ticks <= rx_ticks;
                    rx_clk_en <= '0';
                end if;
            else
                rx_ticks <= (others => '0');
                rx_clk_en <= '0';
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    -- UART RECEIVER BIT COUNTER
    -- -------------------------------------------------------------------------

    uart_rx_bit_counter : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                rx_bit_count <= (others => '0');
            elsif (rx_bit_count_en = '1' AND rx_clk_en = '1') then
                if (rx_bit_count = "111") then
                    rx_bit_count <= (others => '0');
                else
                    rx_bit_count <= rx_bit_count + 1;
                end if;
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    -- UART RECEIVER DATA SHIFT REGISTER
    -- -------------------------------------------------------------------------

    uart_rx_data_shift_reg : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                rx_data <= (others => '0');
            elsif (rx_clk_en = '1' AND rx_data_shreg_en = '1') then
                rx_data <= UART_RXD & rx_data(7 downto 1);
            end if;
        end if;
    end process;

    DATA_OUT <= rx_data;

    -- -------------------------------------------------------------------------
    -- UART RECEIVER PARITY GENERATOR AND CHECK
    -- -------------------------------------------------------------------------

    uart_rx_parity_g : if (PARITY_BIT /= "none") generate
        uart_rx_parity_gen_i: entity work.UART_PARITY
        generic map (
            DATA_WIDTH  => 8,
            PARITY_TYPE => PARITY_BIT
        )
        port map (
            DATA_IN     => rx_data,
            PARITY_OUT  => rx_parity_bit
        );

        uart_rx_parity_check_reg : process (CLK)
        begin
            if (rising_edge(CLK)) then
                if (RST = '1') then
                    rx_parity_error <= '0';
                elsif (rx_parity_check_en = '1') then
                    rx_parity_error <= rx_parity_bit XOR UART_RXD;
                end if;
            end if;
        end process;
    end generate;

    uart_rx_noparity_g : if (PARITY_BIT = "none") generate
        rx_parity_error <= '0';
    end generate;

    -- -------------------------------------------------------------------------
    -- UART RECEIVER OUTPUT REGISTER
    -- -------------------------------------------------------------------------

    uart_rx_output_reg : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                DATA_VLD <= '0';
                FRAME_ERROR <= '0';
            else
                if (rx_output_reg_en = '1') then
                    DATA_VLD <= NOT rx_parity_error AND UART_RXD;
                    FRAME_ERROR <= NOT UART_RXD;
                else
                    DATA_VLD <= '0';
                    FRAME_ERROR <= '0';
                end if;
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    -- UART RECEIVER FSM
    -- -------------------------------------------------------------------------

    -- PRESENT STATE REGISTER
    process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                rx_pstate <= idle;
            else
                rx_pstate <= rx_nstate;
            end if;
        end if;
    end process;

    -- NEXT STATE AND OUTPUTS LOGIC
    process (rx_pstate, UART_RXD, rx_clk_en, rx_bit_count)
    begin
        case rx_pstate is

            when idle =>
                rx_output_reg_en <= '0';
                rx_bit_count_en <= '0';
                rx_data_shreg_en <= '0';
                rx_clk_divider_en <= '0';
                rx_parity_check_en <= '0';

                if (UART_RXD = '0') then
                    rx_nstate <= startbit;
                else
                    rx_nstate <= idle;
                end if;

            when startbit =>
                rx_output_reg_en <= '0';
                rx_bit_count_en <= '0';
                rx_data_shreg_en <= '0';
                rx_clk_divider_en <= '1';
                rx_parity_check_en <= '0';

                if (rx_clk_en = '1') then
                    rx_nstate <= databits;
                else
                    rx_nstate <= startbit;
                end if;

            when databits =>
                rx_output_reg_en <= '0';
                rx_bit_count_en <= '1';
                rx_data_shreg_en <= '1';
                rx_clk_divider_en <= '1';
                rx_parity_check_en <= '0';

                if ((rx_clk_en = '1') AND (rx_bit_count = "111")) then
                    if (PARITY_BIT = "none") then
                        rx_nstate <= stopbit;
                    else
                        rx_nstate <= paritybit;
                    end if ;
                else
                    rx_nstate <= databits;
                end if;

            when paritybit =>
                rx_output_reg_en <= '0';
                rx_bit_count_en <= '0';
                rx_data_shreg_en <= '0';
                rx_clk_divider_en <= '1';
                rx_parity_check_en <= '1';

                if (rx_clk_en = '1') then
                    rx_nstate <= stopbit;
                else
                    rx_nstate <= paritybit;
                end if;

            when stopbit =>
                rx_bit_count_en <= '0';
                rx_data_shreg_en <= '0';
                rx_clk_divider_en <= '1';
                rx_parity_check_en <= '0';

                if (rx_clk_en = '1') then
                    rx_nstate <= idle;
                    rx_output_reg_en <= '1';
                else
                    rx_nstate <= stopbit;
                    rx_output_reg_en <= '0';
                end if;

            when others =>
                rx_output_reg_en <= '0';
                rx_bit_count_en <= '0';
                rx_data_shreg_en <= '0';
                rx_clk_divider_en <= '0';
                rx_parity_check_en <= '0';
                rx_nstate <= idle;

        end case;
    end process;

end FULL;
