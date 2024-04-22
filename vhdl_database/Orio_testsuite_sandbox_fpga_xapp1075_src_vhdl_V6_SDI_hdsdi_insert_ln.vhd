-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: hdsdi_insert_ln.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2004-12-09 14:58:32-07 $
-- /___/   /\    Date Created: May 28, 2004 
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: hdsdi_insert_ln.vhd,rcs $
-- Revision 1.1  2004-12-09 14:58:32-07  jsnow
-- Cosmetic changes only.
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
-- This module formats the 11-bit line number value into two 10-bit words and 
-- inserts them into their proper places immediately after the EAV word. The
-- insert_ln input can disable the insertion of line numbers. The same line
-- number value is inserted into both video channels. 
-- 
-- In the SMPTE 292M standard, the 11-bit line numbers must be formatted into 
-- two 10-bit words with the format of each word as follows:
-- 
--         b9    b8    b7    b6    b5    b4    b3    b2    b1    b0
--      +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
-- LN0: | ~ln6| ln6 | ln5 | ln4 | ln3 | ln2 | ln1 | ln0 |  0  |  0  |
--      +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
-- LN1: |  1  |  0  |  0  |  0  | ln10| ln9 | ln8 | ln7 |  0  |  0  |
--      +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
--       
-- 
-- This module is purely combinatorial and has no delay registers.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.hdsdi_pkg.all;

entity hdsdi_insert_ln is
    port (
        insert_ln:  in  std_logic;      -- enables insertion of line numbers when 1
        ln_word0:   in  std_logic;      -- input asserted during time for first LN word in EAV
        ln_word1:   in  std_logic;      -- input asserted during time for second LN word in EAV
        c_in:       in  hd_video_type;  -- C channel video input
        y_in:       in  hd_video_type;  -- Y channel video input
        ln:         in  hd_vpos_type;   -- line number inputs
        c_out:      out hd_video_type;  -- C channel video output
        y_out:      out hd_video_type   -- Y channel video output
    );
end hdsdi_insert_ln;

architecture synth of hdsdi_insert_ln is

begin

    process(ln, insert_ln, c_in, ln_word0, ln_word1)
    begin
        if insert_ln = '1' and ln_word0 = '1' then
            c_out <= (not ln(6) & ln(6 downto 0) & "00");
        elsif insert_ln = '1' and ln_word1 = '1' then
            c_out <= ("1000" & ln(10 downto 7) & "00");
        else
            c_out <= c_in;
        end if; 
    end process;

    process(ln, insert_ln, y_in, ln_word0, ln_word1)
    begin
        if insert_ln = '1' and ln_word0 = '1' then
            y_out <= (not ln(6) & ln(6 downto 0) & "00");
        elsif insert_ln = '1' and ln_word1 = '1' then
            y_out <= ("1000" & ln(10 downto 7) & "00");
        else
            y_out <= y_in;
        end if; 
    end process;

end synth;

