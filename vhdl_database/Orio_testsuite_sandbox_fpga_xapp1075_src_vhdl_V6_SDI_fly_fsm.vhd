-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: fly_fsm.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2006-07-12 08:06:31-06 $
-- /___/   /\    Date Created: March 11, 2002
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: fly_fsm.vhd,rcs $
-- Revision 1.1  2006-07-12 08:06:31-06  jsnow
-- Fixed a bug where the flywheel would not resync if it was
-- aligned horizontally with the video, but offset vertical by a few
-- lines.
--
-- Revision 1.0  2004-12-15 16:14:05-07  jsnow
-- Header update.
--
-------------------------------------------------------------------------------- 
--   
--   XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" 
--   AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND 
--   SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, 
--   OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, 
--   APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION 
--   THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT, 
--   AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE 
--   FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY 
--   WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE 
--   IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR 
--   REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF 
--   INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
--   FOR A PARTICULAR PURPOSE. 
--
-------------------------------------------------------------------------------- 
-- 
-- This module implement the finite state machine for the video flywheel. The 
-- FSM synchronizes to the received video stream in two steps. 
-- 
-- First, the FSM syncs horizontally by waiting for a received SAV symbol. This
-- causes the FSM to reset the horizontal counter in the fly_hcnt module. After
-- receiving a SAV, the FSM checks the results by comparing the position of the
-- next received SAV with the expected location. If they match, then the FSM
-- assumes it is synchronized horizontally.
-- 
-- Next, the FSM syncs vertically. This is done by waiting for the received 
-- video to change fields, as indicated by the F bit in the received TRS 
-- symbols. When a field transition occurs, the vertical line counter in the 
-- fly_vcnt module is updated to the correct count and the FSM asserts the lock 
-- signal to indicate that it is synchronized with the video.
-- 
-- Once locked, the error detection logic continually compares the position and
-- contents of the received TRS symbols with the flywheel generated TRS symbols.
-- When the number of lines containing mismatched TRS symbols exceeds the 
-- MAX_ERRS value over the observation window (defaults to 8 lines), the resync 
-- signal is asserted. This causes the state machine to negate the lock signal 
-- and go through the synchronization process again.
-- 
-- The FSM is designed to accomodate synchronous switching as defined by SMPTE
-- RP 168. This recommended practice defines one line per field in the vertical
-- blanking interval when it is allowed to switch the video stream between two
-- synchronous video sources. The video sources must be synchronized but minor
-- displacements of the EAV symbol on these switching lines is tolerated since 
-- the switch sometimes induces minor errors on the line. During the switching
-- interval lines, errors in the position of the EAV symbol cause the FSM to
-- update the horizontal counter value immediately without going through the
-- normal synchronization process.
-- 
-- The FSM normally verifies that the received TRS symbol matches the flywheel 
-- generated TRS symbol by comparing the F, V, and H bits. However, previous
-- versions of the NTSC digital component video standards allowed the V bit to
-- fall early, anywhere between line 10 and line 20 for field 1 and lines
-- 273 to 283 for the second field. These standards now specify that the V bit
-- must fall one lines 20 and 283, but also recommend that new equipment be
-- tolerant of the signal falling early. The FSM ignores the V bit transitioning
-- early.
-- 
-- The inputs to this module are:
-- 
-- clk: clock input
-- 
-- ce: clock enable
-- 
-- rst: asynchronous reset
-- 
-- vid_f: Input video bit that carries the F signal during XYZ words.
-- 
-- vid_v: Input video bit that carries the V signal during XYZ words.
-- 
-- vid_h: Input video bit that carries the H signal during XYZ words.
-- 
-- rx_xyz: Asserted when the XYZ word is being processed by the flywheel.
-- 
-- fly_eav: Asserted when the XYZ word of an EAV is being generated by the 
-- flywheel.
-- 
-- fly_sav: Asserted when the XYZ word of an SAV is being generated by the 
-- flywheel.
-- 
-- fly_eav_next: Asserted the clock cycle before it is time for the flywheel to
-- generated an EAV symbol.
-- 
-- rx_eav: Asserted when the flywheel is receiving the XYZ word of an EAV.
-- 
-- rx_sav: Asserted when the flywheel is receiving the XYZ word of an SAV.
-- 
-- rx_eav_first: Asserted when the flywheel is receiving the first word of an 
-- EAV.
-- 
-- new_rx_field: From the new field detector in fly_field module. Asserted for 
-- the duration of the first line of a new field.
-- 
-- xyz_err: Asserted when an error is detected in the received XYZ word.
-- 
-- std_locked: Asserted when autodetect module is locked to input video stream's
-- standard.
-- 
-- switch_interval: Asserted when the current video line is a synchronous
-- switching line.
-- 
-- xyz_f: F bit from flywheel generated XYZ word.
-- 
-- xyz_v: V bit from flywheel generated XYZ word.
-- 
-- xyz_h: H bit from flywheel generated XYZ word.
-- 
-- sloppy_v: Asserted one those lines when the status of the V bit is ambiguous.
-- 
-- The outputs of this module are:
-- 
-- lock: Asserted when the flywheel is locked to the input video stream.
-- 
-- ld_vcnt: Asserted during resync cycle to cause the vertical counter to load
-- with a new value at the start of a new field.
-- 
-- inc_vcnt: Asserted to cause the vertical counter to increment.
-- 
-- clr_hcnt: Asserted to cause the horizontal counter to reset.
-- 
-- resync_hcnt: Asserted during synchronous switching to cause the the 
-- horizontal counter to update to the position of the new input video stream.
-- 
-- ld_std: Loads the flywheel's int_std register with the current video standard
-- code.
-- 
-- ld_f: Asserted during resynchronization to load the F bit.
-- 
-- clr_switch: This output clears the flywheel's switching_interval signal.
--
-------------------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity fly_fsm is
    port (
        clk:            in    std_ulogic;   -- clock input
        ce:             in    std_ulogic;   -- clock enable
        rst:            in    std_ulogic;   -- async reset input
        vid_f:          in    std_ulogic;   -- video data F bit
        vid_v:          in    std_ulogic;   -- video data V bit
        vid_h:          in    std_ulogic;   -- video data H bit
        rx_xyz:         in    std_ulogic;   -- asserted during XYZ word of received TRS
        fly_eav:        in    std_ulogic;   -- asserted during XYZ word of flywheel EAV
        fly_sav:        in    std_ulogic;   -- asserted during XYZ word of flywheel SAV
        fly_eav_next:   in    std_ulogic;   -- indicates start of EAV with next word
        fly_sav_next:   in    std_ulogic;   -- indicates start of SAV with next word
        rx_eav:         in    std_ulogic;   -- asserted during XYZ word of received EAV
        rx_sav:         in    std_ulogic;   -- asserted during XYZ word of received SAV
        rx_eav_first:   in    std_ulogic;   -- asserted during first word of received EAV
        new_rx_field:   in    std_ulogic;   -- asserted when received field changes
        xyz_err:        in    std_ulogic;   -- asserted on error in XYZ word
        std_locked:     in    std_ulogic;   -- asserted when autodetect locked to standard
        switch_interval:in    std_ulogic;   -- asserted when in sync switching interval
        xyz_f:          in    std_ulogic;   -- flywheel generated F bit for XYZ word
        xyz_v:          in    std_ulogic;   -- flywheel generated V bit for XYZ word
        xyz_h:          in    std_ulogic;   -- flywheel generated H bit for XYZ word
        sloppy_v:       in    std_ulogic;   -- ignore V bit on XYZ comparison when asserted
        lock:           out   std_ulogic;   -- flywheel is locked to video when asserted
        ld_vcnt:        out   std_ulogic;   -- causes vcnt to load
        inc_vcnt:       out   std_ulogic;   -- forces vcnt to increment during sync switch
        clr_hcnt:       out   std_ulogic;   -- clears hcnt
        resync_hcnt:    out   std_ulogic;   -- reloads hcnt
        ld_std:         out   std_ulogic;   -- loads the int_std register
        ld_f:           out   std_ulogic;   -- loads the F bit
        clr_switch:     out   std_ulogic);  -- clears the switching_interval signal
end;

architecture synth of fly_fsm is

-------------------------------------------------------------------------------
-- Constant definitions
--

--
-- This group of constants defines the bit widths of various fields in the
-- module.
--
-- The ERRCNT_WIDTH must be big enough to generate a counter wide enough
-- to accomodate error counts up to the MAX_ERRS value. It is recommended that
-- one or two additional counts be available in the error counter above the
-- MAX_ERRS value to prevent wrap around errors.
--
-- The LSHIFT_WIDTH value dictates the number of lines in the error window. The
-- default value of 8 provides a window of 8 lines over which the resync logic
-- examines lines containing TRS errors. If the number of lines with errors
-- exceeds MAX_ERRS over the error window, the FSM will be forced to
-- resynchronize.
--
constant ERRCNT_WIDTH : integer := 3;                   -- Width of errcnt
constant LSHIFT_WIDTH : integer := 32;                  -- Errored line shifter

constant ERRCNT_MSB :   integer := ERRCNT_WIDTH - 1;    -- MS bit # of errcnt
constant LSHIFT_MSB :   integer := LSHIFT_WIDTH - 1;    -- MS bit # of errored line shifter

constant MAX_ERRS :     std_logic_vector(ERRCNT_WIDTH downto 0) 
    := std_logic_vector(TO_UNSIGNED(2, ERRCNT_WIDTH + 1));          
                                                        -- Max number of TRS errors allowed in window
                                                        -- Note that this constant is one bit wider than
                                                        -- the errcnter so that an unsigned comparison
                                                        -- can be done.

--
-- This group of parameters defines the states of the FSM.
--                                              
constant STATE_WIDTH :  integer := 4;
constant STATE_MSB :    integer := STATE_WIDTH - 1;

subtype state is std_ulogic_vector(STATE_MSB downto 0);

constant LOCKED :       state := "0000";
constant HSYNC1 :       state := "0001";
constant HSYNC2 :       state := "0010";
constant FSYNC1 :       state := "0011";
constant FSYNC2 :       state := "0100";
constant FSYNC3 :       state := "0101";
constant UNLOCK :       state := "0110";
constant SWITCH1 :      state := "0111";
constant SWITCH2 :      state := "1000";
constant SWITCH3 :      state := "1001";
constant SWITCH4 :      state := "1010";
constant SWITCH5 :      state := "1011";
constant SWITCH6 :      state := "1100";
 
         
-------------------------------------------------------------------------------
-- Signal definitions
--

signal current_state :  state;              -- FSM current state
signal next_state :     state;              -- FSM next state
signal resync :         std_ulogic;         -- asserted to cause flywheel to resync
signal clr_resync :     std_ulogic;         -- reset resync logic
signal errcnt :         
    std_logic_vector(ERRCNT_MSB downto 0);  -- resync error counter
signal lerr_shifter :   
    std_ulogic_vector(LSHIFT_MSB downto 0); -- errored line shift register
signal line_err :       std_ulogic;         -- SR flip-flop indicating error on this line
signal trs_err :        std_ulogic;         -- sets the line_err flip-flop
signal xyz_match :      std_ulogic;         -- asserted if flywheel XYZ word matches received data
signal set_lock :       std_ulogic;         -- sets the lock flip-flop
signal clr_lock :       std_ulogic;         -- clears the lock flip-flop
signal fly_xyz :        std_ulogic;         -- asserted when flywheel generates XYZ

begin
    
    --
    -- fly_xyz
    --
    -- fly_xyz is asserted on the flywheel generated XYZ word
    --
    fly_xyz <= fly_sav or fly_eav;

    --
    -- lock
    --
    -- This is the lock flip-flop. It is set and cleared by the state machine to
    -- indicate whether the flywheel is synchronized to the incoming video or 
    -- not.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            lock <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (set_lock = '1') then
                    lock <= '1';
                elsif (clr_lock = '1') then
                    lock <= '0';
                end if;
            end if;
        end if;
    end process;

    --
    -- resync logic
    --
    -- The resync logic determines when it is time to resynchronize the flywheel.
    -- An SR flip-flop is set if a TRS error is detected on the current line. At
    -- the end of the line, when fly_eav_next is asserted, the contents of the 
    -- SR flip-flop are shifted into the lerr_shifter and the flip-flop is 
    -- cleared.
    -- 
    -- The lerr_shifter contains one bit for each line in the "window" over 
    -- which the resync mechanism operates. The shifter shifts one bit position 
    -- at the end of each line. The output bit of the shifter will cause the 
    -- errcnt to decrement if it is asserted because a line with an error has 
    -- moved out of the error window.
    --
    -- The errcnt is a counter that increments at the end of every line in which
    -- a TRS error is detected (when the line_err SR flip-flop is asserted). It
    -- decrements if the output bit of the shifter is asserted. In this way,
    -- it keeps track of the number of lines in the current window that had TRS
    -- errors. If the errcnt value exceeds the maximum number of allowed errors 
    -- in the window, the resync signal is asserted.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            line_err <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (fly_eav_next = '1' or clr_resync = '1') then
                    line_err <= '0';
                elsif (trs_err = '1') then
                    line_err <= '1';
                end if;
            end if;
        end if;
    end process;

    process(clk, rst)
    begin
        if (rst = '1') then
            lerr_shifter <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (clr_resync = '1') then
                    lerr_shifter <= (others => '0');
                elsif (fly_eav_next = '1') then
                    lerr_shifter <= (lerr_shifter(LSHIFT_MSB - 1 downto 0) & line_err);
                end if;
            end if;
        end if;
    end process;        
            
    process(clk, rst)
    begin
        if (rst = '1') then
            errcnt <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (clr_resync = '1') then
                    errcnt <= (others => '0');
                elsif (fly_eav_next = '1') then
                    if (line_err = '1' and lerr_shifter(LSHIFT_MSB) = '0') then
                        errcnt <= errcnt + 1;
                    elsif (line_err = '0' and lerr_shifter(LSHIFT_MSB) = '1') then
                        errcnt <= errcnt - 1;
                    end if;
                end if;
            end if;
        end if;
    end process;
            
    resync <= '1' when ('0' & errcnt) >= MAX_ERRS else '0';

    --
    -- trs_err
    --
    -- This signal is asserted when the received word is misplaced relative to 
    -- the flywheel's TRS location or if the received TRS XYZ word doesn't match
    -- the flywheel's generated values. This signal tells resync logic than an
    -- error occurred.
    --
    trs_err <= (not fly_xyz and rx_xyz) or 
               (fly_xyz and rx_xyz and (not xyz_match or xyz_err));

    --
    -- xyz_match logic
    -- 
    -- This logic compares the received XYZ word with the flywheel generated XYZ
    -- word to determine if they match. Only the F, V, and H bits of these words
    -- are compared. If the sloppy_v signal is asserted, then the V bit is 
    -- ignored.
    --
    xyz_match <= not ((vid_f xor xyz_f) or                    -- F bit compare
                      ((vid_v xor xyz_v) and not sloppy_v) or -- V bit compare
                      (vid_h xor xyz_h));                     -- H bit compare  

    -- FSM
    --
    -- The finite state machine is implemented in three processes, one for the
    -- current_state register, one to generate the next_state value, and the
    -- third to decode the current_state to generate the outputs.
     
    --
    -- FSM: current_state register
    --
    -- This code implements the current state register. It loads with the HSYNC1
    -- state on reset and the next_state value with each rising clock edge.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            current_state <= UNLOCK;
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
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
    process(current_state, fly_eav, fly_sav, rx_eav, rx_sav, fly_eav_next,
            fly_sav_next, rx_eav_first, new_rx_field, resync, xyz_err, std_locked,
            switch_interval)
    begin

        case current_state is
            when LOCKED =>
                if (std_locked = '0') then
                    next_state <= UNLOCK;
                elsif (resync = '1') then
                    next_state <= HSYNC1;
                elsif (switch_interval = '1') then
                    next_state <= SWITCH1;
                else
                    next_state <= LOCKED;
                end if;
                    

            when HSYNC1 =>
                if (rx_sav = '0') then
                    next_state <= HSYNC1;
                elsif (fly_sav = '1') then
                    next_state <= FSYNC1;
                else
                    next_state <= HSYNC2;
                end if;

            when HSYNC2 =>
                next_state <= HSYNC1;

            when FSYNC1 =>
                if (fly_eav = '0') then
                    next_state <= FSYNC1;
                elsif (rx_eav = '0') then
                    next_state <= HSYNC1;
                elsif (xyz_err = '1') then
                    next_state <= FSYNC1;
                else
                    next_state <= FSYNC2;
                end if;

            when FSYNC2 => 
                if (new_rx_field = '1') then
                    next_state <= FSYNC3;
                else
                    next_state <= FSYNC1;
                end if;

            when FSYNC3 => 
                next_state <= LOCKED;

            when UNLOCK => 
                if (std_locked = '0') then
                    next_state <= UNLOCK;
                else
                    next_state <= HSYNC1;
                end if;

            when SWITCH1 => 
                if (std_locked = '0') then
                   next_state <= UNLOCK;
                elsif (rx_eav_first = '1') then
                   next_state <= SWITCH2;
                elsif (fly_eav_next = '1') then
                   next_state <= SWITCH5;
                else
                   next_state <= SWITCH1;
                end if;

            when SWITCH2 => 
                next_state <= SWITCH3;

            when SWITCH3 => 
                next_state <= SWITCH4;

            when SWITCH4 => 
                next_state <= LOCKED;

            when SWITCH5 => 
                if (rx_eav_first = '1') then
                    next_state <= LOCKED;
                else
                    next_state <= SWITCH6;
                end if;

            when SWITCH6 => 
                if (rx_eav_first = '1') then
                    next_state <= SWITCH2;
                elsif (fly_sav_next = '1') then
                    next_state <= UNLOCK;
                else
                    next_state <= SWITCH6;
                end if;
                        
            when others =>
                next_state <= HSYNC1;
        end case;   
    end process;
            
    --
    -- FSM: outputs
    --
    -- This block decodes the current state to generate the various outputs of 
    -- the FSM.
    --
    process(current_state, fly_sav_next)
    begin
        -- Unless specifically assigned in the case statement, all FSM outputs
        -- are low.
        clr_resync      <= '0';
        ld_vcnt         <= '0';
        clr_hcnt        <= '0';
        resync_hcnt     <= '0';
        ld_vcnt         <= '0';
        set_lock        <= '0';
        clr_lock        <= '0';
        ld_std          <= '0';
        ld_f            <= '0';
        clr_switch      <= '0';
        inc_vcnt        <= '0';
                                
        case current_state is
            when LOCKED =>
                set_lock <= '1';

            when HSYNC1 =>
                clr_lock <= '1';
                ld_std   <= '1';

            when HSYNC2 => 
                clr_hcnt  <= '1';

            when FSYNC3 => 
                ld_vcnt    <= '1';
                ld_f       <= '1';
                clr_resync <= '1';

            when UNLOCK => 
                clr_lock   <= '1';
                clr_switch <= '1';

            when SWITCH2 => 
                resync_hcnt <= '1';
                     
            when SWITCH4 => 
                clr_switch <= '1';

            when SWITCH6 => 
                if (fly_sav_next = '1') then
                    clr_switch <= '1';
                    inc_vcnt   <= '1';
                end if;

            when others =>
        end case;   
    end process;

end synth;