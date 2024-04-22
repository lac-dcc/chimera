-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: fly_field.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2004-12-15 16:13:25-07 $
-- /___/   /\    Date Created: March 11, 2002
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: fly_field.vhd,rcs $
-- Revision 1.0  2004-12-15 16:13:25-07  jsnow
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
-- This module implements the field related functions for the video flywheel.
-- There are two main field related functions included in this module. The first
-- is the F bit. This bit indicates the field that is currently active. The 
-- other function is the received field transition detector. This function 
-- determines when the received video transition from one field to the next.
-- 
-- The inputs to this module are:
-- 
-- clk: clock input
-- 
-- rst: asynchronous reset input
-- 
-- ce: clock enable
-- 
-- ld_f: When this input is asserted, the F flip-flop is loaded with the 
-- current field value.
-- 
-- inc_f: When this input is asserted the F flip-flop is toggled.
-- 
-- eav_next: Must be asserted the clock cycle before the first word of an EAV 
-- symbol is processed by the flywheel.
-- 
-- rx_field: This is the F bit from the XYZ word of the input video stream. This
-- input is only valied when rx_xyz is asserted.
-- 
-- rx_xyz: Asserted when the flywheel is processing the XYZ word of a TRS 
-- symbol.
-- 
-- The outputs of this module are:
-- 
-- f: Current field bit
-- 
-- new_rx_field: Asserted for when a field transition is detected. This signal
-- will be asserted for the entire duration of the first line of a new field.
--
-------------------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity fly_field is
    port (
        clk:          in    std_ulogic;     -- clock input
        rst:          in    std_ulogic;     -- async reset input
        ce:           in    std_ulogic;     -- clock enable
        ld_f:         in    std_ulogic;     -- loads the F bit
        inc_f:        in    std_ulogic;     -- toggles the F bit
        eav_next:     in    std_ulogic;     -- asserted when next word is first word of EAV
        rx_field:     in    std_ulogic;     -- F bit from received XYZ word
        rx_xyz:       in    std_ulogic;     -- asserted during XYZ word of received TRS
        f:            inout std_ulogic;     -- field bit
        new_rx_field: out   std_ulogic);    -- asserted when received field changes
end;


architecture synth of fly_field is

-------------------------------------------------------------------------------
-- Signal definitions
--

-- internal signals
signal rx_f_now :       std_ulogic;         -- holds F bit from most recent XYZ word
signal rx_f_prev :      std_ulogic;         -- holds F bit from previous XYZ word

begin
    
    --
    -- field bit
    --                                  
    -- The field bit keep track of the current field (even or odd). It loads 
    -- from the rx_f_now value when ld_f is asserted during the time the 
    -- flywheel is synchronizing with the incoming video. Otherwise, it toggles 
    -- at the beginning of each field.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            f <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (ld_f = '1') then
                    f <= rx_f_now;
                elsif (eav_next = '1' and inc_f = '1') then
                    f <= not f;
                end if;
            end if;
        end if;
    end process;

    --
    -- received video new field detection
    --
    -- The rx_f_now register holds the field value for the current field.
    -- The rx_f_prev register holds the field value from the previous field. If
    -- there is a difference between these two registers, the new_rx_field 
    -- signal is asserted. This informs the FSM that the received video has 
    -- transitioned from one field to the next.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            rx_f_now  <= '0';
            rx_f_prev <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (rx_xyz = '1') then
                    rx_f_now  <= rx_field;
                    rx_f_prev <= rx_f_now;
                end if;
            end if;
        end if;
    end process;

    new_rx_field <= rx_f_now xor rx_f_prev;

end synth;