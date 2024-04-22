-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: anc_edh_pkg.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2004-12-15 15:38:55-07 $
-- /___/   /\    Date Created: 2002
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: anc_edh_pkg.vhd,rcs $
-- Revision 1.0  2004-12-15 15:38:55-07  jsnow
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
-- This package defines global data types and constants used throughout the
-- ANC and EDH processor design files.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

package anc_edh_pkg is

--------------------------------------------------------------------------------
-- These constants defines the widths of various data types and are used
-- the in following data type definitions.
--
constant HCNT_WIDTH :       integer := 12;  -- width of horz position count
constant VCNT_WIDTH :       integer := 10;  -- width of vert position count
constant UDW_ADR_WIDTH :    integer := 8;   -- ANC packet UDW RAM address width
constant UDW_MEM_SIZE :     integer := 256; -- ANC packet UDW RAM depth
constant EDHFLGS_WIDTH :    integer := 16;  -- width of EDH flag vector
constant EDHERRCNT_WIDTH :  integer := 24;  -- width of EDH error counter

--------------------------------------------------------------------------------
-- Data type definitions
--
subtype video_type      is                  -- used for all video-width words
            std_ulogic_vector(9 downto 0);

subtype vidstd_type     is                  -- 3-bit code used to indicate
            std_ulogic_vector(2 downto 0);  -- the video standard

subtype hpos_type       is                  -- horizontal position
            std_logic_vector (HCNT_WIDTH - 1 downto 0);

subtype vpos_type       is                  -- vertical position
            std_logic_vector (VCNT_WIDTH - 1 downto 0);

subtype ubyte_type      is                  -- unsigned 8-bit byte
            std_ulogic_vector(7 downto 0);

subtype cksum_type      is                  -- 9-bit checksum values used in
            std_ulogic_vector(8 downto 0);      -- in ANC packets

subtype pktsize_type    is                  -- 9-bit value used to indicate the
            std_ulogic_vector(8 downto 0);      -- total size of an ANC packet

subtype udwadr_type     is                  -- address into UDW RAM
            std_logic_vector (UDW_ADR_WIDTH - 1 downto 0);

subtype edh_allflg_type is                  -- vector containing all EDH packet flags
            std_ulogic_vector(EDHFLGS_WIDTH - 1 downto 0);

subtype edh_flgset_type is                  -- vector containing one set of flags
            std_ulogic_vector(4 downto 0);  -- there is one set each for AP, FF, or ANC

subtype edh_pktflg_type is                  -- contains the EDH packet error flags
            std_ulogic_vector(3 downto 0);  -- such as edh_missing and edh_format_err

subtype edh_errcnt_type is                  -- errored frame counter data type 
            std_logic_vector(EDHERRCNT_WIDTH - 1 downto 0);

subtype crc16_type      is                  -- CRC16 data type
            std_ulogic_vector(15 downto 0);

--------------------------------------------------------------------------------
-- Constant defintions

--
-- This group of constants defines the encoding for the video standards output
-- code (vidstd_type).
--
constant NTSC_422:              vidstd_type := "000";
constant NTSC_INVALID:          vidstd_type := "001";
constant NTSC_422_WIDE:         vidstd_type := "010";
constant NTSC_4444:             vidstd_type := "011";
constant PAL_422:               vidstd_type := "100";
constant PAL_INVALID:           vidstd_type := "101";
constant PAL_422_WIDE:          vidstd_type := "110";
constant PAL_4444:              vidstd_type := "111";

--
-- This group of constants defines the line numbers where the EDH packet is
-- located.
--
constant NTSC_FLD1_EDH_LINE:    vpos_type := vpos_type(TO_UNSIGNED(272, VCNT_WIDTH));
constant NTSC_FLD2_EDH_LINE:    vpos_type := vpos_type(TO_UNSIGNED(  9, VCNT_WIDTH));
constant PAL_FLD1_EDH_LINE :    vpos_type := vpos_type(TO_UNSIGNED(318, VCNT_WIDTH));
constant PAL_FLD2_EDH_LINE :    vpos_type := vpos_type(TO_UNSIGNED(  5, VCNT_WIDTH));

--
-- This group of constants defines the horizontal position of the first word
-- of the SAV TRS symbol for each supported video format.
--
constant SAV_NTSC_422 :         hpos_type := hpos_type(TO_UNSIGNED(1712, HCNT_WIDTH));
constant SAV_NTSC_422_WIDE:     hpos_type := hpos_type(TO_UNSIGNED(2284, HCNT_WIDTH));
constant SAV_NTSC_4444 :        hpos_type := hpos_type(TO_UNSIGNED(3428, HCNT_WIDTH));
constant SAV_PAL_422 :          hpos_type := hpos_type(TO_UNSIGNED(1724, HCNT_WIDTH));
constant SAV_PAL_422_WIDE :     hpos_type := hpos_type(TO_UNSIGNED(2300, HCNT_WIDTH));
constant SAV_PAL_4444 :         hpos_type := hpos_type(TO_UNSIGNED(3452, HCNT_WIDTH));

--
-- This group of constants defines the starting position of the EAV symbol
-- for the various supported video standards.
--
constant EAV_LOC_NTSC_422:      hpos_type := hpos_type(TO_UNSIGNED(1440, HCNT_WIDTH));
constant EAV_LOC_NTSC_422_WIDE: hpos_type := hpos_type(TO_UNSIGNED(1920, HCNT_WIDTH));
constant EAV_LOC_NTSC_4444:     hpos_type := hpos_type(TO_UNSIGNED(2880, HCNT_WIDTH));
constant EAV_LOC_PAL_422:       hpos_type := hpos_type(TO_UNSIGNED(1440, HCNT_WIDTH));
constant EAV_LOC_PAL_422_WIDE:  hpos_type := hpos_type(TO_UNSIGNED(1920, HCNT_WIDTH));
constant EAV_LOC_PAL_4444:      hpos_type := hpos_type(TO_UNSIGNED(2880, HCNT_WIDTH));

--
-- This constant defines the standard length of an EDH packet.
--
constant EDH_PKT_LENGTH:        integer := 23;

--
-- This group of constants defines the starting position of the EDH packet
-- for each different supported video standard. The positions are all relative 
-- to the position of the SAV symbols since the EDH packet immediately precedes
-- the SAV.
--
constant EDH_NTSC_422 :         hpos_type := SAV_NTSC_422 -      EDH_PKT_LENGTH;
constant EDH_NTSC_422_WIDE:     hpos_type := SAV_NTSC_422_WIDE - EDH_PKT_LENGTH;
constant EDH_NTSC_4444:         hpos_type := SAV_NTSC_4444 -     EDH_PKT_LENGTH;
constant EDH_PAL_422:           hpos_type := SAV_PAL_422 -       EDH_PKT_LENGTH;
constant EDH_PAL_422_WIDE:      hpos_type := SAV_PAL_422_WIDE -  EDH_PKT_LENGTH;
constant EDH_PAL_4444:          hpos_type := SAV_PAL_4444 -      EDH_PKT_LENGTH;

--
-- This parameter specifies the DID value used to replace the DID words of
-- packets that the module marks for deletion.
--
constant DEL_DID:               video_type := "0110000000"; -- 0x180

--
-- These constants define the 8-bit DID values for the start_marker and
-- end_marker packets.
--
constant START_MARKER_DID :     ubyte_type := "10001000";   -- hex 88
constant END_MARKER_DID :       ubyte_type := "10000100";   -- hex 84

--
-- XST current doesn't allow a 'range attribute on a signal defined as a 
-- subtype. This prevents code like the following:
--
-- signal next_count:       edh_errcnt_type;
-- signal errcnt:           edh_errcnt_type;
-- signal errcnt_tc:        std_ulogic;
--
-- next_count <= errcnt + 1;
-- errcnt_tc <= '1' when (next_count = (next_count'range => '0')) else '0';
--
-- So that constant strings of the "0000000000" don't need to be used in the
-- above comparison, the following contants have been defined and can be used
-- for the comparison.
--
constant EDH_ALL_FLAGS_LOW :    edh_allflg_type := (others => '0');
constant EDH_ERRCNT_TC :        edh_errcnt_type := (others => '0'); 
constant UBYTE_ZERO :           ubyte_type :=      (others => '0');
     
end;
