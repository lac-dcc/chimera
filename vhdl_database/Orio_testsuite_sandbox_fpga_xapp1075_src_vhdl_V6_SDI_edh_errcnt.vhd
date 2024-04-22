-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: edh_errcnt.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2004-12-15 16:02:56-07 $
-- /___/   /\    Date Created: May 8, 2002 
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: edh_errcnt.vhd,rcs $
-- Revision 1.0  2004-12-15 16:02:56-07  jsnow
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
-- This module keeps a running count of the number of video fields that contain
-- an EDH error. By default, the counter is a 24-bit counter, but the counter
-- width can be modified by changing the ERRFLD_WIDTH constant.
-- 
-- A 16-bit wide error flag input vector, flags, allows up to sixteen different 
-- error flags to be monitored by the error counter. Each of the 16 error flags
-- has an associated flag_enable signal. If a flag_enable signal is low, the
-- corresponding error flag is ignored by the counter. If any enabled error flag
-- is asserted at the next EDH packet (edh_next asserted), the error counter is
-- incremented. There is no latching mechanism on the error flags -- they must
-- remain asserted until edh_next is asserted in order to increment the counter.
-- 
-- The error counter will saturate and will not roll over when it reaches the
-- maximum count. The counter is cleared on reset and when clr_errcnt is 
-- asserted.
-- 
-- A count enable input, count_en, is also provided to enable and disable the
-- error counter. This can be used to disable the counter when the video decoder
-- is not synchronized to the video stream. 
--
-------------------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.anc_edh_pkg.all;

entity edh_errcnt is
    port (
        -- inputs
        clk:            in    std_ulogic;       -- clock input
        ce:             in    std_ulogic;       -- clock enable
        rst:            in    std_ulogic;       -- async reset input
        clr_errcnt:     in    std_ulogic;       -- clears the error counter
        count_en:       in    std_ulogic;       -- enables error counter when high
        flag_enables:   in    edh_allflg_type;  -- specifies which flags increment counter
        flags:          in    edh_allflg_type;  -- error flag inputs
        edh_next:       in    std_ulogic;       -- counter increment on edh_next asserted

        -- outputs
        errcnt:         out   edh_errcnt_type); -- errored field counter
end;

architecture synth of edh_errcnt is
         
-------------------------------------------------------------------------------
-- Signal definitions
--
signal enabled_flags:   edh_allflg_type;        -- error flags after ANDing with enables
signal err_in_field:    std_ulogic;             -- OR of all enabled error flags
signal errcnt_tc:       std_ulogic;             -- asserted when errcnt reaches terminal count
signal next_count:      edh_errcnt_type;        -- current error count + 1
signal cntr:            edh_errcnt_type;        -- actual error counter

begin
    --
    -- flag enabling logic
    --
    enabled_flags <= flags and flag_enables;
    err_in_field <= '0' when (enabled_flags = EDH_ALL_FLAGS_LOW) 
                    else '1';

    --
    -- error counter
    --
    next_count <= cntr + 1;
    errcnt_tc <= '1' when (next_count = EDH_ERRCNT_TC) else '0';
        
    process(clk, rst)
    begin
        if (rst = '1') then
            cntr <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (clr_errcnt = '1') then
                    cntr <= (others => '0');
                elsif (edh_next = '1' and errcnt_tc = '0' and 
                       err_in_field = '1' and count_en = '1') then
                    cntr <= next_count;
                end if;
            end if;
        end if;
    end process;
            
    --
    -- output assignment
    --
    errcnt <= cntr;
             
end synth;
