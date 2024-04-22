-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: edh_loc.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2004-12-15 16:05:41-07 $
-- /___/   /\    Date Created: May 8, 2002 
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: edh_loc.vhd,rcs $
-- Revision 1.0  2004-12-15 16:05:41-07  jsnow
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
-- This module examines the vcnt and hcnt values to determine when it is time 
-- for an EDH packet to appear in the video stream. The signal edh_next is 
-- asserted during the sample before the first location of the first ADF word of
-- the EDH packet.
-- 
-- The output of this module is used to determine if EDH packets are missing 
-- from the input video stream and to determine when to insert EDH packets into
-- the output video stream.
--
-------------------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.anc_edh_pkg.all;

entity edh_loc is
    port (
        clk:            in  std_ulogic; -- clock input
        ce:             in  std_ulogic; -- clock enable
        rst:            in  std_ulogic; -- async reset input
        f:              in  std_ulogic; -- field bit
        vcnt:           in  vpos_type;  -- vertical line count
        hcnt:           in  hpos_type;  -- horizontal position
        std:            in  vidstd_type;-- video standards
        edh_next:       out std_ulogic);-- EDH packet should begin on next sample
end;

architecture synth of edh_loc is
        
-------------------------------------------------------------------------------
-- Signal definitions
--
signal ntsc:            std_ulogic;     -- 1 = NTSC, 0 = PAL
signal edh_line_num:    vpos_type;      -- EDH occurs on this line number
signal edh_line:        std_ulogic;     -- asserted when vcnt == edh_line_num
signal edh_hcnt:        hpos_type;      -- EDH begins sample after this value
signal edh_next_d:      std_ulogic;     -- asserted when next sample begins EDH

begin
    --
    -- EDH vertical position detector
    -- 
    -- The following code determines when the current video line number (vcnt)
    -- matches the line where the next EDH packet location occurs. The line 
    -- numbers for the EDH packets are different for NTSC and PAL video 
    -- standards. Also, there is one EDH per field, so the field bit (f) is used
    -- to determine the line number of the next EDH packet.
    --
    ntsc <= '1' when (std = NTSC_422) or (std = NTSC_INVALID) or
                     (std = NTSC_422_WIDE) or (std = NTSC_4444) else
            '0';

    process(ntsc, f)
    begin
        if (ntsc = '1') then
            if (f = '0') then
                edh_line_num <= NTSC_FLD2_EDH_LINE;
            else
                edh_line_num <= NTSC_FLD1_EDH_LINE;
            end if;
        else
            if (f = '0') then
                edh_line_num <= PAL_FLD2_EDH_LINE;
            else
                edh_line_num <= PAL_FLD1_EDH_LINE;
            end if;
        end if;
    end process;
                
    edh_line <= '1' when vcnt = edh_line_num else '0';

    --
    -- EDH horizontal position detector
    --
    -- This code matches the current horizontal count (hcnt) with the word count
    -- of the next EDH location. The location of the EDH packet is immediately 
    -- before the SAV. edh_next_d is asserted when both the vcnt and hcnt match
    -- the EDH packet location (actually two words before the start of the EDH).
    --
    process(std)
    begin
        case std is
            when NTSC_422       => edh_hcnt <= EDH_NTSC_422 - 2;
            when NTSC_422_WIDE  => edh_hcnt <= EDH_NTSC_422_WIDE - 2;
            when NTSC_4444      => edh_hcnt <= EDH_NTSC_4444 - 2;
            when PAL_422        => edh_hcnt <= EDH_PAL_422 - 2;
            when PAL_422_WIDE   => edh_hcnt <= EDH_PAL_422_WIDE - 2;
            when PAL_4444       => edh_hcnt <= EDH_PAL_4444 - 2;
            when others         => edh_hcnt <= EDH_NTSC_422 - 2;
        end case;
    end process;

    process(edh_line, edh_hcnt, hcnt)
    begin
        if (edh_line = '1' and edh_hcnt = hcnt) then
            edh_next_d <= '1';
        else
            edh_next_d <= '0';
        end if;
    end process;

    --
    -- output register
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            edh_next <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                edh_next <= edh_next_d;
            end if;
        end if;
    end process;

end synth;