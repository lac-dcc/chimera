-------------------------------------------------------------------------------
-- TOP
-- This top level component is designed for the Spartan 6 LX9 Microboard
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    generic (
        baud                : positive;
        clock_frequency     : positive
    );
    port (  
        clock_y3                :   in      std_logic;
        user_reset              :   in      std_logic;    
        usb_rs232_rxd           :   in      std_logic;
        usb_rs232_txd           :   out     std_logic
    );
end top;

architecture rtl of top is
    component loopback is
        generic (
            baud                : positive;
            clock_frequency     : positive
        );
        port(  
            clock                   :   in      std_logic;
            reset                   :   in      std_logic;    
            rx                      :   in      std_logic;
            tx                      :   out     std_logic
        );
    end component loopback;
    signal tx, rx, rx_sync, reset, reset_sync : std_logic;
begin
    ----------------------------------------------------------------------------
    -- Loopback instantiation
    ----------------------------------------------------------------------------
    loopback_inst1 : loopback
    generic map (
        baud                => baud,
        clock_frequency     => clock_frequency
    )
    port map (  
        clock       => clock_y3,
        reset       => reset, 
        rx          => rx,
        tx          => tx
    );
    ----------------------------------------------------------------------------
    -- Deglitch inputs
    ----------------------------------------------------------------------------
    deglitch : process (clock_y3)
    begin
        if rising_edge(clock_y3) then
            rx_sync         <= usb_rs232_rxd;
            rx              <= rx_sync;
            reset_sync      <= user_reset;
            reset           <= reset_sync;
            usb_rs232_txd   <= tx;
        end if;
    end process;
end rtl;