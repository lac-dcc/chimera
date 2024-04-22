-------------------------------------------------------------------------------- 
-- Copyright (c) 2008 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: triple_sdi_rx_autorate.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2008-05-30 16:03:59-06 $
-- /___/   /\    Date Created: May 20, 2008
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: triple_sdi_rx_autorate.vhd,rcs $
-- Revision 1.0  2008-05-30 16:03:59-06  jsnow
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
-- This module, controls a Virtex-5 GTP receiver's operating mode so as to 
-- automatically detect SD-SDI, HD-SDI, or 3G-SDI on the incoming bit stream.
-- 
-- The user needs to balance error tolerance against reaction speed in this 
-- design. Occasional errors, or even a burst of errors, should not cause the 
-- circuit to toggle reference clock frequencies prematurely. On the other hand,
-- in some cases it is necessary to reacquire lock with the bitstream as quickly
-- as possible after the incoming bitstream changes frequencies.
-- 
-- This module uses missing or erroneous TRS symbols as the detection mechanism 
-- for determining when to toggle the operating mode. A missing SAV or an SAV 
-- with protection bit errors will cause the finite state machine to flag the 
-- line as containing an error. 
-- 
-- Each line that contains an error causes the error counter to increment. If a 
-- line is found that is error free, the error counter is cleared back to zero. 
-- When MAX_ERRS_LOCKED consecutive lines occur with errors, the state machine 
-- will change the mode output to cycle through SD-SDI, HD-SDI, and 3G-SDI until
-- lock is reacquired. MAX_ERRS_LOCKED is provided to the module as a generic.
-- The width of the error counter, as specified by ERRCNT_WIDTH, must be 
-- sufficient to count up to MAX_ERRS_LOCKED (and MAX_ERRS_UNLOCKED).
-- 
-- When the receiver is not locked, the MAX_ERRS_UNLOCKED generic controls
-- the maximum number of consecutive lines with TRS errors that must occur 
-- before the state machine moves on to the next operating mode. 
-- MAX_ERRS_UNLOCKED effectively controls the scan rate of the locking process 
-- whereas MAX_ERRS_LOCKED controls how quickly the module responds to loss of 
--lock (and how sensitive it is to noise on the input signal).
-- 
-- The TRSCNT_WIDTH generic determines the width of the counter used to 
-- determine if an SAV was not received during a line. It should be wide enough 
-- to count more than the number of samples in the longest possible video line. 
-- Some video formats are now longer than 4096 samples per line, so the default 
-- is set to 13, allowing lines up to 8192 samples long.
-- 
-- The rst input resets the module asynchronously. However, this signal must be
-- negated synchronously with the clk signal, otherwise the state machine may
-- go to an invalid state.
-- 
-- This controller also has an input called mode_enable that allows the 
-- supported modes to be specified. Only those modes whose corresponding bit on 
-- the mode_enable input will be tried during the search to lock to the input 
-- bitstream.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.hdsdi_pkg.all;
use work.anc_edh_pkg.all;

entity triple_sdi_rx_autorate is
generic (
    ERRCNT_WIDTH :      integer := 4;                   -- width of counter tracking lines with errors
    TRSCNT_WIDTH :      integer := HD_HCNT_WIDTH;       -- width of missing SAV timeout counter
    MAX_ERRS_LOCKED :   integer := 15;                  -- max number of consecutive lines without errors
    MAX_ERRS_UNLOCKED : integer := 2);                  -- max number of lines with errors during search
port (
    clk:            in  std_logic;                      -- rxusrclk input
    ce:             in  std_logic;                      -- clock enable
    rst:            in  std_logic;                      -- async reset input
    sav:            in  std_logic;                      -- asserted during SAV symbols
    trs_err:        in  std_logic;                      -- TRS error bit from framer
    mode_enable:    in  std_logic_vector(2 downto 0);   -- b0=HD, b1=SD, b2=3G
    mode:           out std_logic_vector(1 downto 0);   -- 00=HD, 01=SD, 10=3G
    locked:         out std_logic);                     -- 1 = locked
end triple_sdi_rx_autorate;

architecture xilinx of triple_sdi_rx_autorate is

-------------------------------------------------------------------------------
-- Parameter definitions
--
-- Changing the ERRCNT_WIDTH generic changes the width of the counter that is
-- used to keep track of the number of consecutive lines that contained errors.
-- By changing the counter width and changing the two MAX_ERRS generics, the
-- latency for refclksel switching can be changed. Making the MAX_ERRS values
-- smaller will reduce the switching latency, but will also reduce the tolerance
-- to errors and cause unintentional rate switching.
--
-- There are two different MAX_ERRS generics, one that is effective when the
-- FSM is locked and and when it is unlocked. By making the MAX_ERRS_UNLOCKED
-- value smaller, the scan process is more rapid. By making the MAX_ERRS_LOCKED
-- generic larger, the process is less sensitive to noise induced errors.
--
-- The TRSCNT_WIDTH generic determines the width of the missing SAV timeout
-- counter. Increasing this counter's width causes the state machine to wait
-- longer before determining that a SAV was missing. Note that the counter
-- is actually implemented as one bit wider than the value given in TRSCNT_WDITH
-- allowing the MSB to be the timeout error flag.
--
subtype errcnt_type is std_logic_vector(ERRCNT_WIDTH-1 downto 0);
subtype trscnt_type is std_logic_vector(TRSCNT_WIDTH downto 0);
subtype state_type  is std_logic_vector(2 downto 0);
subtype mode_type   is std_logic_vector(1 downto 0);
--
-- This group of constants defines the states of the FSM.
--                                              
constant UNLOCK :   state_type := "000";
constant LOCK1 :    state_type := "001";
constant LOCK2 :    state_type := "010";
constant ERR1 :     state_type := "011";
constant ERR2 :     state_type := "100";
constant CHANGE :   state_type := "101";

-- 
-- These constants define the values used on the mode output
--      
constant MODE_HD :  mode_type := "00";
constant MODE_SD :  mode_type := "01";
constant MODE_3G :  mode_type := "10";
constant MODE_XX :  mode_type := "11";

-- 
-- These constants define the mode_enable input port bits.
--     
constant VALID_BIT_HD : integer := 0;
constant VALID_BIT_SD : integer := 1;
constant VALID_BIT_3G : integer := 2;

--
-- Signal definitions
--
signal current_state :  state_type := UNLOCK;           -- FSM current state
signal next_state :     state_type;                     -- FSM next state
signal errcnt :         errcnt_type := (others => '0'); -- error counter
signal trscnt :         trscnt_type := (others => '0'); -- TRS timeout counter
signal clr_errcnt :     std_logic;                      -- clear errcnt
signal inc_errcnt :     std_logic;                      -- increment errcnt
signal max_errcnt :     std_logic;                      -- 1 = errcnt = MAX_ERRS
signal trs_tc :         std_logic;                      -- trscnt terminal count
signal sav_ok :         std_logic;                      -- 1 when SAV if no protection errors
signal mode_int :       mode_type := MODE_HD;           -- internal version of mode
signal change_mode :    std_logic;                      -- switch to next mode
signal set_locked :     std_logic;                      -- set locked_int
signal clr_locked :     std_logic;                      -- clear locked_int
signal locked_int :     std_logic := '0';               -- internal version of locked
signal max_errs :       errcnt_type;                    -- max errcnt mux
signal next_mode :      mode_type;                      -- next mode

begin

--
-- Error signals
--
-- sav_ok is only asserted during the XYZ word of SAV symbols when there trs_err
-- is not asserted.
--
sav_ok <= sav and not trs_err;

-- 
-- mode register
--
-- The mode register changes when the change_mode signal from the FSM is 
-- asserted.. The normal scan sequence is HD -> 3G -> SD -> HD if all 3 modes
-- are enabled by the mode_enable port. Any modes that are not enabled are
-- skipped.
--
process(mode_int, mode_enable)
begin
    case mode_int is
        when MODE_HD => 
            if mode_enable(VALID_BIT_3G) = '1' then
                next_mode <= MODE_3G;
            elsif mode_enable(VALID_BIT_SD) = '1' then
                next_mode <= MODE_SD;
            else
                next_mode <= MODE_HD;
            end if;
    
        when MODE_3G => 
            if mode_enable(VALID_BIT_SD) = '1' then
                next_mode <= MODE_SD;
            elsif mode_enable(VALID_BIT_HD) = '1' then
                next_mode <= MODE_HD;
            else
                next_mode <= MODE_3G;
            end if;

        when MODE_SD => 
            if mode_enable(VALID_BIT_HD) = '1' then
                next_mode <= MODE_HD;
            elsif mode_enable(VALID_BIT_3G) = '1' then
                next_mode <= MODE_3G;
            else
                next_mode <= MODE_SD;
            end if;

        when others => 
            next_mode <= MODE_HD;
    end case;
end process;


process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            if change_mode = '1' then
                mode_int <= next_mode;
            end if;
        end if;
    end if;
end process;

mode <= mode_int;

--
-- locked signal
--
-- This flip-flop generates the locked signal based on set and clr signals from
-- the FSM.
--
process(clk, rst)
begin
    if rst = '1' then
        locked_int <= '0';
    elsif rising_edge(clk) then
        if ce = '1' then
            if set_locked = '1' then
                locked_int <= '1';
            elsif clr_locked = '1' then
                locked_int <= '0';
            end if;
        end if;
    end if;
end process;

locked <= locked_int;

--
-- TRS timeout counter
--
-- This counter is reset whenever a SAV signal is received, otherwise it
-- increments. When it reaches its terminal count, the trs_tc signal is
-- asserted and the the counter will roll over to zero on the next clock cycle.
--
process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            if sav_ok = '1' or trs_tc = '1' then
                trscnt <= (others => '0');
            else
                trscnt <= trscnt + 1;
            end if;
        end if;
    end if;
end process;

trs_tc <= trscnt(TRSCNT_WIDTH);

--
-- Error counter
--
-- The error counter increments each time the inc_errcnt output from the FSM
-- is asserted. It clears to zero when clr_errcnt is asserted. The max_errcnt
-- output is asserted if the error counter equals max_errs. A MUX selects
-- the correct MAX_ERRS parameter for the max_errs signal based on the locked
-- signal from the FSM.
--
process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            if inc_errcnt = '1' then
                errcnt <= errcnt + 1;
            elsif clr_errcnt = '1' then
                errcnt <= (others => '0');
            end if;
        end if;
    end if;
end process;

max_errs <= std_logic_vector(to_unsigned(MAX_ERRS_LOCKED, ERRCNT_WIDTH)) when locked_int = '1' else 
            std_logic_vector(to_unsigned(MAX_ERRS_UNLOCKED, ERRCNT_WIDTH));
max_errcnt <= '1' when errcnt = max_errs else '0';


-- FSM
--
-- The finite state machine is implemented in three processes, one for the
-- current_state register, one to generate the next_state value, and the
-- third to decode the current_state to generate the outputs.
 
--
-- FSM: current_state register
--
-- This code implements the current state register. It loads with the UNLOCK
-- state on reset and the next_state value with each rising clock edge.
--
process(clk, rst)
begin
    if rst = '1' then
        current_state <= UNLOCK;
    elsif rising_edge(clk) then
        if ce = '1' then
            current_state <= next_state;
        end if;
    end if;
end process;

--
-- FSM: next_state logic
--
-- This case statement generates the next_state value for the FSM based on
-- the current_state and the various FSM inputs.
--
process(current_state, sav_ok, trs_tc, max_errcnt, locked_int)
begin   
    case current_state is
        --
        -- The FSM begins in the UNLOCK state and stays there until a SAV
        -- symbol is found. In this state, if the TRS timeout counter reaches
        -- its terminal count, the FSM moves to the ERR1 state to increment the
        -- error counter.
        --
        when UNLOCK =>  if sav_ok = '1' then
                            next_state <= LOCK1;
                        elsif trs_tc = '1' then
                            next_state <= ERR1;
                        else
                            next_state <= UNLOCK;
                        end if;

        --
        -- This is the main locked state LOCK1. Once a SAV has been found, the
        -- FSM stays here until either another SAV is found or the TRS counter
        -- times out.
        --
        when LOCK1 =>   if sav_ok = '1' then
                            next_state <= LOCK2;
                        elsif trs_tc = '1' then
                            next_state <= ERR1;
                        else
                            next_state <= LOCK1;
                        end if;

        --
        -- The FSM moves to LOCK2 from LOCK1 if a SAV is found. The error
        -- counter is reset in LOCK2.
        --
        when LOCK2 =>   next_state <= LOCK1;

        --
        -- The FSM moves to ERR1 from LOCK 1 if the TRS timeout counter reaches
        -- its terminal count before a SAV is found. In this state, the error
        -- counter is incremented and the FSM moves to ERR2.
        --
        when ERR1 =>    next_state <= ERR2;

        --
        -- The FSM enters ERR2 from ERR1 where the error counter was
        -- incremented. In this state the max_errcnt signal is tested. If it
        -- is asserted, the FSM moves to the TOGGLE state, otherwise the FSM
        -- returns to LOCK1.
        --
        when ERR2 =>    if max_errcnt = '1' then
                            next_state <= CHANGE;
                        elsif locked_int = '1' then
                            next_state <= LOCK1;
                        else
                            next_state <= UNLOCK;
                        end if;

        --
        -- In the CHANGE state, the FSM sets the change_mode signal and returns
        -- to the UNLOCK state.
        --
        when CHANGE =>  next_state <= UNLOCK;

        when others =>  next_state <= UNLOCK;
    end case;
end process;

--
-- FSM: outputs
--
-- This block decodes the current state to generate the various outputs of the
-- FSM.
--
process(current_state)
begin
    change_mode     <= '0';
    clr_errcnt      <= '0';
    inc_errcnt      <= '0';
    set_locked      <= '0';
    clr_locked      <= '0';

    case current_state is
        when LOCK1  =>  set_locked <= '1';

        when UNLOCK =>  clr_locked <= '1';

        when LOCK2  =>  clr_errcnt <= '1';

        when CHANGE =>  change_mode <= '1';
                        clr_errcnt  <= '1';

        when ERR1   =>  inc_errcnt <= '1';

        when others => null;
    end case;
end process;

end;
