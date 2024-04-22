-------------------------------------------------------------------------------- 
-- Copyright (c) 2010 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow
--  \   \        Filename: $RCSfile: v6gtx_sdi_drp_control.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-10-20 10:33:27-06 $
-- /___/   /\    Date Created: January 4, 2010
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: v6gtx_sdi_drp_control.vhd,rcs $
-- Revision 1.1  2010-10-20 10:33:27-06  jsnow
-- The "do" port was renamed "drpdo" because "do" is a reserved
-- keyword in SystemVerilog. The GTXTEST[1] signal is no pulsed
-- twice after TXPLLLKDET goes high to properly initialize the GTX TX.
-- The default value for PMA_RX_CFG_3G has been changed to the
-- new recommended value for 3G-SDI. The "di", "den", and "dwe"
-- output ports are now registered to provided extra timing margin.
--
-- Revision 1.0  2010-03-08 14:15:32-07  jsnow
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
--
-- This module connects to the DRP of the Virtex-6 GTX and modifies attributes 
-- in the GTX transceiver in response to changes on its input control signals. 
-- This  module is specifically designed to support triple-rate SDI interfaces 
-- implemented in the Virtex-6 GTX. It changes the PMA_RX_CFG attribute when the 
-- rx_mode input changes. And, it changes the TXPLL_DIVSEL_OUT attribute in
-- response to changes on the tx_rate input.
--
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity v6gtx_sdi_drp_control is
generic (
    PMA_RX_CFG_HD :         std_logic_vector(27 downto 0) := X"05CE055";    -- HD-SDI CDR setting
    PMA_RX_CFG_SD :         std_logic_vector(27 downto 0) := X"0f44000";    -- SD-SDI CDR setting
    PMA_RX_CFG_3G :         std_logic_vector(27 downto 0) := X"05CE04D");   -- 3G-SDI CDR setting
    
port (
    clk:                in  std_logic;                                          -- DRP DCLK
    rst:                in  std_logic;                                          -- sync reset
    rx_mode:            in  std_logic_vector(1 downto 0);                       -- RX mode sel: 0=HD, 1=SD, 2=3G
    tx_rate:            in  std_logic_vector(1 downto 0);                       -- TX rate select
    drpdo:              in  std_logic_vector(15 downto 0);                      -- connect to GTX DRPDO port
    drdy:               in  std_logic;                                          -- connect to GTX DRDY port 
    daddr:              out std_logic_vector(7 downto 0) := (others => '0');    -- connect to GTX DADDR port
    di:                 out std_logic_vector(15 downto 0) := (others => '0');   -- connect to GTX DI port
    den:                out std_logic := '0';                                   -- connect to GTX DEN port
    dwe:                out std_logic := '0');                                  -- connect to GTX DWE port
end v6gtx_sdi_drp_control;

architecture rtl of v6gtx_sdi_drp_control is
    
--
-- Master state machine state definitions
-- 
type MSTR_STATE_TYPE is (
    MSTR_START,
    MSTR_RX_WR1,
    MSTR_RX_WAIT1,
    MSTR_RX_WR2,
    MSTR_RX_WAIT2,
    MSTR_RX_DONE,
    MSTR_TX_WR,
    MSTR_TX_WAIT,
    MSTR_TX_DONE);

--
-- DRP state machine state definitions
--
type DRP_STATE_TYPE is (
    DRP_STATE_WAIT,
    DRP_STATE_RD1,
    DRP_STATE_RD2,
    DRP_STATE_WR1,
    DRP_STATE_WR2);

subtype TIMEOUT_TYPE is unsigned(9 downto 0);               -- DRP access timeout timer type
constant DRP_TO_TC :    TIMEOUT_TYPE := (others => '1');    -- terminal count of drp_to_counter

--
-- Local signal declarations
--
signal rx_in_reg :          std_logic_vector(1 downto 0) := (others => '0');
signal rx_sync_reg :        std_logic_vector(1 downto 0) := (others => '0');
signal rx_last_reg :        std_logic_vector(1 downto 0) := (others => '0');
signal rx_change_req :      std_logic := '1';
signal tx_in_reg :          std_logic_vector(1 downto 0) := (others => '0');
signal tx_last_reg :        std_logic_vector(1 downto 0) := (others => '0');
signal tx_change_req :      std_logic := '1';
signal clr_rx_change_req :  std_logic;
signal clr_tx_change_req :  std_logic;
signal cycle :              std_logic_vector(1 downto 0);

signal mstr_current_state : MSTR_STATE_TYPE := MSTR_START;                      -- master FSM current state
signal mstr_next_state :    MSTR_STATE_TYPE;                                    -- master FSM next state
signal drp_current_state :  DRP_STATE_TYPE := DRP_STATE_WAIT;                   -- DRP FSM current state
signal drp_next_state :     DRP_STATE_TYPE;                                     -- DRP FSM next state

signal drp_go :             std_logic;                                          -- Go signal from master FSM to DRP FSM
signal drp_rdy :            std_logic;                                          -- Ready signal from DRP FSM to master FSM
signal ld_capture :         std_logic;                                          -- 1 = load capture register

signal capture :            std_logic_vector(15 downto 0) := (others => '0');   -- Holds data from DRP read cyle
signal mask :               std_logic_vector(15 downto 0);                      -- Masks bits not to be modified
signal mask_reg :           std_logic_vector(15 downto 0) := (others => '0');   -- Holds mask value
signal new_data :           std_logic_vector(15 downto 0);                      -- New data to be ORed into read data
signal new_data_reg :       std_logic_vector(15 downto 0) := (others => '0');   -- Holds new_data value
signal drp_daddr :          std_logic_vector(7 downto 0);                       -- DRP address to be accessed
signal rx_pma_cfg :         std_logic_vector(24 downto 0);                      -- Holds new PMA_RX_CFG value
signal drp_timeout :        std_logic;                                          -- 1 = DRP access timeout
signal drp_to_counter :     TIMEOUT_TYPE := (others => '0');                    -- DRP timeout counter
signal clr_drp_to :         std_logic;                                          -- 1 = clear DRP timeout

begin

--------------------------------------------------------------------------------
-- Input change detectors
--
process(clk)
begin
    if rising_edge(clk) then
        rx_in_reg <= rx_mode;
        rx_sync_reg <= rx_in_reg;
        rx_last_reg <= rx_sync_reg;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if rst = '1' then
            rx_change_req <= '1';
        elsif clr_rx_change_req = '1' then
            rx_change_req <= '0';
        elsif rx_sync_reg /= rx_last_reg then
            rx_change_req <= '1';
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        tx_in_reg <= tx_rate;
        tx_last_reg <= tx_in_reg;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if rst = '1' then
            tx_change_req <= '1';
        elsif clr_tx_change_req = '1' then
            tx_change_req <= '0';
        elsif tx_in_reg /= tx_last_reg then
            tx_change_req <= '1';
        end if;
    end if;
end process;

--
-- Create values used for the new data word
--
with rx_sync_reg select
    rx_pma_cfg <= PMA_RX_CFG_SD(24 downto 0) when "01",
                  PMA_RX_CFG_3G(24 downto 0) when "10",
                  PMA_RX_CFG_HD(24 downto 0) when others;

--------------------------------------------------------------------------------        
-- Master state machine
--
-- The master FSM examines the rx_change_req register and then initiates one
-- or more RMW cycles to the DRP to modify the correct attributes for that
-- particular change request.
--
-- The actual DRP RMW cycles are handled by a separate FSM, the DRP FSM. The
-- master FSM provides a DRP address, mask value, and new data words to the
-- DRP FSM and asserts a drp_go signal. The DRP FSM does the actual RMW cycle
-- and responds with a drp_rdy signal when the cycle is complete.
--

--
-- Current state register
-- 
process(clk)
begin
    if rising_edge(clk) then
        if rst = '1' then
            mstr_current_state <= MSTR_START;
        else
            mstr_current_state <= mstr_next_state;
        end if;
    end if;
end process;

--
-- Next state logic
--
process(mstr_current_state, rx_change_req, tx_change_req, drp_rdy)
begin
    case mstr_current_state is
        when MSTR_START =>
            if rx_change_req = '1' then
                mstr_next_state <= MSTR_RX_WR1;
            elsif tx_change_req = '1' then
                mstr_next_state <= MSTR_TX_WR;
            else
                mstr_next_state <= MSTR_START;
            end if;

        when MSTR_RX_WR1 => 
            mstr_next_state <= MSTR_RX_WAIT1;

        when MSTR_RX_WAIT1 => 
            if drp_rdy = '1' then
                mstr_next_state <= MSTR_RX_WR2;
            else
                mstr_next_state <= MSTR_RX_WAIT1;
            end if;

        when MSTR_RX_WR2 => 
            mstr_next_state <= MSTR_RX_WAIT2;

        when MSTR_RX_WAIT2 => 
            if drp_rdy = '1' then
                mstr_next_state <= MSTR_RX_DONE;
            else
                mstr_next_state <= MSTR_RX_WAIT2;
            end if;

        when MSTR_RX_DONE => 
            mstr_next_state <= MSTR_START;

        when MSTR_TX_WR => 
            mstr_next_state <= MSTR_TX_WAIT;

        when MSTR_TX_WAIT => 
            if drp_rdy = '1' then
                mstr_next_state <= MSTR_TX_DONE;
            else
                mstr_next_state <= MSTR_TX_WAIT;
            end if;

        when MSTR_TX_DONE => 
            mstr_next_state <= MSTR_START;

        when others => 
            mstr_next_state <= MSTR_START;
    end case;
end process;

--
-- Output logic
--
process(mstr_current_state)
begin
    cycle <= "00";
    clr_rx_change_req <= '0';
    clr_tx_change_req <= '0';
    drp_go <= '0';

    case mstr_current_state is
        when MSTR_RX_WR1 => 
            drp_go <= '1';
            cycle  <= "00";

        when MSTR_RX_WR2 => 
            drp_go <= '1';
            cycle  <= "01";

        when MSTR_TX_WR => 
            drp_go <= '1';
            cycle  <= "10";

        when MSTR_RX_DONE => 
            clr_rx_change_req <= '1';

        when MSTR_TX_DONE => 
            clr_tx_change_req <= '1';

        when others => 
    end case;
end process;

--
-- This logic creates the correct DRP address, mask, and data values depending
-- on the cycle value controlled by the master FSM.
--
process(cycle, rx_pma_cfg, tx_rate)
begin
    case cycle is
        when "00" =>
            drp_daddr <= X"00";
            mask <= X"0000";
            new_data <= rx_pma_cfg(15 downto 0);

        when "01" => 
            drp_daddr <= X"01";
            mask <= X"fe00";
            new_data <= ("0000000" & rx_pma_cfg(24 downto 16));

        when "10" => 
            drp_daddr <= X"1f";
            mask <= X"3fff";
            new_data <= (not tx_rate(1) & not tx_rate(0) & "00000000000000");

        when others => 
            drp_daddr <= (others => '0');
            mask <= (others => '1');
            new_data <= (others => '0');
    end case;
end process;


--------------------------------------------------------------------------------
-- DRP state machine
--
-- The DRP state machine performs the RMW cycle on the DRP at the request of the
-- master FSM. The master FSM provides the DRP address, a 16-bit mask indicating
-- which bits are to be modified (bits set to 0), and a 16-bit new data value
-- containing the new value. When the drp_go signal from the master FSM is
-- asserted, the DRP FSM will execute the RMW cycle. The DRP FSM asserts the
-- drp_rdy signal when it is ready to execute a RMW cycle and negates it for
-- the duration of the RMW cycle.
--
-- A timeout timer is used to timeout a DRP access should the DRP fail to
-- respond with a DRDY signal within a reasonable amount of time.
--

--
-- Current state register
--
process(clk)
begin
    if rising_edge(clk) then
        if rst = '1' then
            drp_current_state <= DRP_STATE_WAIT;
        elsif drp_timeout = '1' then
            drp_current_state <= DRP_STATE_WAIT;
        else
            drp_current_state <= drp_next_state;
        end if;
    end if;
end process;

--
-- Next state logic
--
process(drp_current_state, drp_go, drdy)
begin
    case drp_current_state is
        when DRP_STATE_WAIT =>
            if drp_go = '1' then
                drp_next_state <= DRP_STATE_RD1;
            else
                drp_next_state <= DRP_STATE_WAIT;
            end if;

        when DRP_STATE_RD1 => 
            drp_next_state <= DRP_STATE_RD2;

        when DRP_STATE_RD2 => 
            if drdy = '1' then
                drp_next_state <= DRP_STATE_WR1;
            else
                drp_next_state <= DRP_STATE_RD2;
            end if;

        when DRP_STATE_WR1 => 
            drp_next_state <= DRP_STATE_WR2;

        when DRP_STATE_WR2 => 
            if drdy = '1' then
                drp_next_state <= DRP_STATE_WAIT;
            else
                drp_next_state <= DRP_STATE_WR2;
            end if;

        when others => 
            drp_next_state <= DRP_STATE_WAIT;

    end case;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if drp_go = '1' then
            mask_reg <= mask;
            new_data_reg <= new_data;
            daddr <= drp_daddr;
        end if;
    end if;
end process;

--
-- Output logic
--
process(drp_current_state)
begin
    ld_capture <= '0';
    drp_rdy <= '0';
    clr_drp_to <= '0';

    case drp_current_state is
        when DRP_STATE_WAIT =>
            drp_rdy <= '1';
            clr_drp_to <= '1';

        when DRP_STATE_RD2 =>   
            ld_capture <= '1';

        when DRP_STATE_WR1 => 
            clr_drp_to <= '1';

        when others => 
    end case;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if drp_current_state = DRP_STATE_RD1 or drp_current_state = DRP_STATE_WR1 then
            den <= '1';
        else
            den <= '0';
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if drp_current_state = DRP_STATE_WR1 then
            dwe <= '1';
        else
            dwe <= '0';
        end if;
    end if;
end process;

--
-- A timeout counter for DRP accesses. If the timeout counter reaches its
-- terminal count, the DRP state machine aborts the transfer.
--
process(clk)
begin
    if rising_edge(clk) then
        if clr_drp_to = '1' then
            drp_to_counter <= (others => '0');
        else
            drp_to_counter <= drp_to_counter + 1;
        end if;
    end if;
end process;

drp_timeout <= '1' when drp_to_counter = DRP_TO_TC else '0';

--
-- DRP di capture register
--
process(clk)
begin
    if rising_edge(clk) then
        if ld_capture = '1' then
            capture <= drpdo;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        di <= (capture and mask_reg) or (new_data_reg and not mask_reg);
    end if;
end process;

end rtl;