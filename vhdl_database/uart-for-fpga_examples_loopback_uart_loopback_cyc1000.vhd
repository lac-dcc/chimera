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

-- UART LOOPBACK EXAMPLE TOP MODULE FOR CYC1000 BOARD
-- ==================================================
-- UART FOR FPGA REQUIRES: 1 START BIT, 8 DATA BITS, 1 STOP BIT!!!
-- OTHER PARAMETERS CAN BE SET USING GENERICS.

entity UART_LOOPBACK_CYC1000 is
    Generic (
        CLK_FREQ      : integer := 12e6;   -- set system clock frequency in Hz
        BAUD_RATE     : integer := 115200; -- baud rate value
        PARITY_BIT    : string  := "none"; -- legal values: "none", "even", "odd", "mark", "space"
        USE_DEBOUNCER : boolean := True    -- enable/disable debouncer
    );
    Port (
        CLK_12M   : in  std_logic; -- system clock 12 MHz
        RST_BTN_N : in  std_logic; -- low active reset button
        -- UART INTERFACE
        UART_TXD  : out std_logic;
        UART_RXD  : in  std_logic
    );
end entity;

architecture RTL of UART_LOOPBACK_CYC1000 is

    signal rst_btn : std_logic;
    signal reset   : std_logic;
    signal data    : std_logic_vector(7 downto 0);
    signal valid   : std_logic;

begin

    rst_btn <= not RST_BTN_N;

    rst_sync_i : entity work.RST_SYNC
    port map (
        CLK        => CLK_12M,
        ASYNC_RST  => rst_btn,
        SYNCED_RST => reset
    );

	uart_i: entity work.UART
    generic map (
        CLK_FREQ      => CLK_FREQ,
        BAUD_RATE     => BAUD_RATE,
        PARITY_BIT    => PARITY_BIT,
        USE_DEBOUNCER => USE_DEBOUNCER
    )
    port map (
        CLK          => CLK_12M,
        RST          => reset,
        -- UART INTERFACE
        UART_TXD     => UART_TXD,
        UART_RXD     => UART_RXD,
        -- USER DATA INPUT INTERFACE
        DIN          => data,
        DIN_VLD      => valid,
        DIN_RDY      => open,
        -- USER DATA OUTPUT INTERFACE
        DOUT         => data,
        DOUT_VLD     => valid,
        FRAME_ERROR  => open,
        PARITY_ERROR => open
    );

end architecture;
