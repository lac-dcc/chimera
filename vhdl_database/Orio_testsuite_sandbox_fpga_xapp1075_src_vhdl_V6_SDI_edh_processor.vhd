-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: edh_processor.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2005-06-24 10:52:31-06 $
-- /___/   /\    Date Created: 2002
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: edh_processor.vhd,rcs $
-- Revision 1.1  2005-06-24 10:52:31-06  jsnow
-- Updated video_decode definition.
--
-- Revision 1.0  2004-12-15 15:52:28-07  jsnow
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
-- This module instances and interconnects the various modules that make up the
-- error detection and handling (EDH) packet processor. This processor includes
-- an ANC packet checksum checker, but does not include any ANC packet mux or
-- demux functions.
-- 
-- EDH packets for digital component video are defined by the standards 
-- ITU-R BT.1304 and SMPTE RP 165-1994. The documents define a standard method
-- of generating and inserting checkwords into the video stream. These 
-- checkwords are not used for error correction. They are used to determine if 
-- the video data is being corrupted somewhere in the chain of video equipment 
-- processing the data. The nature of the EDH packets allows the malfunctioning 
-- piece of equipment to be quickly located.
-- 
-- Two checkwords are defined, one for the field of active picture (AP) video 
-- data words and the other for the full field (FF) of video data. Three sets of
-- flags are defined to feed forward information regarding detected errors. One 
-- of flags is associated with the AP checkword, one set with the FF checkword. 
-- The third set of flags identify errors detected in the ancillary data 
-- checksums within the field. Implementation of this third set is optional in 
-- the standards.
-- 
-- The two checkwords and three sets of flags for each field are combined into 
-- an ancillary data packet, commonly called the EDH packet. The EDH packet 
-- occurs at a fixed location, always immediately before the SAV symbol on the 
-- line before the synchronous switching line. The synchronous switching lines 
-- for NTSC are lines 10 and 273. For 625-line PAL they are lines 6 and 319.
-- 
-- Three sets of error flags outputs are provided. One set consists of the 12
-- error flags received in the last EDH packet in the input video stream. The
-- second set consists of the twelve flags sent in the last EDH packet in the
-- output video stream. A third set contains error flags related to the 
-- processing of the received EDH packet such as packet_missing errors.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.anc_edh_pkg.all;

entity edh_processor is
    port (
        clk:            in  std_ulogic;         -- clock input
        ce:             in  std_ulogic;         -- clock enable
        rst:            in  std_ulogic;         -- async reset input

        -- video decoder inputs
        vid_in:         in  video_type;         -- input video
        reacquire:      in  std_ulogic;         -- forces autodetect to reacquire the video standard
        en_sync_switch: in  std_ulogic;         -- enables synchronous switching
        en_trs_blank:   in  std_ulogic;         -- enables TRS blanking when asserted

        -- EDH flag inputs
        anc_idh_local:  in  std_ulogic;         -- ANC IDH flag input
        anc_ues_local:  in  std_ulogic;         -- ANC UES flag input
        ap_idh_local:   in  std_ulogic;         -- AP IDH flag input
        ff_idh_local:   in  std_ulogic;         -- FF IDH flag input
        errcnt_flg_en:  in  edh_allflg_type;    -- selects which error flags increment the error counter
        clr_errcnt:     in  std_ulogic;         -- clears the error counter
        receive_mode:   in  std_ulogic;         -- 1 enables receiver, 0 for generate only

        -- video and decoded video timing outputs
        vid_out:        out video_type;         -- output video stream with EDH packets inserted
        std:            out vidstd_type;        -- video standard code
        std_locked:     out std_ulogic;         -- video standard detector is locked
        trs:            out std_ulogic;         -- asserted during flywheel generated TRS symbol
        field:          out std_ulogic;         -- field indicator
        v_blank:        out std_ulogic;         -- vertical blanking indicator
        h_blank:        out std_ulogic;         -- horizontal blanking indicator
        horz_count:     out hpos_type;          -- horizontal position
        vert_count:     out vpos_type;          -- vertical position
        sync_switch:    out std_ulogic;         -- asserted on lines where synchronous switching is allowed
        locked:         out std_ulogic;         -- asserted when flywheel is synchronized to video
        eav_next:       out std_ulogic;         -- next word is first word of EAV
        sav_next:       out std_ulogic;         -- next word is first word of SAV
        xyz_word:       out std_ulogic;         -- current word is the XYZ word of a TRS
        anc_next:       out std_ulogic;         -- next word is first word of a received ANC packet
        edh_next:       out std_ulogic;         -- next word is first word of a received EDH packet

        -- EDH flag outputs
        rx_ap_flags:    out edh_flgset_type;    -- AP error flags received from last EDH packet
        rx_ff_flags:    out edh_flgset_type;    -- FF error flags received from last EDH packet
        rx_anc_flags:   out edh_flgset_type;    -- ANC error flags freceived from last EDH packet
        ap_flags:       out edh_flgset_type;    -- transmitted AP error flags from last field
        ff_flags:       out edh_flgset_type;    -- transmitted FF error flags from last field
        anc_flags:      out edh_flgset_type;    -- transmitted ANC error flags from last field
        packet_flags:   out edh_pktflg_type;    -- error flags related to the received packet processing
        errcnt:         out edh_errcnt_type;    -- errored fields counter
        edh_packet:     out std_ulogic);        -- asserted during all words of a generated EDH packet
end;

architecture synth of edh_processor is

-------------------------------------------------------------------------------
-- Signal definitions
--
signal dec_std:         vidstd_type;            -- video_decode std output
signal dec_std_locked:  std_ulogic;             -- video_decode std locked output
signal dec_vid:         video_type;             -- video_decode video output
signal dec_trs:         std_ulogic;             -- video_decode trs output
signal dec_f:           std_ulogic;             -- video_decode field output
signal dec_v:           std_ulogic;             -- video_decode v_blank output
signal dec_h:           std_ulogic;             -- video_decode h_blank output
signal dec_hcnt:        hpos_type;              -- video_decode horz_count output
signal dec_vcnt:        vpos_type;              -- video_decode vert_count output
signal dec_sync_switch: std_ulogic;             -- video_decode sync_switch output
signal dec_locked:      std_ulogic;             -- video_decode locked output
signal dec_eav_next:    std_ulogic;             -- video_decode eav_next output
signal dec_sav_next:    std_ulogic;             -- video_decode sav_next output
signal dec_xyz_word:    std_ulogic;             -- video_decode xyz_word output
signal dec_anc_next:    std_ulogic;             -- video_decode anc_next output
signal dec_edh_next:    std_ulogic;             -- video_decode edh_next output
signal ap_crc:          crc16_type;             -- calculated active pic CRC
signal ap_crc_valid:    std_ulogic;             -- calculated active pic CRC valid signal
signal ff_crc:          crc16_type;             -- calculated full field CRC
signal ff_crc_valid:    std_ulogic;             -- calculated full field CRC valid signal
signal edh_missing:     std_ulogic;             -- EDH packet missing error flag
signal edh_parity_err:  std_ulogic;             -- EDH packet parity error flag
signal edh_chksum_err:  std_ulogic;             -- EDH packet checksum error flag
signal edh_format_err:  std_ulogic;             -- EDH packet format error flag
signal tx_edh_next:     std_ulogic;             -- generated EDH packet begins on next word
signal flag_bus:        edh_flgset_type;        -- flag bus between EDH_FLAGS and EDH_TX
signal ap_flag_word:    std_ulogic;             -- selects AP flags for flag bus
signal ff_flag_word:    std_ulogic;             -- selects FF flags for flag bus
signal anc_flag_word:   std_ulogic;             -- selects ANC flags for flag bus
signal rx_ap_crc_valid: std_ulogic;             -- received active pic CRC valid signal
signal rx_ap_crc:       crc16_type;             -- received active pic CRC
signal rx_ff_crc_valid: std_ulogic;             -- received full field CRC valid signal
signal rx_ff_crc:       crc16_type;             -- received full field CRC
signal in_ap_flags:     edh_flgset_type;        -- received AP flags to edh_flags
signal in_ff_flags:     edh_flgset_type;        -- received FF flags to edh_flags
signal in_anc_flags:    edh_flgset_type;        -- received ACN flags to edh_flags
signal errcnt_en:       std_ulogic;             -- enables error counter
signal anc_edh_local:   std_ulogic;             -- ANC EDH signal
signal tx_vid_out:      video_type;             -- video out of edh_gen
signal tx_edh_packet:   std_ulogic;             -- asserted when edh packet is to be generated
signal edh_all_flags :  edh_allflg_type;        -- flag vector for edh_errcnt module
signal anc_flags_int :  edh_flgset_type;        -- internal version of anc_flags output
signal ap_flags_int :   edh_flgset_type;        -- internal version of ap_flags output
signal ff_flags_int :   edh_flgset_type;        -- internal version of ff_flags output
signal GND :            std_ulogic := '0';  

component video_decode
    generic (
        HCNT_WIDTH : integer := 12;
        VCNT_WIDTH : integer := 10);
    port(
        clk:            in    std_ulogic;       -- clock input
        ce:             in    std_ulogic;       -- clock enable
        rst:            in    std_ulogic;       -- async reset input
        vid_in:         in    video_type;       -- input video
        reacquire:      in    std_ulogic;       -- forces autodetect to reacquire the standard
        en_sync_switch: in    std_ulogic;       -- enables sync switching
        en_trs_blank:   in    std_ulogic;       -- enables TRS blanking
        std:            inout vidstd_type;      -- video standard code
        std_locked:     inout std_ulogic;       -- autodetect circuit is locked to standard
        trs:            out   std_ulogic;       -- asserted during TRS symbol
        vid_out:        out   video_type;       -- output video stream
        field:          out   std_ulogic;       -- field indicator
        v_blank:        out   std_ulogic;       -- vertical blanking indicator
        h_blank:        out   std_ulogic;       -- horizontal blanking indicator
        horz_count:     out   hpos_type;        -- horizontal counter
        vert_count:     out   vpos_type;        -- vertical counter
        sync_switch:    out   std_ulogic;       -- asserted on sync switching lines
        locked:         out   std_ulogic;       -- asserted when flywheel is synced to input video
        eav_next:       out   std_ulogic;       -- next word is first word of EAV
        sav_next:       out   std_ulogic;       -- next word is first word of SAV
        xyz_word:       out   std_ulogic;       -- current word is the XYZ word
        anc_next:       out   std_ulogic;       -- next word is first word of ANC packet
        edh_next:       out   std_ulogic);      -- next word is first word of EDH packet
end component;

component edh_crc
    port (
        clk:            in  std_ulogic;         -- clock input
        ce:             in  std_ulogic;         -- clock enable
        rst:            in  std_ulogic;         -- async reset input
        f:              in  std_ulogic;         -- field bit
        h:              in  std_ulogic;         -- horizontal blanking bit
        eav_next:       in  std_ulogic;         -- asserted when next samplebegins EAV symbol
        xyz_word:       in  std_ulogic;         -- asserted when current word is the XYZ word of a TRS
        vid_in:         in  video_type;         -- video data
        vcnt:           in  vpos_type;          -- vertical line count
        std:            in  vidstd_type;        -- indicates the video standard
        locked:         in  std_ulogic;         -- asserted when flywheel is locked
        ap_crc:         out crc16_type;         -- calculated active picture CRC
        ap_crc_valid:   out std_ulogic;         -- asserted when AP CRC is valid
        ff_crc:         out crc16_type;         -- calculated full-frame CRC
        ff_crc_valid:   out std_ulogic);        -- asserted when FF CRC is valid
end component;

component edh_rx
    port (
        clk:            in  std_ulogic;         -- clock input
        ce:             in  std_ulogic;         -- clock enable
        rst:            in  std_ulogic;         -- async reset input
        rx_edh_next:    in  std_ulogic;         -- indicates the next word is the first word of a received EDH packet
        vid_in:         in  video_type;         -- video data
        edh_next:       in  std_ulogic;         -- EDH packet begins on next sample
        reg_flags:      in  std_ulogic;         -- 1 = register flag words, 0 = feed vid_in through
        ap_crc_valid:   out std_ulogic;         -- valid bit for active picture CRC
        ap_crc:         out crc16_type;         -- active picture CRC
        ff_crc_valid:   out std_ulogic;         -- valid bit for full field CRC
        ff_crc:         out crc16_type;         -- full field CRC
        edh_missing:    out std_ulogic;         -- asserted when last expected EDH packet was missing
        edh_parity_err: out std_ulogic;         -- asserted when a parity error occurs in EDH packet
        edh_chksum_err: out std_ulogic;         -- asserted when a checksum error occurs in EDH packet
        edh_format_err: out std_ulogic;         -- asserted when a format error is found in EDH packet
        in_ap_flags:    out edh_flgset_type;    -- received AP flag word to edh_flags module
        in_ff_flags:    out edh_flgset_type;    -- received FF flag word to edh_flags module
        in_anc_flags:   out edh_flgset_type;    -- received ANC flag word to edh_flags module
        rx_ap_flags:    out edh_flgset_type;    -- received & registered AP flags for external inspection
        rx_ff_flags:    out edh_flgset_type;    -- received & registered FF flags for external inspection
        rx_anc_flags:   out edh_flgset_type);   -- received & registered ANC flags for external inspection
end component;

component edh_loc
    port (
        clk:            in  std_ulogic;         -- clock input
        ce:             in  std_ulogic;         -- clock enable
        rst:            in  std_ulogic;         -- async reset input
        f:              in  std_ulogic;         -- field bit
        vcnt:           in  vpos_type;          -- vertical line count
        hcnt:           in  hpos_type;          -- horizontal position
        std:            in  vidstd_type;        -- video standards
        edh_next:       out std_ulogic);        -- EDH packet should begin on next sample
end component;

component anc_rx
    port (
        clk:            in  std_ulogic;         -- clock input
        ce:             in  std_ulogic;         -- clock enable
        rst:            in  std_ulogic;         -- async reset input
        locked:         in  std_ulogic;         -- video decoder locked signal
        rx_anc_next:    in  std_ulogic;         -- asserted when next word begins ANC packet
        rx_edh_next:    in  std_ulogic;         -- asserted when next word begins EDH packet
        edh_packet:     in  std_ulogic;         -- indicates an EDH packet is being generated
        vid_in:         in  video_type;         -- video input data
        anc_edh_local:  out std_ulogic);        -- ANC error detected here flag
end component;

component edh_tx
    port (
        clk:            in  std_ulogic;         -- clock input
        ce:             in  std_ulogic;         -- clock enable
        rst:            in  std_ulogic;         -- async reset input
        vid_in:         in  video_type;         -- input video port
        edh_next:       in  std_ulogic;         -- asserted when next sample begins EDH packet
        edh_missing:    in  std_ulogic;         -- receved EDh packet is missing
        ap_crc_valid:   in  std_ulogic;         -- asserted when AP CRC is valid
        ap_crc:         in  crc16_type;         -- calculated active picture CRC
        ff_crc_valid:   in  std_ulogic;         -- asserted when FF CRC is valid
        ff_crc:         in  crc16_type;         -- calculated full-frame CRC
        flags_in:       in  edh_flgset_type;    -- bus that carries AP, FF, and ANC flags
        ap_flag_word:   out std_ulogic;         -- asserted during AP flag word in EDH packet
        ff_flag_word:   out std_ulogic;         -- asserted during FF flag word in EDH packet
        anc_flag_word:  out std_ulogic;         -- asserted during ANC flag word in EDH packet
        edh_packet:     out std_ulogic;         -- asserted during all words of EDH packet
        edh_vid:        out video_type);        -- generated EDH packet data
end component;

component edh_flags
    port (
        clk:                in  std_ulogic;     -- clock input
        ce:                 in  std_ulogic;     -- clock enable
        rst:                in  std_ulogic;     -- async reset input
        receive_mode:       in  std_ulogic;     -- asserted if receiver is active
        ap_flag_word:       in  std_ulogic;     -- selects the AP flag word for flag_bus
        ff_flag_word:       in  std_ulogic;     -- selects the FF flag word for flag_bus
        anc_flag_word:      in  std_ulogic;     -- selects the ANC flag word for the flag_bus
        edh_missing:        in  std_ulogic;     -- EDH packet missing from data stream
        edh_parity_err:     in  std_ulogic;     -- EDH packet parity error
        edh_format_err:     in  std_ulogic;     -- EDH packet format error
        rx_ap_crc_valid:    in  std_ulogic;     -- received AP CRC valid bit
        rx_ap_crc:          in  crc16_type;     -- received AP CRC value 
        rx_ff_crc_valid:    in  std_ulogic;     -- received FF CRC valid bit
        rx_ff_crc:          in  crc16_type;     -- received FF CRC value
        rx_ap_flags:        in  edh_flgset_type;-- received AP flag word
        rx_ff_flags:        in  edh_flgset_type;-- received FF flag word
        rx_anc_flags:       in  edh_flgset_type;-- recevied ANC flag word
        anc_edh_local:      in  std_ulogic;     -- local ANC EDH flag input
        anc_idh_local:      in  std_ulogic;     -- local ANC IDH flag input
        anc_ues_local:      in  std_ulogic;     -- local ANC UES flag input
        ap_idh_local:       in  std_ulogic;     -- local AP IDH flag input
        ff_idh_local:       in  std_ulogic;     -- local FF IDH flag input
        calc_ap_crc_valid:  in  std_ulogic;     -- calculated AP CRC valid bit
        calc_ap_crc:        in  crc16_type;     -- calculated AP CRC value
        calc_ff_crc_valid:  in  std_ulogic;     -- calculated FF CRC value
        calc_ff_crc:        in  crc16_type;     -- calculated FF CRC
        flags:              out edh_flgset_type;-- flag bus output
        ap_flags:           out edh_flgset_type;-- AP flags from last EDH packet sent
        ff_flags:           out edh_flgset_type;-- FF flags from last EDH packet sent
        anc_flags:          out edh_flgset_type);-- ANC flags from last EDH packet sent
end component;

component edh_errcnt
    port (
        clk:            in    std_ulogic;       -- clock input
        ce:             in    std_ulogic;       -- clock enable
        rst:            in    std_ulogic;       -- async reset input
        clr_errcnt:     in    std_ulogic;       -- clears the error counter
        count_en:       in    std_ulogic;       -- enables error counter when high
        flag_enables:   in    edh_allflg_type;  -- specifies which error flags cause the counter to increment
        flags:          in    edh_allflg_type;  -- error flag inputs
        edh_next:       in    std_ulogic;       -- counter increment on edh_next asserted
        errcnt:         out   edh_errcnt_type); -- errored field counter
end component;

begin
    
    --
    -- Instantiate video decoder module from XAPP625
    --
    DEC : video_decode
        port map (
            clk             => clk,
            ce              => ce,
            rst             => rst,
            vid_in          => vid_in,
            reacquire       => reacquire,
            en_sync_switch  => en_sync_switch,
            en_trs_blank    => en_trs_blank,
            std             => dec_std,
            std_locked      => dec_std_locked,
            trs             => dec_trs,
            vid_out         => dec_vid,
            field           => dec_f,
            v_blank         => dec_v,
            h_blank         => dec_h,
            horz_count      => dec_hcnt,
            vert_count      => dec_vcnt,
            sync_switch     => dec_sync_switch,
            locked          => dec_locked,
            eav_next        => dec_eav_next,
            sav_next        => dec_sav_next,
            xyz_word        => dec_xyz_word,
            anc_next        => dec_anc_next,
            edh_next        => dec_edh_next);

    --
    -- edh_crc module
    --
    -- This module computes the CRC values for the incoming video stream, vid_in.
    -- Also, the module generates valid signals for both CRC values based on the
    -- locked signal. If locked rises during a field, the CRC is considered to 
    -- be invalid.
    --
    CRC : edh_crc
        port map (
            clk             => clk,
            ce              => ce,
            rst             => rst,
            f               => dec_f,
            h               => dec_h,
            eav_next        => dec_eav_next,
            xyz_word        => dec_xyz_word,
            vid_in          => dec_vid,
            vcnt            => dec_vcnt,
            std             => dec_std,
            locked          => dec_locked,
            ap_crc          => ap_crc,
            ap_crc_valid    => ap_crc_valid,
            ff_crc          => ff_crc,
            ff_crc_valid    => ff_crc_valid);

    --
    -- edh_rx module
    --
    -- This module processes EDH packets found in the incoming video stream. The
    -- CRC words and valid flags are captured from the packet. Various error 
    -- flags related to errors found in the packet are generated.
    --
    EDHRX : edh_rx
        port map (
            clk             => clk,
            ce              => ce,
            rst             => rst,
            rx_edh_next     => dec_edh_next,
            vid_in          => dec_vid,
            edh_next        => tx_edh_next,
            reg_flags       => GND,
            ap_crc_valid    => rx_ap_crc_valid,
            ap_crc          => rx_ap_crc,
            ff_crc_valid    => rx_ff_crc_valid,
            ff_crc          => rx_ff_crc,
            edh_missing     => edh_missing,
            edh_parity_err  => edh_parity_err,
            edh_chksum_err  => edh_chksum_err,
            edh_format_err  => edh_format_err,
            in_ap_flags     => in_ap_flags,
            in_ff_flags     => in_ff_flags,
            in_anc_flags    => in_anc_flags,
            rx_ap_flags     => rx_ap_flags,
            rx_ff_flags     => rx_ff_flags,
            rx_anc_flags    => rx_anc_flags);

    --
    -- edh_loc module
    --
    -- This module locates the beginning of an EDH packet in the incoming video
    -- stream. It asserts the tx_edh_next siganl the sample before the EDH 
    -- packet begins on vid_in.
    --
    LOC : edh_loc
        port map (
            clk             => clk,
            ce              => ce,
            rst             => rst,
            f               => dec_f,
            vcnt            => dec_vcnt,
            hcnt            => dec_hcnt,
            std             => dec_std,
            edh_next        => tx_edh_next);

    --
    -- anc_rx module
    --
    -- This module calculates checksums for every ANC packet in the input video
    -- stream and compares the calculated checksums against the CS word of each
    -- packet. It also checks the parity bits of all parity protected words in 
    -- the ANC packets. An error in any ANC packet will assert the anc_edh_local
    -- signal. This output will remain asserted until after the next EDH packet 
    -- is sent in the output video stream.
    --
    ANCRX : anc_rx
        port map (
            clk             => clk,
            ce              => ce,
            rst             => rst,
            locked          => dec_locked,
            rx_anc_next     => dec_anc_next,
            rx_edh_next     => dec_edh_next,
            edh_packet      => tx_edh_packet,
            vid_in          => dec_vid,
            anc_edh_local   => anc_edh_local);

    --
    -- edh_tx module
    --
    -- This module generates a new EDH packet based on the calculated CRC words
    -- and the incoming and local flags.
    --
    TX : edh_tx
        port map (
            clk             => clk,
            ce              => ce,
            rst             => rst,
            vid_in          => dec_vid,
            edh_next        => tx_edh_next,
            edh_missing     => edh_missing,
            ap_crc_valid    => ap_crc_valid,
            ap_crc          => ap_crc,
            ff_crc_valid    => ff_crc_valid,
            ff_crc          => ff_crc,
            flags_in        => flag_bus,
            ap_flag_word    => ap_flag_word,
            ff_flag_word    => ff_flag_word,
            anc_flag_word   => anc_flag_word,
            edh_packet      => tx_edh_packet,
            edh_vid         => tx_vid_out);


    --
    -- edh_flags module
    --
    -- This module creates the error flags that are included in the new
    -- EDH packet created by the GEN module. It also captures those flags until 
    -- the next EDH packet and provides them as outputs.
    --
    FLAGS : edh_flags 
        port map (
            clk                 => clk,
            ce                  => ce,
            rst                 => rst,
            receive_mode        => receive_mode,
            ap_flag_word        => ap_flag_word,
            ff_flag_word        => ff_flag_word,
            anc_flag_word       => anc_flag_word,
            edh_missing         => edh_missing,
            edh_parity_err      => edh_parity_err,
            edh_format_err      => edh_format_err,
            rx_ap_crc_valid     => rx_ap_crc_valid,
            rx_ap_crc           => rx_ap_crc,
            rx_ff_crc_valid     => rx_ff_crc_valid,
            rx_ff_crc           => rx_ff_crc,
            rx_ap_flags         => in_ap_flags,
            rx_ff_flags         => in_ff_flags,
            rx_anc_flags        => in_anc_flags,
            anc_edh_local       => anc_edh_local,
            anc_idh_local       => anc_idh_local,
            anc_ues_local       => anc_ues_local,
            ap_idh_local        => ap_idh_local,
            ff_idh_local        => ff_idh_local,
            calc_ap_crc_valid   => ap_crc_valid,
            calc_ap_crc         => ap_crc,
            calc_ff_crc_valid   => ff_crc_valid,
            calc_ff_crc         => ff_crc,
            flags               => flag_bus,
            ap_flags            => ap_flags_int,
            ff_flags            => ff_flags_int,
            anc_flags           => anc_flags_int);

    ap_flags <= ap_flags_int;
    ff_flags <= ff_flags_int;
    anc_flags <= anc_flags_int;

        
    --
    -- edh_errcnt module
    --
    -- This counter increments once for every field that contains an enabled 
    -- error. The error counter is disabled until after the video decoder is 
    -- locked to the
    -- video stream for the first time and the first EDH packet has been received.
    --

    edh_all_flags <= (edh_chksum_err & ap_flags_int & ff_flags_int & anc_flags_int);

    ERRCNTR : edh_errcnt
        port map (
            clk                 => clk,
            ce                  => ce,
            rst                 => rst,
            clr_errcnt          => clr_errcnt,
            count_en            => errcnt_en,
            flag_enables        => errcnt_flg_en,
            flags               => edh_all_flags,
            edh_next            => tx_edh_next,
            errcnt              => errcnt);



    process(clk, rst)
    begin
        if (rst = '1') then
            errcnt_en <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (dec_locked = '1' and dec_edh_next = '1') then
                    errcnt_en <= '1';
                end if;
            end if;
        end if;
    end process;


    --
    -- packet_flags
    --
    -- This statement combines the four EDH packet flags into a vector.
    --
    packet_flags <= (edh_format_err & edh_chksum_err & edh_parity_err & edh_missing);

    --
    -- output registers
    --
    -- This code implements an output register for the video path and all video
    -- timing signals.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            vid_out <= (others => '0');
            std <= (others => '0');
            std_locked <= '0';
            trs <= '0';
            field <= '0';
            v_blank <= '0';
            h_blank <= '0';
            horz_count <= (others => '0');
            vert_count <= (others => '0');
            sync_switch <= '0';
            locked <= '0';
            eav_next <= '0';
            sav_next <= '0';
            xyz_word <= '0';
            anc_next <= '0';
            edh_next <= '0';
            edh_packet <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                vid_out <= tx_vid_out;
                std <= dec_std;
                std_locked <= dec_std_locked;
                trs <= dec_trs;
                field <= dec_f;
                v_blank <= dec_v;
                h_blank <= dec_h;
                horz_count <= dec_hcnt;
                vert_count <= dec_vcnt;
                sync_switch <= dec_sync_switch;
                locked <= dec_locked;
                eav_next <= dec_eav_next;
                sav_next <= dec_sav_next;
                xyz_word <= dec_xyz_word;
                anc_next <= dec_anc_next;
                edh_next <= dec_edh_next;
                edh_packet <= tx_edh_packet;
            end if; 
        end if;
    end process;

end synth;
