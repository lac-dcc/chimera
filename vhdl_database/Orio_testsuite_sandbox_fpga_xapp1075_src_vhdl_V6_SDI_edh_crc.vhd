-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: edh_crc.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2004-12-15 15:59:48-07 $
-- /___/   /\    Date Created: May 8, 2002 
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: edh_crc.vhd,rcs $
-- Revision 1.0  2004-12-15 15:59:48-07  jsnow
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
-- This module calculates the active picture and full-frame CRC values. The 
-- ITU-R BT.1304 and SMPTE RP 165-1994 standards define how the two CRC values 
-- are to be calculated.
-- 
-- The module uses the vertical line count (vcnt) input, the field bit (f), the
-- horizontal blanking interval bit (h), and the eav_next, sav_next, and 
-- xyz_word inputs to determine which samples to include in the two CRC 
-- calculations.
-- 
-- The calculation is a standard CRC16 calculation with a polynomial of x^16 + 
-- x^12 + x^5 + 1. The function considers the LSB of the video data as the first
-- bit shifted into the CRC generator, although the implementation given here is
-- a fully parallel CRC, calculating all 16 CRC bits from the 10-bit video data 
-- in one clock cycle.  The CRC calculation is done is the edh_crc16 module. It 
-- is  instanced twice, once for the full-frame calculation and once for the 
-- active-picture calculation.    
-- 
-- For each CRC calculation, a valid bit is also generated. After reset the 
-- valid bits will be negated until the locked input from the video decoder is 
-- asserted. The valid bits remain asserted even if locked is negated. However, 
-- the valid bits will be negated for one filed if the locked signal rises 
-- during a CRC calculation, indicating that the video decoder has 
-- re-synchronized.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.anc_edh_pkg.all;

entity edh_crc is
    port (
        -- inputs
        clk:            in  std_ulogic; -- clock input
        ce:             in  std_ulogic; -- clock enable
        rst:            in  std_ulogic; -- async reset input
        f:              in  std_ulogic; -- field bit
        h:              in  std_ulogic; -- horizontal blanking bit
        eav_next:       in  std_ulogic; -- asserted when next sample begins EAV symbol
        xyz_word:       in  std_ulogic; -- asserted when current word is the XYZ word of a TRS
        vid_in:         in  video_type; -- video data
        vcnt:           in  vpos_type;  -- vertical line count
        std:            in  vidstd_type;-- indicates the video standard
        locked:         in  std_ulogic; -- asserted when flywheel is locked

        -- outputs
        ap_crc:         out crc16_type; -- calculated active picture CRC
        ap_crc_valid:   out std_ulogic; -- asserted when AP CRC is valid
        ff_crc:         out crc16_type; -- calculated full-frame CRC
        ff_crc_valid:   out std_ulogic);-- asserted when FF CRC is valid
end;


architecture synth of edh_crc is

--------------------------------------------------------------------------------
-- Constant definitions
--

--
-- This group of constants defines the line numbers that begin and end the
-- two CRC intervals. Values are given for both fields and for both NTSC and
-- PAL.
--
constant NTSC_FLD1_AP_FIRST: vpos_type := vpos_type(TO_UNSIGNED( 21, vpos_type'length));
constant NTSC_FLD1_AP_LAST:  vpos_type := vpos_type(TO_UNSIGNED(262, vpos_type'length));
constant NTSC_FLD1_FF_FIRST: vpos_type := vpos_type(TO_UNSIGNED( 12, vpos_type'length));
constant NTSC_FLD1_FF_LAST:  vpos_type := vpos_type(TO_UNSIGNED(271, vpos_type'length));
    
constant NTSC_FLD2_AP_FIRST: vpos_type := vpos_type(TO_UNSIGNED(284, vpos_type'length));
constant NTSC_FLD2_AP_LAST:  vpos_type := vpos_type(TO_UNSIGNED(525, vpos_type'length));
constant NTSC_FLD2_FF_FIRST: vpos_type := vpos_type(TO_UNSIGNED(275, vpos_type'length));
constant NTSC_FLD2_FF_LAST:  vpos_type := vpos_type(TO_UNSIGNED(  8, vpos_type'length));

constant PAL_FLD1_AP_FIRST:  vpos_type := vpos_type(TO_UNSIGNED( 24, vpos_type'length));
constant PAL_FLD1_AP_LAST:   vpos_type := vpos_type(TO_UNSIGNED(310, vpos_type'length));
constant PAL_FLD1_FF_FIRST:  vpos_type := vpos_type(TO_UNSIGNED(  8, vpos_type'length));
constant PAL_FLD1_FF_LAST:   vpos_type := vpos_type(TO_UNSIGNED(317, vpos_type'length));

constant PAL_FLD2_AP_FIRST:  vpos_type := vpos_type(TO_UNSIGNED(336, vpos_type'length));
constant PAL_FLD2_AP_LASt:   vpos_type := vpos_type(TO_UNSIGNED(622, vpos_type'length));
constant PAL_FLD2_FF_FIRST:  vpos_type := vpos_type(TO_UNSIGNED(321, vpos_type'length));
constant PAL_FLD2_FF_LAST:   vpos_type := vpos_type(TO_UNSIGNED(  4, vpos_type'length));


-------------------------------------------------------------------------------
-- Signal defintions
--
signal ntsc:            std_ulogic;     -- 1 = NTSC, 0 = PAL
signal ap_crc_reg:      crc16_type;     -- active picture CRC register
signal ff_crc_reg:      crc16_type;     -- full field cRC register
signal ap_crc16:        crc16_type;     -- active picture CRC calc output
signal ff_crc16:        crc16_type;     -- full field CRC calc output
signal ap_region:       std_ulogic;     -- asserted during active picture CRC interval
signal ff_region:       std_ulogic;     -- asserted during full field CRC interval
signal ap_start_line:   vpos_type;      -- active picture interval start line
signal ap_end_line:     vpos_type;      -- active picture interval end line
signal ff_start_line:   vpos_type;      -- full field interval start line
signal ff_end_line:     vpos_type;      -- full field interval end line
signal ap_start:        std_ulogic;     -- result of comparing ap_start_line with vcnt
signal ap_end:          std_ulogic;     -- result of comparing ap_end_line with vcnt
signal ff_start:        std_ulogic;     -- result of comparing ff_start_line with vcnt
signal ff_end:          std_ulogic;     -- result of comparing ff_end_line with vcnt
signal sav:             std_ulogic;     -- asserted during XYZ word of SAV symbol
signal eav:             std_ulogic;     -- asserted during XYZ word of EAV symbol
signal ap_crc_clr:      std_ulogic;     -- clears the active picture CRC register
signal ff_crc_clr:      std_ulogic;     -- clears the full field CRC register
signal clipped_vid:     video_type;     -- output of video clipper function
signal ap_valid:        std_ulogic;     -- ap_crc_valid internal signal
signal ff_valid:        std_ulogic;     -- ff_crc_valid internal signal
signal prev_locked:     std_ulogic;     -- locked input signal delayed once clock
signal locked_rise:     std_ulogic;     -- asserted on rising edge of locked
signal clip:            std_ulogic;     -- clip the input video when asserted

--
-- Component definitions
--
component edh_crc16
    port(
        c:      in    crc16_type;       -- current CRC value
        d:      in    video_type;       -- input data word
        crc:    inout crc16_type);      -- new calculated CRC value
end component;
    
begin
    
    --
    -- video clipper
    --
    -- The SMPTE and ITU specifications require that the video data values used
    -- by the CRC calculation have the 2 LSBs both be ones if the 8 MSBs are all
    -- ones.
    --
    clip <= vid_in(9) and vid_in(8) and vid_in(7) and vid_in(6) and
            vid_in(5) and vid_in(4) and vid_in(3) and vid_in(2);

    process(clip, vid_in)
    begin
        clipped_vid(9 downto 2) <= vid_in(9 downto 2);
        if (clip = '1') then
            clipped_vid(1 downto 0) <= "11";
        else
            clipped_vid(1 downto 0) <= vid_in(1 downto 0);
        end if;
    end process;

    --
    -- decoding
    --
    -- These assignments generate the ntsc, eav, and sav signals.
    --
    ntsc <= '1' when (std = NTSC_422 or std = NTSC_INVALID or
                      std = NTSC_422_WIDE or std = NTSC_4444) else '0';
                       
    sav <= not vid_in(6) and xyz_word;
    eav <= vid_in(6) and xyz_word;

    --
    -- ap_region and ff_region generation
    -- 
    -- This code determines when the current video signal is within the active
    -- picture and full field CRC regions. Note that since the F bit changes 
    -- before the end of the EDH full-field time period, the ff_end_line value 
    -- is set to the opposite field value in the assignments below. That is, if 
    -- F is low, normally indicating Field 1, the ff_end_line is assigned to 
    -- xxx_FLD2_FF_LAST, not xxx_FLD1_FF_LAST as might be expected.
    --

    -- This section looks up the starting and ending line numbers of the two CRC
    -- regions based on the current field and video standard.
    process(ntsc, f)
    begin
        if (ntsc = '1') then
            if (f = '0') then
                ap_start_line <= NTSC_FLD1_AP_FIRST;
                ap_end_line   <= NTSC_FLD1_AP_LAST;
                ff_start_line <= NTSC_FLD1_FF_FIRST;
                ff_end_line   <= NTSC_FLD2_FF_LAST;
            else
                ap_start_line <= NTSC_FLD2_AP_FIRST;
                ap_end_line   <= NTSC_FLD2_AP_LAST;
                ff_start_line <= NTSC_FLD2_FF_FIRST;
                ff_end_line   <= NTSC_FLD1_FF_LAST;
            end if;
        else
            if (f = '0') then
                ap_start_line <= PAL_FLD1_AP_FIRST;
                ap_end_line   <= PAL_FLD1_AP_LAST;
                ff_start_line <= PAL_FLD1_FF_FIRST;
                ff_end_line   <= PAL_FLD2_FF_LAST;
            else
                ap_start_line <= PAL_FLD2_AP_FIRST;
                ap_end_line   <= PAL_FLD2_AP_LAST;
                ff_start_line <= PAL_FLD2_FF_FIRST;
                ff_end_line   <= PAL_FLD1_FF_LAST;
            end if;
        end if;
    end process;

    -- These four statements compare the current vcnt value to the starting and
    -- ending line numbers of the two CRC regions.          
    ap_start <= '1' when vcnt = ap_start_line else '0';
    ap_end   <= '1' when vcnt = ap_end_line else '0';
    ff_start <= '1' when vcnt = ff_start_line else '0';
    ff_end   <= '1' when vcnt = ff_end_line else '0';

    -- This code block generates the ap_region signal indicating when the 
    -- current position is in the active-picture CRC region.
    ap_crc_clr <= ap_start and xyz_word and sav;

    process(clk, rst)
    begin
        if (rst = '1') then
            ap_region <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (ap_crc_clr = '1') then
                    ap_region <= '1';
                elsif (ap_end = '1' and eav_next = '1') then
                    ap_region <= '0';
                end if;
            end if;
        end if;
    end process;


    -- This code block generates the ff_region signal indicating when the 
    -- current position is in the full-field CRC region.
    ff_crc_clr <= ff_start and xyz_word and eav;

    process(clk, rst)
    begin
        if (rst = '1') then
            ff_region <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (ff_crc_clr = '1') then
                    ff_region <= '1';
                elsif (ff_end = '1' and eav_next = '1') then
                    ff_region <= '0';
                end if;
            end if;
        end if;
    end process;

    --
    -- Valid bit generation
    --
    -- This code generates the two CRC valid bits.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            prev_locked <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                prev_locked <= locked;
            end if;
        end if;
    end process;

    locked_rise <= not prev_locked and locked;

    process(clk, rst)
    begin
        if (rst = '1') then
            ap_valid <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (locked_rise = '1') then
                    ap_valid <= '0';
                elsif (locked = '1' and ap_crc_clr = '1') then
                    ap_valid <= '1';
                end if;
            end if;
        end if;
    end process;

    process(clk, rst)
    begin
        if (rst = '1') then
            ff_valid <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (locked_rise = '1') then
                    ff_valid <= '0';
                elsif (locked = '1' and ff_crc_clr = '1') then
                    ff_valid <= '1';
                end if;
            end if;
        end if;
    end process;

    --
    -- CRC calculations and registers
    --
    -- Each CRC is calculated separately by an edh_crc16 module. Associted with
    -- each is a register. The register acts as an accumulation register and is
    -- fed back into the edh_crc16 module to be combined with the next video
    -- word. Enable logic for the registers determines which words are 
    -- accumulated into the CRC value by controlling the load enables to the two
    -- registers.
    --

    -- Active-picture CRC calculator
    apcrc16 : edh_crc16
        port map (
            c       => ap_crc_reg,
            d       => clipped_vid,
            crc     => ap_crc16);

    -- Active-picture CRC register
    process(clk, rst)
    begin
        if (rst = '1') then
            ap_crc_reg <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (ap_crc_clr = '1') then
                    ap_crc_reg <= (others => '0');
                elsif (ap_region = '1' and h = '0') then
                    ap_crc_reg <= ap_crc16;
                end if;
            end if;
        end if;
    end process;
            
    -- Full-field CRC calculator
    ffcrc16 : edh_crc16
        port map (
            c       => ff_crc_reg,
            d       => clipped_vid,
            crc     => ff_crc16);

    -- Full-field CRC register
    process(clk, rst)
    begin
        if (rst = '1') then
            ff_crc_reg <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (ff_crc_clr = '1') then
                    ff_crc_reg <= (others => '0');
                elsif (ff_region = '1') then
                    ff_crc_reg <= ff_crc16;
                end if;
            end if;
        end if;
    end process;
            
    --
    -- Output assignments
    --
    ap_crc <= ap_crc_reg;
    ap_crc_valid <= ap_valid;
    ff_crc <= ff_crc_reg;
    ff_crc_valid <= ff_valid;
                        
end synth;
