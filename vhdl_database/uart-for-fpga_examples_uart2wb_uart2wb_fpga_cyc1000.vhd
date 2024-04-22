--------------------------------------------------------------------------------
-- PROJECT: SIMPLE UART FOR FPGA
--------------------------------------------------------------------------------
-- AUTHORS: Jakub Cabal <jakubcabal@gmail.com>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/uart-for-fpga
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- TOP MODULE OF UART 2 WISHBONE EXAMPLE FOR CYC1000 BOARD
-- =======================================================

entity UART2WB_FPGA_CYC1000 is
    Port (
        CLK_12M   : in  std_logic; -- system clock 12 MHz
        RST_BTN_N : in  std_logic; -- low active reset button
        -- UART INTERFACE
        UART_RXD  : in  std_logic;
        UART_TXD  : out std_logic
    );
end entity;

architecture RTL of UART2WB_FPGA_CYC1000 is

    signal rst_btn       : std_logic;
    signal reset         : std_logic;

    signal wb_cyc        : std_logic;
    signal wb_stb        : std_logic;
    signal wb_we         : std_logic;
    signal wb_addr       : std_logic_vector(15 downto 0);
    signal wb_dout       : std_logic_vector(31 downto 0);
    signal wb_stall      : std_logic;
    signal wb_ack        : std_logic;
    signal wb_din        : std_logic_vector(31 downto 0);

    signal debug_reg_sel : std_logic;
    signal debug_reg_we  : std_logic;
    signal debug_reg     : std_logic_vector(31 downto 0);

begin

    rst_btn <= not RST_BTN_N;

    rst_sync_i : entity work.RST_SYNC
    port map (
        CLK        => CLK_12M,
        ASYNC_RST  => rst_btn,
        SYNCED_RST => reset
    );

    uart2wbm_i : entity work.UART2WBM
    generic map (
        CLK_FREQ  => 12e6,
        BAUD_RATE => 9600
    )
    port map (
        CLK      => CLK_12M,
        RST      => reset,
        -- UART INTERFACE
        UART_TXD => UART_TXD,
        UART_RXD => UART_RXD,
        -- WISHBONE MASTER INTERFACE
        WB_CYC   => wb_cyc,
        WB_STB   => wb_stb,
        WB_WE    => wb_we,
        WB_ADDR  => wb_addr,
        WB_DOUT  => wb_din,
        WB_STALL => wb_stall,
        WB_ACK   => wb_ack,
        WB_DIN   => wb_dout
    );

    debug_reg_sel <= '1' when (wb_addr = X"0004") else '0';
    debug_reg_we  <= wb_stb and wb_we and debug_reg_sel;

    debug_reg_p : process (CLK_12M)
    begin
        if (rising_edge(CLK_12M)) then
            if (debug_reg_we = '1') then
                debug_reg <= wb_din;
            end if;
        end if;
    end process;

    wb_stall <= '0';

    wb_ack_reg_p : process (CLK_12M)
    begin
        if (rising_edge(CLK_12M)) then
            wb_ack <= wb_cyc and wb_stb;
        end if;
    end process;

    wb_dout_reg_p : process (CLK_12M)
    begin
        if (rising_edge(CLK_12M)) then
            case wb_addr is
                when X"0000" =>
                    wb_dout <= X"20210406";
                when X"0004" =>
                    wb_dout <= debug_reg;
                when others =>
                    wb_dout <= X"DEADCAFE";
            end case;
        end if;
    end process;

end architecture;
