-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: fly_vert.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2004-12-15 16:15:27-07 $
-- /___/   /\    Date Created: March 31, 2002
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: fly_vert.vhd,rcs $
-- Revision 1.0  2004-12-15 16:15:27-07  jsnow
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
-- This module implements the vertical functions of the video flywheel.
-- 
-- This module contains the vertical counter. This counter keeps track of the
-- current video scan line. The module also generates the V signal. This signal
-- is asserted during the vertical blanking interval of each field.
-- 
-- This module has the following inputs:
-- 
-- clk: clock input
-- 
-- rst: asynchronous reset input
-- 
-- ce: clock enable
-- 
-- ntsc: Asserted when the input video stream is NTSC.
-- 
-- ld_vcnt: This input causes the vertical counter to load the value of the 
-- first line of the current field.
-- 
-- fsm_inc_vcnt: This input is asserted by the FSM to force the vertical counter
-- to increment during a failed synchronous switch.
-- 
-- eav_next: Asserted the clock cycle before the first word of a flywheel 
-- generated EAV symbol.
-- 
-- clr_switch: Causes the switch_interval output to be negated.
-- 
-- rx_f: This signal carries the F bit from the input video stream during XYZ 
-- words.
-- 
-- f: This is the flywheel generated F bit.
-- 
-- fly_sav: Asserted during the XYZ word of a flywheel generated SAV.
-- 
-- fly_eav: Asserted during the XYZ word of a flywheel generated EAV.
-- 
-- rx_eav_first: Asserted during the first word of an EAV in the input video 
-- stream.
-- 
-- lock: Asserted when the flywheel is locked.
-- 
-- This module generates the following outputs:
-- 
-- vcnt: This is the value of the vertical counter indicating the current video
-- line number.
-- 
-- v: This is the vertical blanking bit asserted during the vertical blanking
-- interval.
-- 
-- sloppy_v: This signal is asserted on those lines where the V bit may fall 
-- early.
-- 
-- inc_f: Toggles the F bit when asserted.
-- 
-- switch_interval: Asserted when the current line contains the synchronous
-- switching interval.
--
-------------------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity fly_vert is
    generic (
        VCNT_WIDTH : integer := 10);
    port (
        clk:            in    std_ulogic;                   -- clock input
        rst:            in    std_ulogic;                   -- async reset input
        ce:             in    std_ulogic;                   -- clock enable
        ntsc:           in    std_ulogic;                   -- 1 = NTSC, 0 = PAL
        ld_vcnt:        in    std_ulogic;                   -- causes vcnt to load
        fsm_inc_vcnt:   in    std_ulogic;                   -- forces vcnt to increment during failed sync switch
        eav_next:       in    std_ulogic;                   -- asserted when next word is first word of flywheel EAV
        clr_switch:     in    std_ulogic;                   -- clears the switching_interval signal
        rx_f:           in    std_ulogic;                   -- received F bit
        f:              in    std_ulogic;                   -- flywheel generated F bit
        fly_sav:        in    std_ulogic;                   -- asserted during first word of flywheel generated SAV
        fly_eav:        in    std_ulogic;                   -- asserted during first word of flywheel generated EAV
        rx_eav_first:   in    std_ulogic;                   -- asserted during first word of received EAV
        lock:           in    std_ulogic;                   -- asserted when flywheel is locked
        vcnt:           inout 
            std_logic_vector(VCNT_WIDTH - 1 downto 0);      -- vertical counter
        v:              out   std_ulogic;                   -- vertical blanking interval indicator
        sloppy_v:       out   std_ulogic;                   -- asserted when FSM should ignore V bit in XYZ compare
        inc_f:          out   std_ulogic;                   -- toggles the F bit when asserted
        switch_interval:inout std_ulogic);                  -- asserted when current line is sync switch line
end;

architecture synth of fly_vert is

subtype vposition is std_logic_vector(VCNT_WIDTH - 1 downto 0);

-------------------------------------------------------------------------------
-- Constant definitions
--

--
-- This group of constants defines the bit widths of various fields in the
-- module. 
--
constant VCNT_MSB :             integer := VCNT_WIDTH - 1; -- MS bit # of vcnt

--
-- This group of constants defines the synchronous switching interval lines.
--
constant NTSC_FLD1_SWITCH :     vposition := std_logic_vector(TO_UNSIGNED(10,  VCNT_WIDTH));
constant NTSC_FLD2_SWITCH :     vposition := std_logic_vector(TO_UNSIGNED(273, VCNT_WIDTH));
constant PAL_FLD1_SWITCH :      vposition := std_logic_vector(TO_UNSIGNED(6,   VCNT_WIDTH));
constant PAL_FLD2_SWITCH :      vposition := std_logic_vector(TO_UNSIGNED(319, VCNT_WIDTH));
    
--
-- This group of constants defines the ending positions of the fields for
-- NTSC and PAL.
--
constant NTSC_FLD1_END :        vposition := std_logic_vector(TO_UNSIGNED(265, VCNT_WIDTH));
constant NTSC_FLD2_END :        vposition := std_logic_vector(TO_UNSIGNED(3,   VCNT_WIDTH));
constant PAL_FLD1_END :         vposition := std_logic_vector(TO_UNSIGNED(312, VCNT_WIDTH));
constant PAL_FLD2_END :         vposition := std_logic_vector(TO_UNSIGNED(625, VCNT_WIDTH));
constant NTSC_V_TOTAL :         vposition := std_logic_vector(TO_UNSIGNED(525, VCNT_WIDTH));
constant PAL_V_TOTAL :          vposition := std_logic_vector(TO_UNSIGNED(625, VCNT_WIDTH));
    
--
-- This group of constants defines the starting and ending active portions of
-- of the fields.
--
constant NTSC_FLD1_ACT_START :  vposition := std_logic_vector(TO_UNSIGNED(20,  VCNT_WIDTH));
constant NTSC_FLD1_ACT_END :    vposition := std_logic_vector(TO_UNSIGNED(263, VCNT_WIDTH));
constant NTSC_FLD2_ACT_START :  vposition := std_logic_vector(TO_UNSIGNED(283, VCNT_WIDTH));
constant NTSC_FLD2_ACT_END :    vposition := std_logic_vector(TO_UNSIGNED(525, VCNT_WIDTH));
constant PAL_FLD1_ACT_START :   vposition := std_logic_vector(TO_UNSIGNED(23,  VCNT_WIDTH));
constant PAL_FLD1_ACT_END :     vposition := std_logic_vector(TO_UNSIGNED(310, VCNT_WIDTH));
constant PAL_FLD2_ACT_START :   vposition := std_logic_vector(TO_UNSIGNED(336, VCNT_WIDTH));
constant PAL_FLD2_ACT_END :     vposition := std_logic_vector(TO_UNSIGNED(623, VCNT_WIDTH));
         
--
-- This group of constants defines the starting lines on which it is possible
-- for the V bit to change early. This is due to previous versions of the
-- specifications that allowed for an early transition from 1 to 0 on the V
-- bit. This only occurs in the NTSC specifications. The period of ambiguity
-- on the V bit ends with the first active video line of each field as
-- defined above.
--
constant SLOPPY_V_START_FLD1 :  vposition := std_logic_vector(TO_UNSIGNED(10,  VCNT_WIDTH));
constant SLOPPY_V_START_FLD2 :  vposition := std_logic_vector(TO_UNSIGNED(273, VCNT_WIDTH));


-------------------------------------------------------------------------------
-- Signal definitions
--

-- internal signals
signal vcount :         vposition;  -- vertical counter
signal clr_vcnt :       std_ulogic; -- clears the vertical counter
signal new_vcnt :       vposition;  -- new vlaue to load into vcount
signal fld1_switch :    vposition;  -- sync switching line for field 1
signal fld2_switch :    vposition;  -- sync switching line for field 2
signal fld_switch :     vposition;  -- sync switching ilne for current field
signal switch_line :    std_ulogic; -- asserted when vcnt = fld_switch
signal v_total :        vposition;  -- total lines for this video standard
signal fld1_act_start : vposition;  -- start line of active video in field 1
signal fld1_act_end :   vposition;  -- ending line of active video in field 1
signal fld2_act_start : vposition;  -- start line of active video field 2
signal fld2_act_end :   vposition;  -- ending line of active video in field 2
signal fld_act_start :  vposition;  -- start line of active video in current field
signal fld_act_end :    vposition;  -- ending line of active video in current field
signal act_start :      std_ulogic; -- asserted when vcnt = fld_act_start
signal fld1_end :       vposition;  -- line count for end of field 1
signal fld2_end :       vposition;  -- line count for end of field 2
signal fld_end :        vposition;  -- line count for end of current field
signal sloppy_start :   vposition;  -- starting position of V bit ambiguity region
signal lock_switch :    std_ulogic; -- locked and switch_interval

begin
    
    --
    -- vcnt: vertical counter
    --
    -- The vertical counter increments once per line to keep track of the 
    -- current vertical position. If clr_vcnt is asserted, vcnt is loaded with a
    -- value of 1. If ld_vcnt is asserted, the new_vcnt value is loaded into 
    -- vcnt. If the state machine asserts the fsm_inc_vcnt signal indicating a 
    -- synchronous switch event, then the vcnt must be forced to increment since
    -- the received EAV came before the flywheel's generated EAV, causing the 
    -- hcnt to be updated to a position after the EAV and thus skipping the 
    -- normal inc_vcnt signal that comes with the flywheel's EAV.
    --
    lock_switch <= lock and switch_interval;

    process(clk, rst)
    begin
        if (rst = '1') then
            vcount <= std_logic_vector(TO_UNSIGNED(1, VCNT_WIDTH));
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (ld_vcnt = '1') then
                    vcount <= new_vcnt;
                elsif (fsm_inc_vcnt = '1' or
                       (lock_switch = '1' and rx_eav_first = '1') or
                       (lock_switch = '0' and eav_next = '1')) then
                    if (clr_vcnt = '1') then
                        vcount <= std_logic_vector(TO_UNSIGNED(1, VCNT_WIDTH));
                    else
                        vcount <= vcount + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;


    v_total <= NTSC_V_TOTAL when ntsc = '1' else PAL_V_TOTAL;
    clr_vcnt <= '1' when vcount = v_total else '0';
    vcnt <= vcount;

    process(ntsc, rx_f)
    begin
        if (ntsc = '1') then
            if (rx_f = '1') then
                new_vcnt <= NTSC_FLD1_END + 1;
            else
                new_vcnt <= NTSC_FLD2_END + 1;
            end if;
        else
            if (rx_f = '1') then
                new_vcnt <= PAL_FLD1_END + 1;
            else
                new_vcnt <= std_logic_vector(TO_UNSIGNED(1, VCNT_WIDTH));
            end if;
        end if;
    end process;


    --
    -- synchronous switching line detector
    --
    -- This code determines when the current line is a line during which
    -- it is permitted to switch between synchronous video sources. These 
    -- sources may have a small amount of offset. The flywheel will immediately 
    -- resynchronize to the new signal on the synchronous switching lines 
    -- without the usual flywheel induced delay.
    --
    process(ntsc)
    begin
        if (ntsc = '1') then
            fld1_switch <= NTSC_FLD1_SWITCH;
            fld2_switch <= NTSC_FLD2_SWITCH;
        else
            fld1_switch <= PAL_FLD1_SWITCH;
            fld2_switch <= PAL_FLD2_SWITCH;
        end if;
    end process;

    fld_switch <= fld2_switch when f = '1' else fld1_switch;

    switch_line <= '1' when vcount = fld_switch else '0';

    process(clk, rst)
    begin
        if (rst = '1') then
            switch_interval <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if ((switch_interval = '1' and clr_switch = '1') or
                    (switch_interval = '0' and fly_eav = '1')) then
                    switch_interval <= '0';
                elsif (fly_sav = '1') then
                    switch_interval <= switch_line;
                end if;
            end if;
        end if;
    end process;

    --
    -- v
    --
    -- This logic generates the V bit for the TRS XYZ word. The V bit is 
    -- asserted in the TRS symbols of all lines in the vertical blanking 
    -- interval. It is generated by comparing the vcnt starting and ending 
    -- positions of the current field at the beginning of the EAV symbol. 
    -- Whenever the state machine reloads the field counter by asserted ld_f, 
    -- the v flag should be set because the field counter is only reloaded in 
    -- the vertical blanking interval.
    --
    process(ntsc)
    begin
        if (ntsc = '1') then
            fld1_act_start <= NTSC_FLD1_ACT_START - 1;
            fld1_act_end   <= NTSC_FLD1_ACT_END;
            fld2_act_start <= NTSC_FLD2_ACT_START - 1;
            fld2_act_end   <= NTSC_FLD2_ACT_END;
        else
            fld1_act_start <= PAL_FLD1_ACT_START - 1;
            fld1_act_end   <= PAL_FLD1_ACT_END;
            fld2_act_start <= PAL_FLD2_ACT_START - 1;
            fld2_act_end   <= PAL_FLD2_ACT_END;
        end if;
    end process;


    fld_act_start <= fld2_act_start when f = '1' else fld1_act_start;
    fld_act_end   <= fld2_act_end when f = '1' else fld1_act_end;
    act_start <= '1' when vcnt = fld_act_start else '0';

    process(clk, rst)
    begin
        if (rst = '1') then
            v <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (ld_vcnt = '1') then
                    v <= '1';
                elsif (eav_next = '1') then
                    if (vcnt = fld_act_start) then
                        v <= '0';
                    elsif (vcnt = fld_act_end) then
                        v <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;

    --
    -- inc_f
    --
    -- This logic determines when to toggle the F bit.
    --
    process(ntsc)
    begin
        if (ntsc = '1') then
            fld1_end <= NTSC_FLD1_END;
            fld2_end <= NTSC_FLD2_END;
        else
            fld1_end <= PAL_FLD1_END;
            fld2_end <= PAL_FLD2_END;
        end if;
    end process;

    fld_end <= fld2_end when f = '1' else fld1_end;
    inc_f <= '1' when vcnt = fld_end else '0';

    --
    -- sloppy_v
    --
    -- This signal is asserted during the interval when the V bit should be
    -- ignored in XYZ comparisons due to ambiguity in earlier versions of the
    -- NTSC digital video specifications.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            sloppy_v <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (ld_vcnt = '1' or ntsc = '0') then
                    sloppy_v <= '0';
                else
                    if (vcnt = sloppy_start) then
                        sloppy_v <= '1';
                    elsif (eav_next = '1' and act_start = '1') then
                        sloppy_v <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;

    sloppy_start <= SLOPPY_V_START_FLD2 when f = '1' else SLOPPY_V_START_FLD1;

end synth;