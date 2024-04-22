-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: hdsdi_pkg.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2008-07-31 14:35:19-06 $
-- /___/   /\    Date Created: May 21, 2004 
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: hdsdi_pkg.vhd,rcs $
-- Revision 1.6  2008-07-31 14:35:19-06  jsnow
-- Added new hd_vidstd_types for 1080p 60 Hz and 1080p 50 Hz.
--
-- Revision 1.5  2008-05-12 16:18:24-06  jsnow
-- Changed default value of HD_HCNT_WIDTH to 13 from 12 to
-- support 720p 24 Hz.
--
-- Revision 1.4  2007-10-22 14:12:09-06  jsnow
-- Added 720p 30Hz, 25Hz, and 24Hz formats. Added new xavb_
-- standard data types for new Xilinx modules.
--
-- Revision 1.3  2005-06-23 13:12:43-06  jsnow
-- Code cleanup.
--
-- Revision 1.2  2005-04-27 15:44:49-06  jsnow
-- Added HD_FMT_720p_50 constant definition.
--
-- Revision 1.1  2004-08-23 13:23:31-06  jsnow
-- Comment changes only.
--
-- Revision 1.0  2004-05-21 15:18:52-06  jsnow
-- Initial Revision
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
--
-------------------------------------------------------------------------------- 
-- 
-- This package defines global data types and constants used throughout the
-- Xilinx HD-SDI reference designs.
--
-- This new release of this package module maintains the old data types of
-- previous versions of this module (the hd_xxx data types) and also introduces 
-- a new set of data types (the xavb_xxx data types) that will be used with 
-- new Xilinx modules.
--
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

package hdsdi_pkg is

--------------------------------------------------------------------------------
-- These constants defines the widths of various data types and are used
-- the in following data type definitions.
--
constant HD_HCNT_WIDTH :       integer := 13;  -- width of horz position count
constant HD_VCNT_WIDTH :       integer := 11;  -- width of vert position count
constant SMPTE_FMT_WIDTH :     integer := 4;   -- width of the video format code

--------------------------------------------------------------------------------
-- Old data types retained for backwards compatibility
--
subtype hd_video_type      is               -- used for all video-width words
            std_logic_vector(9 downto 0);

subtype hd_vid20_type      is               -- used for all 20-bit video words
            std_logic_vector(19 downto 0);  -- containing both Y & C (Y in MS hslf)

subtype hd_vidstd_type     is               -- 4-bit code used to indicate the video format
            std_logic_vector(SMPTE_FMT_WIDTH - 1 downto 0);

subtype hd_vpos_type       is               -- vertical position type
            std_logic_vector (HD_VCNT_WIDTH - 1 downto 0);

subtype hd_hpos_type       is               -- horizontal position type
            std_logic_vector (HD_HCNT_WIDTH - 1 downto 0);

subtype hd_crc18_type      is               -- CRC18 data type
            std_logic_vector(17 downto 0);

--------------------------------------------------------------------------------
-- Data types to be used for new designs
--

subtype xavb_data_stream_type is            -- 10-bit SMPTE interface data stream
            std_logic_vector(9 downto 0);

subtype xavb_8b_vcomp_type is               -- 8-bit video component
            std_logic_vector(7 downto 0);

subtype xavb_10b_vcomp_type is              -- 10-bit video component
            std_logic_vector(9 downto 0);

subtype xavb_12b_vcomp_type is              -- 12-bit video component
            std_logic_vector(11 downto 0);

subtype xavb_hd_line_num_type is            -- 11-bit video line numbers
            std_logic_vector(HD_VCNT_WIDTH - 1 downto 0);

subtype xavb_hd_sample_num_type is          -- 12-bit video sample number
            std_logic_vector(HD_HCNT_WIDTH -1 downto 0);

subtype xavb_vid_format_type is             -- 4-bit video timing format code
            std_logic_vector(SMPTE_FMT_WIDTH - 1 downto 0);

subtype xavb_hd_crc18_type is               -- 18-bit SMPTE CRC value
            std_logic_vector(17 downto 0);

--------------------------------------------------------------------------------
-- Constant definitions

--
-- This group of constants defines the encoding for the HD video formats used
-- by the video pattern generators and video format detectors.
--
constant HD_FMT_1035i_30    : hd_vidstd_type := "0000"; -- SMPTE 260M 1035i  30 Hz
constant HD_FMT_1080i_25b   : hd_vidstd_type := "0001"; -- SMPTE 295M 1080i  25 Hz
constant HD_FMT_1080i_30    : hd_vidstd_type := "0010"; -- SMPTE 274M 1080i  30 Hz or 1080sF 30 Hz
constant HD_FMT_1080i_25    : hd_vidstd_type := "0011"; -- SMPTE 274M 1080i  25 Hz or 1080sF 25 Hz
constant HD_FMT_1080p_30    : hd_vidstd_type := "0100"; -- SMPTE 274M 1080p  30 Hz 
constant HD_FMT_1080p_25    : hd_vidstd_type := "0101"; -- SMPTE 274M 1080p  25 Hz
constant HD_FMT_1080p_24    : hd_vidstd_type := "0110"; -- SMPTE 274M 1080p  24 Hz
constant HD_FMT_720p_60     : hd_vidstd_type := "0111"; -- SMPTE 296M  720p  60 Hz
constant HD_FMT_1080sF_24   : hd_vidstd_type := "1000"; -- SMPTE 274M 1080sF 24 Hz
constant HD_FMT_720p_50     : hd_vidstd_type := "1001"; -- SMPTE 296M  720p  50 Hz
constant HD_FMT_720p_30     : hd_vidstd_type := "1010"; -- SMPTE 296M  720p  30 Hz
constant HD_FMT_720p_25     : hd_vidstd_type := "1011"; -- SMPTE 296M  720p  25 Hz
constant HD_FMT_720p_24     : hd_vidstd_type := "1100"; -- SMPTE 296M  720p  24 Hz
constant HD_FMT_1080p_60    : hd_vidstd_type := "1101"; -- SMPTE 274M 1080p  60 Hz
constant HD_FMT_1080p_50    : hd_vidstd_type := "1110"; -- SMPTE 274M 1080p  50 Hz
constant HD_FMT_RSVD_15     : hd_vidstd_type := "1111"; -- reserved code
     
--
-- This constant should be set equal to the last valid video format in the
-- table above.
--
constant LAST_VIDEO_FORMAT_CODE : hd_vidstd_type := HD_FMT_1080p_50;

end;
