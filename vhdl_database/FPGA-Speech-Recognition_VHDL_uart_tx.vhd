library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UART_TX is
    Generic (
        PARITY_BIT  : string := "none" -- legal values: "none", "even", "odd", "mark", "space"
    );
    Port (
        CLK         : in  std_logic; -- system clock
        RST         : in  std_logic; -- high active synchronous reset
        -- UART INTERFACE
        UART_CLK_EN : in  std_logic; -- oversampling (16x) UART clock enable
        UART_TXD    : out std_logic;
        -- USER DATA INPUT INTERFACE
        DATA_IN     : in  std_logic_vector(7 downto 0);
        DATA_SEND   : in  std_logic; -- when DATA_SEND = 1, data on DATA_IN will be transmit, DATA_SEND can set to 1 only when BUSY = 0
        BUSY        : out std_logic  -- when BUSY = 1 transiever is busy, you must not set DATA_SEND to 1
    );
end UART_TX;

architecture FULL of UART_TX is

    signal tx_clk_en         : std_logic;
    signal tx_clk_divider_en : std_logic;
    signal tx_ticks          : unsigned(3 downto 0);
    signal tx_data           : std_logic_vector(7 downto 0);
    signal tx_bit_count      : unsigned(2 downto 0);
    signal tx_bit_count_en   : std_logic;
    signal tx_busy           : std_logic;
    signal tx_parity_bit     : std_logic;
    signal tx_data_out_sel   : std_logic_vector(1 downto 0);

    type state is (idle, txsync, startbit, databits, paritybit, stopbit);
    signal tx_pstate : state;
    signal tx_nstate : state;

begin

    BUSY <= tx_busy;

    -- -------------------------------------------------------------------------
    -- UART TRANSMITTER CLOCK DIVIDER
    -- -------------------------------------------------------------------------

    uart_tx_clk_divider : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (tx_clk_divider_en = '1') then
                if (uart_clk_en = '1') then
                    if (tx_ticks = "1111") then
                        tx_ticks <= (others => '0');
                        tx_clk_en <= '0';
                    elsif (tx_ticks = "0001") then
                        tx_ticks <= tx_ticks + 1;
                        tx_clk_en <= '1';
                    else
                        tx_ticks <= tx_ticks + 1;
                        tx_clk_en <= '0';
                    end if;
                else
                    tx_ticks <= tx_ticks;
                    tx_clk_en <= '0';
                end if;
            else
                tx_ticks <= (others => '0');
                tx_clk_en <= '0';
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    -- UART TRANSMITTER INPUT DATA REGISTER
    -- -------------------------------------------------------------------------

    uart_tx_input_data_reg : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                tx_data <= (others => '0');
            elsif (DATA_SEND = '1' AND tx_busy = '0') then
                tx_data <= DATA_IN;
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    -- UART TRANSMITTER BIT COUNTER
    -- -------------------------------------------------------------------------

    uart_tx_bit_counter : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                tx_bit_count <= (others => '0');
            elsif (tx_bit_count_en = '1' AND tx_clk_en = '1') then
                if (tx_bit_count = "111") then
                    tx_bit_count <= (others => '0');
                else
                    tx_bit_count <= tx_bit_count + 1;
                end if;
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    -- UART TRANSMITTER PARITY GENERATOR
    -- -------------------------------------------------------------------------

    uart_tx_parity_g : if (PARITY_BIT /= "none") generate
        uart_tx_parity_gen_i: entity work.UART_PARITY
        generic map (
            DATA_WIDTH  => 8,
            PARITY_TYPE => PARITY_BIT
        )
        port map (
            DATA_IN     => tx_data,
            PARITY_OUT  => tx_parity_bit
        );
    end generate;

    uart_tx_noparity_g : if (PARITY_BIT = "none") generate
        tx_parity_bit <= 'Z';
    end generate;

    -- -------------------------------------------------------------------------
    -- UART TRANSMITTER OUTPUT DATA REGISTER
    -- -------------------------------------------------------------------------

    uart_tx_output_data_reg : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                UART_TXD <= '1';
            else
                case tx_data_out_sel is
                    when "01" => -- START BIT
                        UART_TXD <= '0';
                    when "10" => -- DATA BITS
                        UART_TXD <= tx_data(to_integer(tx_bit_count));
                    when "11" => -- PARITY BIT
                        UART_TXD <= tx_parity_bit;
                    when others => -- STOP BIT OR IDLE
                        UART_TXD <= '1';
                end case;
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    -- UART TRANSMITTER FSM
    -- -------------------------------------------------------------------------

    -- PRESENT STATE REGISTER
    process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                tx_pstate <= idle;
            else
                tx_pstate <= tx_nstate;
            end if;
        end if;
    end process;

    -- NEXT STATE AND OUTPUTS LOGIC
    process (tx_pstate, DATA_SEND, tx_clk_en, tx_bit_count)
    begin

        case tx_pstate is

            when idle =>
                tx_busy <= '0';
                tx_data_out_sel <= "00";
                tx_bit_count_en <= '0';
                tx_clk_divider_en <= '0';

                if (DATA_SEND = '1') then
                    tx_nstate <= txsync;
                else
                    tx_nstate <= idle;
                end if;

            when txsync =>
                tx_busy <= '1';
                tx_data_out_sel <= "00";
                tx_bit_count_en <= '0';
                tx_clk_divider_en <= '1';

                if (tx_clk_en = '1') then
                    tx_nstate <= startbit;
                else
                    tx_nstate <= txsync;
                end if;

            when startbit =>
                tx_busy <= '1';
                tx_data_out_sel <= "01";
                tx_bit_count_en <= '0';
                tx_clk_divider_en <= '1';

                if (tx_clk_en = '1') then
                    tx_nstate <= databits;
                else
                    tx_nstate <= startbit;
                end if;

            when databits =>
                tx_busy <= '1';
                tx_data_out_sel <= "10";
                tx_bit_count_en <= '1';
                tx_clk_divider_en <= '1';

                if ((tx_clk_en = '1') AND (tx_bit_count = "111")) then
                    if (PARITY_BIT = "none") then
                        tx_nstate <= stopbit;
                    else
                        tx_nstate <= paritybit;
                    end if ;
                else
                    tx_nstate <= databits;
                end if;

            when paritybit =>
                tx_busy <= '1';
                tx_data_out_sel <= "11";
                tx_bit_count_en <= '0';
                tx_clk_divider_en <= '1';

                if (tx_clk_en = '1') then
                    tx_nstate <= stopbit;
                else
                    tx_nstate <= paritybit;
                end if;

            when stopbit =>
                tx_busy <= '0';
                tx_data_out_sel <= "00";
                tx_bit_count_en <= '0';
                tx_clk_divider_en <= '1';

                if (DATA_SEND = '1') then
                    tx_nstate <= txsync;
                elsif (tx_clk_en = '1') then
                    tx_nstate <= idle;
                else
                    tx_nstate <= stopbit;
                end if;

            when others =>
                tx_busy <= '1';
                tx_data_out_sel <= "00";
                tx_bit_count_en <= '0';
                tx_clk_divider_en <= '0';
                tx_nstate <= idle;

        end case;
    end process;

end FULL;
