-------------------------------------------------------------------------------- 
-- Copyright (c) 2010 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow
--  \   \        Filename: $RCSfile: v6gtx_sdi_control.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-10-20 10:32:19-06 $
-- /___/   /\    Date Created: January 4, 2010
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: v6gtx_sdi_control.vhd,rcs $
-- Revision 1.2  2010-10-20 10:32:19-06  jsnow
-- The "do" port was renamed "drpdo" because "do" is a reserved
-- keyword in SystemVerilog. The GTXTEST[1] signal is no pulsed
-- twice after TXPLLLKDET goes high to properly initialize the GTX TX.
-- The default value for PMA_RX_CFG_3G has been changed to the
-- new recommended value for 3G-SDI.
--
-- Revision 1.1  2010-03-11 16:44:42-07  jsnow
-- The txpll_div_rst port has been replaced with a 13-bit GTXTEST
-- port that can be connected directly to the GTXTEST port of the
-- GTX wrapper.
--
-- Revision 1.0  2010-03-08 14:15:18-07  jsnow
-- Initial release.
--
-------------------------------------------------------------------------------- 
--   
-- LIMITED WARRANTY AND DISCLAMER. These designs are provided to you "as is" or 
-- as a template to make your own working designs exclusively with Xilinx
-- products. Xilinx and its licensors make and you receive no warranties or 
-- conditions, express, implied, statutory or otherwise, and Xilinx specifically
-- disclaims any implied warranties of merchantability, non-infringement, or 
-- fitness for a particular purpose. Xilinx does not warrant that the functions 
-- contained in these designs will meet your requirements, or that the operation
-- of these designs will be uninterrupted or error free, or that defects in the 
-- Designs will be corrected. Furthermore, Xilinx does not warrant or make any 
-- representations regarding use or the results of the use of the designs in 
-- terms of correctness, accuracy, reliability, or otherwise. The designs are 
-- not covered by any other agreement that you may have with Xilinx. 
--
-- LIMITATION OF LIABILITY. In no event will Xilinx or its licensors be liable 
-- for any damages, including without limitation direct, indirect, incidental, 
-- special, reliance or consequential damages arising from the use or operation 
-- of the designs or accompanying documentation, however caused and on any 
-- theory of liability. This limitation will apply even if Xilinx has been 
-- advised of the possibility of such damage. This limitation shall apply 
-- not-withstanding the failure of the essential purpose of any limited remedies
-- herein.
-------------------------------------------------------------------------------- 
--
-- Module Description:
--
-- This module handles general control of SDI mode changes for the Virtex-6 GTX 
-- transceiver. It also contains the RX input bit rate detection module.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity v6gtx_sdi_control is
generic (
    -- This group of generics specifies the PMA_RX_CFG to be used for each of
    -- the three SDI modes of operation: HD, SD, and 3G. Normally, the default
    -- values given here should be used.
    --
    PMA_RX_CFG_HD :         std_logic_vector(27 downto 0) := X"05CE055";    -- HD-SDI CDR setting
    PMA_RX_CFG_SD :         std_logic_vector(27 downto 0) := X"0f44000";    -- SD-SDI CDR setting
    PMA_RX_CFG_3G :         std_logic_vector(27 downto 0) := X"05CE04D";    -- 3G-SDI CDR setting

    -- 
    -- This generic specifies the frequency of the clock used to drive the DRP
    -- port and to detect the HD and 3G bit rates. The default value is 32 MHz.
    --
    DRPCLK_FREQ :           integer := 32000000;

    --
    -- The following generics specify the RX and TX PMA PLL output divisor used
    -- for 3G (and SD) mode and for HD mode. 
    --
    TX_PLL_OUT_DIV_HD :     integer := 2;       -- legal values are 4 and 2
    TX_PLL_OUT_DIV_3G :     integer := 1;       -- legal values are 2 and 1
    RX_PLL_OUT_DIV_HD :     integer := 2;       -- legal values are 4 and 2
    RX_PLL_OUT_DIV_3G :     integer := 1);      -- legal values are 2 and 1         

port (
    drpclk :                in  std_logic;                           -- DRP clock
    rst :                   in  std_logic;                           -- synchronous reset input

-- TX related signals
    txusrclk :              in  std_logic;                           -- TXUSRCLK2 clock signal
    tx_mode :               in  std_logic_vector(1 downto 0);        -- TX mode select: 00=HD, 01=SD, 10=3G
    txreset_in :            in  std_logic;                           -- resets the GTX transmitter
    txresetdone :           in  std_logic;                           -- connect to TXRESETDONE port of GTX
    txbufstatus1 :          in  std_logic;                           -- connect to TXBUFSTATUS(1) port of GTX
    txplllkdet :            in  std_logic;                           -- connect to TXPLLLKDET of GTX
    txreset_out :           out std_logic;                           -- connect to the TXRESET port of GTX
    gtxtest :               out std_logic_vector(12 downto 0);       -- connect to GTXTEST port of GTX
    tx_rate_change_done :   out std_logic;                           -- low during changes of the TX RATE
    tx_slew :               out std_logic := '0';                    -- slew rate control for SDI cable driver

-- RX related signals
    rxusrclk :              in  std_logic;                           -- RXUSRCLK2 clock signal
    rx_mode :               in  std_logic_vector(1 downto 0);        -- RX mode select: 00=HD, 01=SD, 10=3G
    rxresetdone :           in  std_logic;                           -- connect to RXRESETDONE port of GTX
    rxbufstatus2 :          in  std_logic;                           -- connect to RXBUFSTATUS(2) port of GTX
    rxratedone :            in  std_logic;                           -- connect to RXRATEDONE port of the GTX
    rxcdrreset :            out std_logic := '0';                    -- connect to RXCDRRESET port of GTX
    rxbufreset :            out std_logic;                           -- connect to RXBUFRESET port of GTX
    rxrate :                out std_logic_vector(1 downto 0) := "00";-- connect to RXRATE port of GTX
    rx_m :                  out std_logic;                           -- indicates received bit rate: 
                                                                     --   1 = /1.001 rate 0 = /1 rate
-- DRP port signals
    drpdo :                 in  std_logic_vector(15 downto 0);       -- connect to DRPDO port of GTX
    drdy :                  in  std_logic;                           -- connect to DRDY port of GTX
    daddr :                 out std_logic_vector(7 downto 0);        -- connect to DADDR port of GTX
    di :                    out std_logic_vector(15 downto 0);       -- connect to DI port of GTX
    den :                   out std_logic;                           -- connect to DEN port of GTX
    dwe :                   out std_logic);                          -- connect to DWE port of GTX

end v6gtx_sdi_control;

architecture rtl of v6gtx_sdi_control is
    
--
-- These constants define the RX & TX PLL output divider values to use for
-- dividing the PLL output clock by 4, 2, and 1.
--
constant PLL_DIV_4 :    std_logic_vector(1 downto 0) := "01";
constant PLL_DIV_2 :    std_logic_vector(1 downto 0) := "10";
constant PLL_DIV_1 :    std_logic_vector(1 downto 0) := "11";

--
-- These constants define the encoding of the tx_mode and rx_mode ports.
--
constant MODE_HD :      std_logic_vector(1 downto 0) := "00";
constant MODE_SD :      std_logic_vector(1 downto 0) := "01";
constant MODE_3G :      std_logic_vector(1 downto 0) := "10";

--
-- State definitions for TX rate change state machine.
--
type STATE_TYPE is (
    INIT1_STATE,
    INIT2_STATE,
    INIT3_STATE,
    INIT4_STATE,
    INIT5_STATE,
    INIT6_STATE,
    INIT7_STATE,
    INIT8_STATE,
    WAIT_STATE,
    CHANGE_STATE,
    WAIT1_STATE,
    DIV_RST1_STATE,
    DIV_RST2_STATE,
    DIV_RST3_STATE,
    WAIT2_STATE,
    TX_RST1_STATE,
    TX_RST2_STATE,
    TX_RST3_STATE,
    WAIT3_STATE,
    DONE_STATE);

--
-- These constants specify the timeout count values for the FSM's dly_counter.
-- The dly_counter is clocked by DRPCLK_FREQ, so the timeout values are derived
-- from the DRPCLK_FREQ generic. TIMEOUT_10_US is the 10 microsecond timeout
-- value. It is padded by 100 clock cycles to allow for the time it takes the
-- DRP controller to switch the TX PLL output divider through the DRP port.
-- TIMEOUT_32_TXUSRCLK is a delay value that exceeds 32 cycles of TXUSRCLK2
-- when running at its slowest frequency (74.25/1.001 MHz). Because TXUSRCLK2
-- can stop during the rate change process, the drpclk is used to generate a
-- delay that exceeds the worst case period of 32 TXUSRCLK2 cycles, assuming
-- TXUSRCLK2 never stopped.
--
-- The DLYCNT_TYPE defines the width of the delay counter. An 11 bit counter is 
-- wide enough to generate a 10 microsecond delay with the fastest allowed DRP 
-- clock frequency of 175 MHz (-3 speedgrade V6 part max DRP clock frequency).
-- Never set DLYCNT_MSB to less than 10 because all 11 bits are used as part
-- of the FSM algorithm.
--

constant TIMEOUT_10_US :        integer := DRPCLK_FREQ / 100000 + 100;
constant TIMEOUT_32_TXUSRCLK :  integer := DRPCLK_FREQ / 2314815;
subtype DLYCNT_TYPE is unsigned(10 downto 0);           -- Must always be at least 11 bits

--
-- Internal signal definitions
--

signal tx_rate_hd :             std_logic_vector(1 downto 0);
signal tx_rate_3g :             std_logic_vector(1 downto 0);
signal rx_rate_hd :             std_logic_vector(1 downto 0);
signal rx_rate_3g :             std_logic_vector(1 downto 0);

signal rst_drpclk_sync_reg :    std_logic_vector(1 downto 0) := "00";   -- synchronizes rst to drpclk
signal rst_drpclk_sync :        std_logic;                              -- rst synchronized to drpclk

signal current_state :          STATE_TYPE := INIT1_STATE;              -- FSM current state
signal next_state :             STATE_TYPE;                             -- FSM next state

signal txresetdone_sync_reg :   std_logic_vector(1 downto 0) := "00";   -- synchronizes txresetdone to drpclk
signal txresetdone_sync :       std_logic;                              -- txresetdone synchronized to drpclk

signal tx_mode_reg :            std_logic_vector(1 downto 0) := MODE_HD;-- tx_mode input reg
signal tx_mode_sync_reg :       std_logic_vector(1 downto 0) := MODE_HD;-- tx_mode sync reg

signal tx_rate :                std_logic_vector(1 downto 0) := "10";   -- holds the current value of tx_rate
signal tx_rate_last :           std_logic_vector(1 downto 0) := "10";   -- last value of tx_rate
signal tx_rate_changed :        std_logic;                              -- 1 when tx_rate and tx_rate_last differ
signal ld_tx_rate_last :        std_logic;                              -- FSM output that loads tx_rate_last

signal set_pll_div_rst :        std_logic;                              -- FSM output that sets txpll_div_rst
signal clr_pll_div_rst :        std_logic;                              -- FSM output that clears txpll_div_rst
signal do_txreset :             std_logic := '0';                       -- FSM initiated txreset signal
signal set_do_txreset :         std_logic;                              -- FSM output that sets do_txreset
signal clr_do_txreset :         std_logic;                              -- FSM output that clears do_txreset

signal sync_txreset :           std_logic_vector(1 downto 0) := "00";   -- do_txreset synchronized to txusrclk
signal dly_counter :            DLYCNT_TYPE := (others => '0');         -- FSM delay counter
signal clr_dly_counter :        std_logic;                              -- clears delay counter
signal to_10_us :               std_logic;                              -- 10 microsecond timeout signal
signal to_32_txusrclk :         std_logic;                              -- 32 txusrclk cycle timeout signal
signal to_10_us_value :         DLYCNT_TYPE;
signal to_32_txusrclk_value :   DLYCNT_TYPE;

signal set_txratedone :         std_logic;                              -- FSM output that sets txratedone
signal clr_txratedone :         std_logic;                              -- FSM output that clears txratedone
signal txratedone :             std_logic := '1';                       -- internal drpclk sync version of tx_rate_change_done
signal txratedone_sync :        std_logic_vector(1 downto 0) := "00";

signal last_rx_rate :           std_logic_vector(1 downto 0) := "00";   -- holds last value of rx_rate
signal rx_rate_int :            std_logic_vector(1 downto 0) := "00";   -- internal version of rx_rate
signal rate_change :            std_logic;
signal rate_change_capture :    std_logic := '0';
signal rate_change_sync :       std_logic_vector(1 downto 0) := "00";
signal txpll_div_rst :          std_logic := '0';

signal txplllkdet_sync :        std_logic_vector(1 downto 0) := "00";

signal rst_drpctrl :            std_logic := '1';
begin

assert DLYCNT_TYPE'length >= 11 
    report "DLYCNT_TYPE must be at least 11 bits wide." severity FAILURE;

tx_rate_hd <= PLL_DIV_4 when TX_PLL_OUT_DIV_HD = 4 else PLL_DIV_2;
tx_rate_3g <= PLL_DIV_2 when TX_PLL_OUT_DIV_3G = 2 else PLL_DIV_1;
rx_rate_hd <= PLL_DIV_4 when RX_PLL_OUT_DIV_HD = 4 else PLL_DIV_2;
rx_rate_3g <= PLL_DIV_2 when RX_PLL_OUT_DIV_3G = 2 else PLL_DIV_1;

process(drpclk)
begin
    if rising_edge(drpclk) then
        rst_drpclk_sync_reg <= (rst_drpclk_sync_reg(0) & rst);
    end if;
end process;

rst_drpclk_sync <= rst_drpclk_sync_reg(1);

--
-- DRP controller
--
process(drpclk)
begin
    if rising_edge(drpclk) then
        if rst_drpclk_sync = '1' then
            rst_drpctrl <= '1';
        elsif rxresetdone = '1' and txresetdone = '1' then
            rst_drpctrl <= '0';
        end if;
    end if;
end process;

DRPCTRL : entity work.v6gtx_sdi_drp_control
generic map (
    PMA_RX_CFG_HD       => PMA_RX_CFG_HD,
    PMA_RX_CFG_SD       => PMA_RX_CFG_SD,
    PMA_RX_CFG_3G       => PMA_RX_CFG_3G)
port map (
    clk         => drpclk,
    rst         => rst_drpctrl,
    rx_mode     => rx_mode,
    tx_rate     => tx_rate,
    drpdo       => drpdo,
    drdy        => drdy,
    daddr       => daddr,
    di          => di,
    den         => den,
    dwe         => dwe);
         
--------------------------------------------------------------------------------
-- RX control logic
--
process(rx_mode, rx_rate_hd, rx_rate_3g)
begin
    if rx_mode = MODE_HD then
        rx_rate_int <= rx_rate_hd;
    else
        rx_rate_int <= rx_rate_3g;
    end if;
end process;

process(rxusrclk)
begin
    if rising_edge(rxusrclk) then
        rxrate <= rx_rate_int;
    end if;
end process;

process(rxusrclk)
begin
    if rising_edge(rxusrclk) then
        if rx_mode = MODE_SD then
            rxcdrreset <= rxratedone;
        else
            rxcdrreset <= rxratedone or rate_change_sync(1);
        end if;
    end if;
end process;

rxbufreset <= rxbufstatus2;

--------------------------------------------------------------------------------
-- RX input rate detection
--
RATE0 : entity work.v6gtx_sdi_rate_detect
generic map (
    REFCLK_FREQ     => DRPCLK_FREQ)
port map (
    refclk      => drpclk,
    recvclk     => rxusrclk,
    std         => rx_mode(1),
    rate_change => rate_change,
    enable      => rxresetdone,
    drift       => open,
    rate        => rx_m);

--
-- Rate change synchronizer and pulse stretcher
--
process(rxusrclk, rate_change)
begin
    if rate_change = '1' then
        rate_change_capture <= '1';
    elsif rising_edge(rxusrclk) then
        if rate_change_sync(1) = '1' then
            rate_change_capture <= '0';
        end if;
    end if;
end process;

process(rxusrclk)
begin
    if rising_edge(rxusrclk) then
        rate_change_sync <= (rate_change_sync(0) & rate_change_capture);
    end if;
end process;

--------------------------------------------------------------------------------
-- TX control logic
--

--
-- tx_mode input & sync registers
--
process(drpclk)
begin
    if rising_edge(drpclk) then
        tx_mode_reg <= tx_mode;
        tx_mode_sync_reg <= tx_mode_reg;
    end if;
end process;

process(drpclk)
begin
    if rising_edge(drpclk) then
        if tx_mode_sync_reg = MODE_SD then
            tx_slew <= '1';
        else
            tx_slew <= '0';
        end if;
    end if;
end process;
--
-- tx_rate & tx_rate_last registers
--
process(drpclk)
begin
    if rising_edge(drpclk) then
        if tx_mode_sync_reg = MODE_HD then
            tx_rate <= tx_rate_hd;
        else
            tx_rate <= tx_rate_3g;
        end if;
    end if;
end process;

process(drpclk)
begin
    if rising_edge(drpclk) then
        if ld_tx_rate_last = '1' then
            tx_rate_last <= tx_rate;
        end if;
    end if;
end process;

tx_rate_changed <= '1' when tx_rate /= tx_rate_last else '0';

--
-- txresetdone input signal synchronization
--
process(drpclk)
begin
    if rising_edge(drpclk) then
        txresetdone_sync_reg <= (txresetdone_sync_reg(0) & txresetdone);
    end if;
end process;

txresetdone_sync <= txresetdone_sync_reg(1);

--
-- FSM delay timer
--
process(drpclk)
begin
    if rising_edge(drpclk) then
        if clr_dly_counter = '1' then
            dly_counter <= (others => '0');
        else
            dly_counter <= dly_counter + 1;
        end if;
    end if;
end process;

to_10_us_value <= to_unsigned(TIMEOUT_10_US, to_10_us_value'length);
to_10_us <= '1' when dly_counter = to_10_us_value else '0';

to_32_txusrclk_value <= to_unsigned(TIMEOUT_32_TXUSRCLK, to_32_txusrclk_value'length);
to_32_txusrclk <= '1' when dly_counter = to_32_txusrclk_value else '0';

--
-- TX reset control
--
txreset_out <= txreset_in or sync_txreset(1) or txbufstatus1;

process(drpclk)
begin
    if rising_edge(drpclk) then
        if set_do_txreset = '1' then
            do_txreset <= '1';
        elsif clr_do_txreset = '1' then
            do_txreset <= '0';
        end if;
    end if;
end process;

process(txusrclk)
begin
    if rising_edge(txusrclk) then
        sync_txreset <= (sync_txreset(0) & do_txreset);
    end if;
end process;

process(drpclk)
begin
    if rising_edge(drpclk) then
        if set_pll_div_rst = '1' then
            txpll_div_rst <= '1';
        elsif clr_pll_div_rst = '1' then
            txpll_div_rst <= '0';
        end if;
    end if;
end process;

gtxtest <= ("10000000000" & txpll_div_rst & '0');

--
-- tx_rate_change_done generation
--
process(drpclk)
begin
    if rising_edge(drpclk) then
        if set_txratedone = '1' then
            txratedone <= '1';
        elsif clr_txratedone = '1' then
            txratedone <= '0';
        end if;
    end if;
end process;

process(txusrclk)
begin
    if rising_edge(txusrclk) then
        txratedone_sync <= (txratedone_sync(0) & txratedone);
    end if;
end process;

tx_rate_change_done <= txratedone_sync(1);

--
-- TXPLLLKDET synchronizer
--
process(drpclk)
begin
    if rising_edge(drpclk) then
        txplllkdet_sync <= (txplllkdet_sync(0) & txplllkdet);
    end if;
end process;

--
-- TX control state machine
--
-- This FSM controls the GTXTEST[1] and TXRESET signals used to properly control
-- the GTX TX under two conditions. First, when the GTX TXPLLLKDET signal 
-- transitions from low to high, the FSM waits for 1024 cycles of the DRP clock 
-- then pulses the GTXTEST[1] bit high twice, for 256 clock cycles each time 
-- with a delay of 256 clock cycles between pulses. This is required to insure 
-- that the TX PLL output divider is properly initialized. Second, whenever the 
-- TX PLL output divider is changed to switch between HD-SDI mode and either 
-- 3G-SDI or SD-SDI modes, the FSM implements the required reset algorithm which
-- involves waiting at least 10 ms, pulsing the GTXTEST[1] bit high for the 
-- equivalent of 32 TXUSRCLK cycles, waiting for at least 32 TXUSRCLK cycles, 
-- then pulsing TXRESET high for at least one TXUSRCLK cycle.
--

--
-- FSM current state register
-- 
process(drpclk)
begin
    if rising_edge(drpclk) then
        if rst_drpclk_sync = '1' or txplllkdet_sync(1) = '0' then
            current_state <= INIT1_STATE;
        else
            current_state <= next_state;
        end if;
    end if;
end process;

--
-- FSM next state logic
--
process(current_state, txresetdone_sync, tx_rate_changed, to_10_us, to_32_txusrclk, 
        txplllkdet_sync(1), dly_counter(10), dly_counter(8))
begin
    case current_state is
        when INIT1_STATE => 
            if txplllkdet_sync(1) = '1' then
                next_state <= INIT2_STATE;
            else
                next_state <= INIT1_STATE;
            end if;

        when INIT2_STATE => 
            if dly_counter(10) = '1' then
                next_state <= INIT3_STATE;
            else
                next_state <= INIT2_STATE;
            end if;

        when INIT3_STATE => 
            next_state <= INIT4_STATE;
                
        when INIT4_STATE => 
            if dly_counter(8) = '1' then
                next_state <= INIT5_STATE;
            else
                next_state <= INIT4_STATE;
            end if;

        when INIT5_STATE => 
            next_state <= INIT6_STATE;

        when INIT6_STATE => 
            if dly_counter(8) = '1' then
                next_state <= INIT7_STATE;
            else
                next_state <= INIT6_STATE;
            end if;

        when INIT7_STATE => 
            next_state <= INIT8_STATE;

        when INIT8_STATE => 
            if dly_counter(8) = '1' then
                next_state <= WAIT_STATE;
            else
                next_state <= iNIT8_STATE;
            end if;

        when WAIT_STATE =>
            if txresetdone_sync = '1' and tx_rate_changed = '1' then
                next_state <= CHANGE_STATE;
            else
                next_state <= WAIT_STATE;
            end if;

        when CHANGE_STATE => 
            next_state <= WAIT1_STATE;

        when WAIT1_STATE => 
            if to_10_us = '1' then
                next_state <= DIV_RST1_STATE;
            else
                next_state <= WAIT1_STATE;
            end if;

        when DIV_RST1_STATE => 
            next_state <= DIV_RST2_STATE;

        when DIV_RST2_STATE => 
            if to_32_txusrclk = '1' then
                next_state <= DIV_RST3_STATE;
            else
                next_state <= DIV_RST2_STATE;
            end if;

        when DIV_RST3_STATE => 
            next_state <= WAIT2_STATE;

        when WAIT2_STATE => 
            if to_32_txusrclk = '1' then
                next_state <= TX_RST1_STATE;
            else
                next_state <= WAIT2_STATE;
            end if;

        when TX_RST1_STATE => 
            next_state <= TX_RST2_STATE;

        when TX_RST2_STATE => 
            next_state <= TX_RST3_STATE;

        when TX_RST3_STATE => 
            next_state <= WAIT3_STATE;

        when WAIT3_STATE => 
            if txresetdone_sync = '1' then
                next_state <= DONE_STATE;
            else
                next_state <= WAIT3_STATE;
            end if;

        when DONE_STATE => 
            next_state <= WAIT_STATE;

        when others => 
            next_state <= WAIT_STATE;
    end case;
end process;

--
-- FSM output logic
--
process(current_state)
begin
    ld_tx_rate_last <= '0';
    clr_dly_counter <= '0';
    set_pll_div_rst <= '0';
    clr_pll_div_rst <= '0';
    set_do_txreset  <= '0';
    clr_do_txreset  <= '0';
    clr_txratedone  <= '0';
    set_txratedone  <= '0';

    case current_state is
        when INIT1_STATE => 
            clr_dly_counter <= '1';
            clr_pll_div_rst <= '1';
            clr_do_txreset <= '1';

        when INIT3_STATE => 
            set_pll_div_rst <= '1';
            clr_dly_counter <= '1';

        when INIT5_STATE => 
            clr_pll_div_rst <= '1';
            clr_dly_counter <= '1';

        when INIT7_STATE => 
            set_pll_div_rst <= '1';
            clr_dly_counter <= '1';

        when WAIT_STATE => 
            clr_pll_div_rst <= '1';

        when CHANGE_STATE =>
            ld_tx_rate_last <= '1';
            clr_dly_counter <= '1';
            clr_txratedone  <= '1';

        when DIV_RST1_STATE => 
            set_pll_div_rst <= '1';
            clr_dly_counter <= '1';

        when DIV_RST3_STATE => 
            clr_pll_div_rst <= '1';
            clr_dly_counter <= '1';

        when TX_RST1_STATE => 
            set_do_txreset <= '1';

        when TX_RST3_STATE => 
            clr_do_txreset <= '1';

        when DONE_STATE => 
            set_txratedone <= '1';

        when others => 

    end case;
end process;

end rtl;
