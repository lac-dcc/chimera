-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: video_decode.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2006-07-12 08:18:05-06 $
-- /___/   /\    Date Created: March 11, 2002 
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: video_decode.vhd,rcs $
-- Revision 1.1  2006-07-12 08:18:05-06  jsnow
-- Small modification to support the new early V bit modification
-- in the flywheel module.
--
-- Revision 1.0  2004-12-15 16:09:54-07  jsnow
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
-- This module instances and interconnects the three modules that make up the
-- digital video decoder: the TRS Detector, the Automatic Video Standard 
-- Detector, and the Video Flywheel.
-- 
-- Together, these three modules will examine a video stream and determine the
-- format of the video from one of the six supported video standards. The 
-- flywheel then synchronizes to the video stream to provide horizontal and 
-- vertical counts so other modules can determine the location of data that 
-- occurs in regular fixed locations, like the EDH packets. The flywheel will 
-- also regenerate TRS symbols and insert them into the video stream so that the
-- video contains valid TRS symbols even if the input video is noisy or stops 
-- altogether.
-- 
-- This module has the following inputs:
-- 
-- clk: clock input
-- 
-- ce: clock enable
-- 
-- rst: asynchronous reset input
-- 
-- vid_in: input video stream
-- 
-- reacquire: forces the autodetect unit to reacquire the video standard
-- 
-- en_sync_switch: enables support for synchronous video switching
-- 
-- en_trs_blank: enable TRS blanking
-- 
-- The module has the following outputs:
-- 
-- std: 3-bit video standard code from the autodetect module
-- 
-- std_locked: asserted when std is valid
-- 
-- trs: asserted during the four words when vid_out contains the TRS symbol 
-- words
-- 
-- vid_out: output video stream
-- 
-- field: indicates the current video field
-- 
-- v_blank: vertical blanking interval indicator
-- 
-- h_blank: horizontal blanking interval indicator
-- 
-- horz_count: the horizontal position of the word present on vid_out
-- 
-- vert_count: the vertical position of the word present on vid_out
-- 
-- sync_switch: asserted during the synchronous switching interval
-- 
-- locked: asserted when the flywheel is synchronized with the input video 
-- stream
-- 
-- eav_next: asserted the clock cycle before the first word of an EAV appears on
-- vid_out
-- 
-- sav_next: asserted the clock sycle before the first word of an SAV appears on 
-- vid_out
-- 
-- xyz_word: asserted when vid_out contains the XYZ word of a TRS symbol
-- 
-- anc_next: asserted the clock cycle before the first word of the ADF of an ANC
-- packet appears on vid_out
-- 
-- edh_next: asserted the clock cycle before the first word of the ADF of an EDH
-- packet appears on vid_out
--
-------------------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity video_decode is
    generic (
        HCNT_WIDTH : integer := 12;
        VCNT_WIDTH : integer := 10);
    port (
        clk:            in    std_ulogic;                       -- clock input
        ce:             in    std_ulogic;                       -- clock enable
        rst:            in    std_ulogic;                       -- async reset input
        vid_in:         in    std_ulogic_vector(9 downto 0);    -- input video
        reacquire:      in    std_ulogic;                       -- forces autodetect to reacquire the standard
        en_sync_switch: in    std_ulogic;                       -- enables sync switching
        en_trs_blank:   in    std_ulogic;                       -- enables TRS blanking
        std:            inout std_ulogic_vector(2 downto 0);    -- video standard code
        std_locked:     inout std_ulogic;                       -- autodetect circuit is locked to standard
        trs:            out   std_ulogic;                       -- asserted during TRS symbol
        vid_out:        out   std_ulogic_vector(9 downto 0);    -- output video stream
        field:          out   std_ulogic;                       -- field indicator
        v_blank:        out   std_ulogic;                       -- vertical blanking indicator
        h_blank:        out   std_ulogic;                       -- horizontal blanking indicator
        horz_count:     out   
            std_logic_vector(HCNT_WIDTH-1 downto 0);            -- horizontal counter
        vert_count:     out   
            std_logic_vector(VCNT_WIDTH-1 downto 0);            -- vertical counter
        sync_switch:    out   std_ulogic;                       -- asserted on sync switching lines
        locked:         out   std_ulogic;                       -- asserted when flywheel is synced to input video
        eav_next:       out   std_ulogic;                       -- next word is first word of EAV
        sav_next:       out   std_ulogic;                       -- next word is first word of SAV
        xyz_word:       out   std_ulogic;                       -- current word is the XYZ word
        anc_next:       out   std_ulogic;                       -- next word is first word of ANC packet
        edh_next:       out   std_ulogic                        -- next word is first word of EDH packet
    );                      
end;

architecture synth of video_decode is

subtype video     is std_ulogic_vector(9 downto 0);

--
-- This group of constants defines the bit widths of various fields in the
-- module. 
--
constant HCNT_MSB :         integer := HCNT_WIDTH - 1;      -- MS bit # of hcnt
constant VCNT_MSB :         integer := VCNT_WIDTH - 1;      -- MS bit # of vcnt

-------------------------------------------------------------------------------
-- Signal definitions
--

-- internal signals
signal td_xyz_err :     std_ulogic;     -- trs_detect rx_xyz_err output
signal td_xyz_err_4444: std_ulogic;     -- trs_detect rx_xyz_err output
signal td_vid :         video;          -- video stream from trs_detect
signal td_trs :         std_ulogic;     -- trs_detect rx_trs output
signal td_xyz :         std_ulogic;     -- trs_detect rx_xyz output
signal td_f :           std_ulogic;     -- trs_detect rx_f output
signal td_v :           std_ulogic;     -- trs_detect rx_v output
signal td_h :           std_ulogic;     -- trs_detect rx_h output
signal td_anc :         std_ulogic;     -- trs_detect rx_anc output
signal td_edh :         std_ulogic;     -- trs_detect rx_edh output
signal td_eav :         std_ulogic;     -- trs_detect rx_eav output
signal ad_s4444 :       std_ulogic;     -- autodetect s4444 output
signal ad_xyz_err :     std_ulogic;     -- autodetect xyz_err output

--
-- Component declarations
--

component trs_detect
    port (
        clk:            in  std_ulogic;                     -- clock input
        ce:             in  std_ulogic;                     -- clock enable
        rst:            in  std_ulogic;                     -- async reset input
        vid_in:         in  std_ulogic_vector(9 downto 0);  -- video input
        vid_out:        out std_ulogic_vector(9 downto 0);  -- delayed and clipped video output
        rx_trs:         out std_ulogic;                     -- asserted during first word of TRS symbol
        rx_eav:         out std_ulogic;                     -- asserted during first word of an EAV symbol
        rx_sav:         out std_ulogic;                     -- asserted during first word of an SAV symbol
        rx_f:           out std_ulogic;                     -- field bit from last received TRS symbol
        rx_v:           out std_ulogic;                     -- vertical blanking interval bit from last TRS symbol
        rx_h:           out std_ulogic;                     -- horizontal blanking interval bit from last TRS symbol
        rx_xyz:         out std_ulogic;                     -- asserted during TRS XYZ word
        rx_xyz_err:     out std_ulogic;                     -- XYZ error flag for non-4444 standards
        rx_xyz_err_4444:out std_ulogic;                     -- XYZ error flag for 4444 standards
        rx_anc:         out std_ulogic;                     -- asserted during first word of ADF
        rx_edh:         out std_ulogic                      -- asserted during first word of ADF if it is an EDH packet
    );
end component;

component autodetect
    port (
        clk:            in  std_ulogic;                     -- clock input
        ce:             in  std_ulogic;                     -- clock enable
        rst:            in  std_ulogic;                      -- async reset input
        reacquire:      in  std_ulogic;                     -- forces autodetect to reacquire standard
        vid_in:         in  std_ulogic_vector(9 downto 0);  -- video data input
        rx_trs:         in  std_ulogic;                     -- must be 1 on first word of TRS
        rx_xyz:         in  std_ulogic;                     -- must be 1 during the TRS XYZ word
        rx_xyz_err:     in  std_ulogic;                     -- XYZ word error input for all but 4444
        rx_xyz_err_4444:in  std_ulogic;                     -- XYZ word error for 4444 standards
        vid_std:        out std_ulogic_vector(2 downto 0);  -- video standard code
        locked:         out std_ulogic;                     -- asserted when synced to input video
        xyz_err:        out std_ulogic;                     -- asserted when XYZ word contain an error
        s4444:          out std_ulogic);                    -- status of the S-bit in 4444 XYZ word
end component;

component flywheel
    generic (
        HCNT_WIDTH : integer := 12;
        VCNT_WIDTH : integer := 10);
    port (
        clk:            in  std_ulogic;                     -- clock input
        ce:             in  std_ulogic;                     -- clock enable
        rst:            in  std_ulogic;                     -- async reset input
        rx_xyz_in:      in  std_ulogic;                     -- asserted during XYZ word of received TRS
        rx_trs_in:      in  std_ulogic;                     -- asserted during first word of received TRS
        rx_eav_first_in:in  std_ulogic;                     -- asserted during first word of received EAV
        rx_f_in:        in  std_ulogic;                     -- decoded F bit from received video
        rx_v_in:        in  std_ulogic;                     -- decoded V bit from received video 
        rx_h_in:        in  std_ulogic;                     -- decoded H bit from received video
        std_locked:     in  std_ulogic;                     -- asserted by autodetect when std_in is valid
        std_in:         in  std_ulogic_vector(2 downto 0);  -- code for current video standard
        rx_xyz_err_in:  in  std_ulogic;                     -- asserted on error in XYZ word
        rx_vid_in:      in  std_ulogic_vector(9 downto 0);  -- input video stream
        rx_s4444_in:    in  std_ulogic;                     -- S bit for 4444 video
        rx_anc_in:      in  std_ulogic;                     -- asserted on first word of received ANC
        rx_edh_in:      in  std_ulogic;                     -- asserted on first word of received EDH
        en_sync_switch: in  std_ulogic;                     -- enables synchronous switching
        en_trs_blank:   in  std_ulogic;                     -- enables TRS blanking
        trs:            out std_ulogic;                     -- asserted during flywheel generated TRS
        vid_out:        out std_ulogic_vector(9 downto 0);  -- video output
        field:          out std_ulogic;                     -- field indicator
        v_blank:        out std_ulogic;                     -- vertical blanking interval
        h_blank:        out std_ulogic;                     -- horizontal blanking interval
        horz_count:     out 
            std_logic_vector(HCNT_WIDTH-1 downto 0);        -- current horizontal count
        vert_count:     out 
            std_logic_vector(VCNT_WIDTH-1 downto 0);        -- current vertical count
        sync_switch:    out std_ulogic;                     -- asserted on lines when sync switching is permitted
        locked:         out std_ulogic;                     -- asserted when flywheel is synchronized to video
        eav_next:       out std_ulogic;                     -- next word is first word of EAV
        sav_next:       out std_ulogic;                     -- next word is first word of SAV
        xyz_word:       out std_ulogic;                     -- current word is XYZ word
        anc_next:       out std_ulogic;                     -- next word is first word of ANC packet
        edh_next:       out std_ulogic);                    -- next word is first word of EDH packet
end component;

begin
    
--
-- Instantiate the TRS detector module
--
td: trs_detect
    port map (
        clk             => clk,
        ce              => ce,
        rst             => rst,
        vid_in          => vid_in,
        vid_out         => td_vid,
        rx_trs          => td_trs,
        rx_eav          => td_eav,
        rx_sav          => open,
        rx_f            => td_f,
        rx_v            => td_v,
        rx_h            => td_h,
        rx_xyz          => td_xyz,
        rx_xyz_err      => td_xyz_err,
        rx_xyz_err_4444 => td_xyz_err_4444,
        rx_anc          => td_anc,
        rx_edh          => td_edh);

--
-- Instantiate the video standard autodetect module
--
ad: autodetect
    port map (
        clk             => clk,
        ce              => ce,
        rst             => rst,
        reacquire       => reacquire,
        vid_in          => td_vid,
        rx_trs          => td_trs,
        rx_xyz          => td_xyz,
        rx_xyz_err      => td_xyz_err,
        rx_xyz_err_4444 => td_xyz_err_4444,
        vid_std         => std,
        locked          => std_locked,
        xyz_err         => ad_xyz_err,
        s4444           => ad_s4444);

--
-- Instantiate the flywheel module
--
fly: flywheel
    generic map (
        HCNT_WIDTH      => 12,
        VCNT_WIDTH      => 10)
    port map (
        clk             => clk,
        ce              => ce,
        rst             => rst,
        rx_xyz_in       => td_xyz,
        rx_trs_in       => td_trs,
        rx_eav_first_in => td_eav,
        rx_f_in         => td_f,
        rx_v_in         => td_v,
        rx_h_in         => td_h,
        std_locked      => std_locked,
        std_in          => std,
        rx_xyz_err_in   => ad_xyz_err,
        rx_vid_in       => td_vid,
        rx_s4444_in     => ad_s4444,
        rx_anc_in       => td_anc,
        rx_edh_in       => td_edh,
        en_sync_switch  => en_sync_switch,
        en_trs_blank    => en_trs_blank,
        trs             => trs,
        vid_out         => vid_out,
        field           => field,
        v_blank         => v_blank,
        h_blank         => h_blank,
        horz_count      => horz_count,
        vert_count      => vert_count,
        sync_switch     => sync_switch,
        locked          => locked,
        eav_next        => eav_next,
        sav_next        => sav_next,
        xyz_word        => xyz_word,
        anc_next        => anc_next,
        edh_next        => edh_next);

end synth;