-------------------------------------------------------------------------------- 
-- Copyright (c) 2010 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author:  Ahsan Raza
--  \   \        Filename: $RCSfile: v6gtx_sdi_rate_detect.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-10-20 10:34:27-06 $
-- /___/   /\    Date Created: January 4, 2010
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: v6gtx_sdi_rate_detect.vhd,rcs $
-- Revision 1.1  2010-10-20 10:34:27-06  jsnow
-- The "rst" input port has been removed. The "reset_out" port
-- has been renamed "rate_change".
--
-- Revision 1.0  2010-03-08 14:16:03-07  jsnow
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
-- This module implements two counters. One driven by the reference clock and
-- other driven by the recovered clock. The two counters help in automatic
-- recognition of the two HD-SDI bit rates. V6 GTX receiver has a CDR that can
-- lock to both the HD-SDI bit rates using a single reference clock. This logic
-- design can be used to detect the rate change using any reference clock from
-- 27 MHz to 148.5 MHz.

-- This module also looks for the clock frequency change and generates a reset
-- signal whenever there is asynchronous clock switching due to rate change or
-- any other reason. It also indicates whenever a drift is seen in the recovered
-- clock beyond a threshold value. This module validates the changes, number of
-- times before generating the reset or clock drift status signals.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity v6gtx_sdi_rate_detect is
  generic (

           REFCLK_FREQ:  integer:= 33333333); -- Reference clock in Hz

  port (
        refclk:     in  std_logic;          -- reference clock
        recvclk:    in  std_logic;          -- recovered clock
        std:        in  std_logic;          -- 0 = HD, 1 = 3G
        enable:     in  std_logic;          -- Use to hold the module when driven by improper clock
                                            -- It is active low signal 
        rate_change:out std_logic;          -- Indicates when a rate change occurs
        drift:      out std_logic := '0';   -- Indicates if recovered clock has significantly
                                            -- drifted from its expected value.
        rate:       out std_logic);         -- 0 = clock is x/1, 1 = clock is x/1.001

end v6gtx_sdi_rate_detect;

architecture rtl of v6gtx_sdi_rate_detect is

--------------------------------------------------------------------------------
-- signal and constants declaration

constant MAX_COUNT_REF:      integer := REFCLK_FREQ/1000;        -- Reference value for 1 millisec
constant MAX_COUNT_RXREC:    integer := 74250;                   -- Reference count value for 148.5 MHz clock for
                                                                 -- a period of one millisec
constant MAX_COUNT_REF_MONITOR:  integer := 744999;              -- Variable count value used to validate the change
                                                                 -- in the status of clock frequency. The rate detector
                                                                 -- validates the change in status of clock frequency
                                                                 -- before indicating the changed status

constant TEST_VAL_RXREC:     integer := MAX_COUNT_RXREC - 38;    -- Reference value used to decide whether HD rate has
                                                                 -- changed or not

constant DRIFT_COUNT1:       integer := MAX_COUNT_RXREC + 125;    -- Upper threshold value used for clock drift detection 
constant DRIFT_COUNT2:       integer := MAX_COUNT_RXREC - 125;   -- Lower threshold value used for clock drift detection

---------------States for validation state machine------------------------------
type state is (S_WAIT, START, CHECK, DOUBLE_CHECK1, DOUBLE_CHECK2, S_END);

signal count_ref:            integer := 0; -- Counts the reference clock
signal count_recv:           integer := 0; -- Counts the recovered clock

------------------Internal Signals----------------------------------------------
signal count_ref_tc:         std_logic;
signal tc_reg:               std_logic_vector(1 downto 0) := (others => '0');
signal capture_reg:          std_logic_vector(4 downto 0) := (others => '0');
signal capture:              std_logic;
signal drift_int:            std_logic := '0';
signal drift_sig:            std_logic := '0';
signal toggle:               std_logic := '0';
signal count_drift:          std_logic_vector(1 downto 0) := (others => '0');
signal drift_reg:            std_logic_vector(1 downto 0) := (others => '0');
signal drift_sts:            std_logic := '0';
signal capture_dly:          std_logic := '0';

-- control logic signals

signal current_state:        state := S_WAIT;
signal next_state:           state;

signal count_monitor:        std_logic_vector(24 downto 0) := (others => '0');
signal check_count:          std_logic_vector(1 downto 0) := (others => '0');
signal hd_reg:               std_logic_vector(1 downto 0) := (others => '0');
signal enable_reg:           std_logic_vector(1 downto 0) := "00";
signal enable_rec:           std_logic_vector(1 downto 0) := "00";
signal rc_reg:               std_logic := '0';
signal rate_int:             std_logic := '0';
signal count_clr:            std_logic;
signal clr_cnt:              std_logic;
signal inc_cnt:              std_logic;
signal count_inc:            std_logic;
signal load_final:           std_logic;
signal clr_final:            std_logic;
signal hd_change:            std_logic;
signal count_monitor_tc:     std_logic;
signal max_check:            std_logic;

begin

---------------------------------------------------------------------
-- Synchronization logic for enable input

process (refclk)
begin
    if refclk'event and refclk = '1' then
        enable_reg <= (enable_reg(0) & enable);
    end if;
end process;

process (recvclk)
begin
    if recvclk'event and recvclk = '1' then
        enable_rec <= (enable_rec(0) & enable);
  end if;
end process;

---------------------------------------------------------------------

-- This is a counter that counts the event on the reference clock for
-- comparing that with the recovered clock. The counter gets reset after
-- 1 millisec. This design compares the recovered clock with the reference
-- clock every 1 millisec to compute HD rate change or clock drift 

process (refclk)
begin
    if refclk'event and refclk = '1' then
        if count_ref_tc = '1' or enable_reg(1) = '0' then
            count_ref <= MAX_COUNT_REF;
        else
            count_ref <= count_ref - 1;   
        end if;
    end if;
end process;

count_ref_tc <= '1' when count_ref = 1 else '0';    -- Goes high every 1 millisec.

-- This logic extends the pulse to ensure that it is not missed when sampled by a
-- slower clock

process (refclk)
begin
    if refclk'event and refclk = '1' then
        tc_reg <= (tc_reg(0) & count_ref_tc);
    end if;
end process;

-- Synchronization to recovered clock domain 
process (recvclk)
begin
    if recvclk'event and recvclk = '1' then
        capture_reg <= capture_reg(3 downto 0) & (tc_reg(1) or tc_reg(0));
    end if;
end process;

capture <= capture_reg(2) and (not capture_reg(3)) and (not capture_reg(4));

-- This implements a counter for counting the events on the recovered clock.
-- The count reading is compared to a predefined value at a fixed interval of
-- time to compute the clock rate or any drift in the recovered clock. The 
-- counter counts every clock event when the std input is '0' else counts
-- every alternate event when it is set to '1'. This is done to support
-- both HD-SDI and 3G-SDI protocols.

process (recvclk)
begin
    if recvclk'event and recvclk = '1' then
        if (capture = '1' or enable_rec(1) = '0') then
            count_recv <= 0;
            toggle     <= '0';
        else
            if(std = '0') then
                toggle     <= '0';
                count_recv <= count_recv + 1;
            else
                if (toggle = '0') then
                    count_recv <= count_recv + 1;
                    toggle     <= not toggle;
                else
                    count_recv <= count_recv;
                    toggle     <= not toggle;
                end if;
            end if;          
        end if;
    end if;
end process;


-- This process looks for clock drift from its mean position on one
-- direction indicating that the rate of input data rate has changed
--   

process (recvclk)
begin
    if recvclk'event and recvclk = '1' then
        if (capture = '1') then
            if (count_recv < TEST_VAL_RXREC) then
                rate_int <= '1';
            else
                rate_int <= '0';
            end if;
        end if;
    end if;
end process;

process (refclk)
begin
    if refclk'event and refclk = '1' then
        hd_reg <= hd_reg(0) & rate_int;
    end if;
end process;

hd_change <= hd_reg(1) xor hd_reg(0);

rate <= hd_reg(1);

-- This process looks for clock drift from its mean position. It generates
-- an output whenever the clock drift away beyond a particular range on
-- either side. The threshold value for this logic is more than that used
-- for rate detection in order to avoid reporting the faulty status

process (recvclk)
begin
    if recvclk'event and recvclk = '1' then
        if (capture = '1') then
            if (count_recv > DRIFT_COUNT1 or count_recv < DRIFT_COUNT2) then
                drift_int <= '1';
            else
                drift_int <= '0';
            end if;
        end if;
    end if;
end process;

process (recvclk)
begin
    if recvclk'event and recvclk = '1' then
        capture_dly <= capture;
    end if;
end process;

-- This logic is used to validate the clock drift for a period of 4 millisec
-- before validating it. During this period if the drift status changes it
-- shifts the window and continues with the check 

process (recvclk)
begin
    if recvclk'event and recvclk = '1' then
        if(capture_dly = '1')then
            if count_drift = "11" or drift_sts /= drift_int then
                count_drift <= (others => '0');
                drift_sts   <= drift_int;
            else
                count_drift <= count_drift + '1';
                drift_sts   <= drift_int;
            end if;
        end if;    
    end if;
end process;

process (recvclk)
begin
    if recvclk'event and recvclk = '1' then
        if count_drift = "11" then
            drift <= drift_sts;
            drift_sig <= drift_sts;
        end if;
    end if;
end process;

--**************************** control logic ***********************************
-- The logic written below generates a reset pulse on detecting the change in
-- the recovered clock. The clock can change either due to change in the
-- received data rate or due to CDR losing the lock. This may happen due to
-- temporary data loss. Once CDR loses the lock, recovered clock starts drifting
-- wildly from its mean position. This may result in the fabric design getting
-- re-initialized to unknown state. The reset generated by this portion is used
-- bring the design to known state for its proper operation.
--

process (refclk)
begin
    if refclk'event and refclk = '1' then
        if clr_final = '1' then
            rc_reg <= '0';
        elsif load_final = '1' then
            rc_reg <= '1';
        end if;
    end if;
end process;

rate_change <= rc_reg;

process (refclk)
begin
    if refclk'event and refclk = '1' then
        if count_clr = '1' then
            count_monitor <= (others => '0');
        elsif(count_inc = '1')then
            count_monitor <= count_monitor + '1';
        end if;
    end if;
end process;

count_monitor_tc <= '1' when (count_monitor = MAX_COUNT_REF_MONITOR) else '0';

process (refclk)
begin
    if refclk'event and refclk = '1' then
        if clr_cnt = '1' then
            check_count <= (others => '0');
        elsif inc_cnt = '1' then
            check_count <= check_count + '1';
        end if;
    end if;
end process;

max_check <= '1' when (check_count = "11")  else '0';

process(refclk)
begin
    if refclk'event and refclk ='1' then
        drift_reg <= (drift_reg(0) & drift_sig);
    end if;
end process;
--
-- This code implements the current state register. It loads with the S_WAIT
-- state on reset and the next_state value with each rising clock edge.
--

process(refclk)
begin
    if refclk'event and refclk ='1' then
        current_state <= next_state;
    end if;
end process;

-- FSM: next_state logic
--
-- This case statement generates the next_state value for the FSM based on
-- the current_state and the various FSM inputs.
--  
process(current_state, hd_change, count_monitor_tc, max_check, drift_reg)
begin 
    inc_cnt         <= '0';
    clr_cnt         <= '0';
    count_clr       <= '0';
    count_inc       <= '0';
    load_final      <= '0';
    clr_final       <= '0';

    case current_state is
        when  S_WAIT =>
            if (hd_change = '1' or drift_reg(1) = '1') then
                next_state <= START;
            else
                next_state <= S_WAIT;
            end if;   
            count_clr <= '1'; 
            clr_cnt   <= '1';
            clr_final <= '1';

        when  START => 
            if (count_monitor_tc = '1') then
                next_state <= CHECK;
            else
                next_state <= START;
            end if;   
            count_inc  <= '1';

        when  CHECK  =>
            if (hd_change = '1') then
                next_state <= DOUBLE_CHECK1;
            else
                next_state <= DOUBLE_CHECK2;
            end if;   
            count_clr  <= '1';

        when DOUBLE_CHECK1  => 
            next_state <= DOUBLE_CHECK2;
            clr_cnt    <= '1';

        when DOUBLE_CHECK2  => 
            if (max_check = '1') then 
                next_state <= S_END;
            else
                next_state <= START;
            end if; 
            inc_cnt    <= '1';

        when S_END  => 
            next_state <= S_WAIT;
            load_final <= '1';

        when others =>
            next_state <= S_WAIT; 
    end case;
end process;

end rtl;


