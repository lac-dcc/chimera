-------------------------------------------------------------------------------- 
-- Copyright (c) 2010 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow
--  \   \        Filename: $RCSfile: v6_sdi_rxtx.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-10-20 10:29:55-06 $
-- /___/   /\    Date Created: January 5, 2010
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: v6_sdi_rxtx.vhd,rcs $
-- Revision 1.2  2010-10-20 10:29:55-06  jsnow
-- Several changes to the instantiation of v6gtx_sdi_control: The
-- DRPCLK_FREQ generic was changed to 27 MHz. Various ports
-- were changed to match changes to the v6gtx_sdi_control module.
--
-- Revision 1.1  2010-03-11 16:46:21-07  jsnow
-- The GTX wrapper was modified to be compatible with the way the
-- ISE 12.1 RocketIO wizard will create GTX wrappers when using
-- the HDSDI protocol template. Modified the v6gtx_sdi_control module
-- to replace the txpll_div_rst port with a 13-bit GTXTEST port.
--
-- Revision 1.0  2010-03-08 14:14:38-07  jsnow
-- Initial release.
--
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
-------------------------------------------------------------------------------- 
--
-- Module Description:
--
-- This module combines a triple-rate SDI RX data path including an EDH processor, 
-- a triple-rate SDI TX data path, a GTX control module, and a GTX wrapper to
-- implement complete triple-rate SDI RX and TX interfaces. The transmitter is
-- driven by video pattern generators that can generate various SD, HD, and 3G-A
-- video formats.
-- 
-- NOTE: This module has been implemented for the purposes of the quad SDI demo.
-- This module may not be present in future triple-rate SDI reference designs.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

use work.hdsdi_pkg.all;
use work.anc_edh_pkg.all;

library unisim; 
use unisim.vcomponents.all; 

entity v6_sdi_rxtx is
port (
    mgtclk0:            in  std_logic;                      -- This is the 148.5 MHz reference clock
    mgtclk1:            in  std_logic;                      -- This is the 148.5/1.001 MHz reference clcok
    drpclk:             in  std_logic;                      -- DRP clock, running at 32 MHz on the ML605 board

-- TX ports
    tx_gtxreset:        in  std_logic;                      -- Used to reset the gTX TX after reference clock changes
    tx_reset:           in  std_logic;                      -- Reset the TX data path modules
    tx_m:               in  std_logic;                      -- Selects TX reference clock: 0 = 148.5 MHz, 1 = 148.5/1.001 MHz
    postemphasis:       in  std_logic_vector(4 downto 0);   -- GTX TX post-emphasis value
    txusrclk_out:       out std_logic;                      -- Global TX clock
    tx_format:          in  std_logic_vector(2 downto 0);   -- Selects the TX pattern generator video format
    tx_pattern:         in  std_logic_vector(1 downto 0);   -- Selects the TX pattern generator video pattern
    tx_mode:            in  std_logic_vector(1 downto 0);   -- Selects the TX SDI mode: 00=HD, 01=SD, 10=3G
    txp:                out std_logic;                      -- GTX TX output pin
    txn:                out std_logic;                      -- GTX TX output pin
    txpll_locked:       out std_logic;                      -- Indicates locked status of GTX PMA PLL

-- RX ports
    rxp:                in  std_logic;                      -- GTX RX input pin
    rxn:                in  std_logic;                      -- GTX RX input pin
    rx_gtxreset:        in  std_logic;                      -- Resets the entire GTX RX after reference clock changes
    rx_cdrreset:        in  std_logic;                      -- Asserts the CDR reste to the GTX RX      
    rx_clr_errs:        in  std_logic;                      -- Clears the CRC and EDH error capture logic
    rxusrclk_out:       out std_logic;                      -- Global recovered clock from receiver
    rx_mode:            out std_logic_vector(1 downto 0);   -- Indicates the current RX SDI mode: 00=HD, 01=SD, 10=3G
    rx_mode_locked:     out std_logic;                      -- 1 = RX SDI mode detector locked
    rx_locked:          out std_logic;                      -- 1 = RX transport format detector locked
    rx_format:          out std_logic_vector(3 downto 0);   -- Indicats RX transport format (valid in all SDI modes)
    rx_level_b:         out std_logic;                      -- 0=3G-SDI level A, 1=3G-SDI level B -- only valid in 3G-SDI mode
    rx_m:               out std_logic;                      -- bit rate: 0=148.5 or 2.97 Gb/s, 1=148.5/1.001 or 2.97/1.001 Gb/s
    rx_ce:              out std_logic;                      -- SD-SDI clock enable (5/6/5/6 cadence)
    rx_dout_rdy_3G:     out std_logic;                      -- 3G-SDI level B clock enable
    rx_ln_a:            out xavb_hd_line_num_type;          -- Link A line number
    rx_ln_b:            out xavb_hd_line_num_type;          -- Link B line number
    rx_a_vpid:          out std_logic_vector(31 downto 0);  -- Data stream 1 SMPTE 352 data (byte4 & byte3 & byte2 & byte1)
    rx_a_vpid_valid:    out std_logic;                      -- Data stream 1 SMPTE 352 data valid
    rx_b_vpid:          out std_logic_vector(31 downto 0);  -- Data stream 2 SMPTE 352 data (byte4 & byte3 & byte2 & byte1)
    rx_b_vpid_valid:    out std_logic;                      -- Data stream 2 SMPTE 352 data valid
    rx_crc_err:         out std_logic;                      -- RX CRC errors (latched) (cleared with rx_clr_errs)
    rx_ds1_a:           out xavb_data_stream_type;          -- RX data stream 1, link A
    rx_ds1_b:           out xavb_data_stream_type;          -- RX data stream 2, link A
    rx_ds2_a:           out xavb_data_stream_type;          -- RX data stream 1, link A
    rx_ds2_b:           out xavb_data_stream_type;          -- RX data stream 1, link A
    rx_eav:             out std_logic;                      -- EAV
    rx_sav:             out std_logic;                      -- SAV
    rx_sd_hsync:        out std_logic;                      -- SD-SDI hsync
    rxpll_locked:       out std_logic;                      -- GTX PMA PLL locked
    rx_err_count:       out std_logic_vector(23 downto 0);  -- CRC/EDH error counter
    raw_rx_crc_err:     out std_logic);                     -- unlatched version of CRC error signal
end v6_sdi_rxtx;

architecture xilinx of v6_sdi_rxtx is

component multigenHD
port (
    clk:        in  std_logic;
    rst:        in  std_logic;
    ce:         in  std_logic;
    std:        in  std_logic_vector(2 downto 0);
    pattern:    in  std_logic_vector(1 downto 0);
    user_opt:   in  std_logic_vector(1 downto 0);
    y:          out hd_video_type;
    c:          out hd_video_type;
    h_blank:    out std_logic;
    v_blank:    out std_logic;
    field:      out std_logic;
    trs:        out std_logic;
    xyz:        out std_logic;
    line_num:   out hd_vpos_type);
end component;

component vidgen_ntsc
generic (
    VID_WIDTH : integer := 10);
port (
    -- signals for pattern generator A
    clk_a:      in  std_logic;
    rst_a:      in  std_logic;
    ce_a:       in  std_logic;
    pattern_a:  in  std_logic;
    q_a:        out std_ulogic_vector(VID_WIDTH - 1 downto 0);
    h_sync_a:   out std_logic;
    v_sync_a:   out std_logic;
    field_a:    out std_logic;

    -- signals for pattern generator B 
    clk_b:      in  std_logic;
    rst_b:      in  std_logic;
    ce_b:       in  std_logic;
    pattern_b:  in  std_logic;
    q_b:        out std_ulogic_vector(VID_WIDTH - 1 downto 0);
    h_sync_b:   out std_logic;
    v_sync_b:   out std_logic;
    field_b:    out std_logic);
end component;

component vidgen_pal
generic (
    VID_WIDTH : integer := 10);
port (
    -- signals for pattern generator A
    clk_a:      in  std_logic;
    rst_a:      in  std_logic;
    ce_a:       in  std_logic;
    pattern_a:  in  std_logic;
    q_a:        out std_ulogic_vector(VID_WIDTH - 1 downto 0);
    h_sync_a:   out std_logic;
    v_sync_a:   out std_logic;
    field_a:    out std_logic;

    -- signals for pattern generator B 
    clk_b:      in  std_logic;
    rst_b:      in  std_logic;
    ce_b:       in  std_logic;
    pattern_b:  in  std_logic;
    q_b:        out std_ulogic_vector(VID_WIDTH - 1 downto 0);
    h_sync_b:   out std_logic;
    v_sync_b:   out std_logic;
    field_b:    out std_logic);
end component;

component triple_sdi_vpid_insert
port (
    clk:            in  std_logic;
    ce:             in  std_logic;
    din_rdy:        in  std_logic;
    rst:            in  std_logic;
    sdi_mode:       in  std_logic_vector(1 downto 0);
    level:          in  std_logic;
    enable:         in  std_logic;
    overwrite:      in  std_logic;
    byte1:          in  std_logic_vector(7 downto 0);
    byte2:          in  std_logic_vector(7 downto 0);
    byte3:          in  std_logic_vector(7 downto 0);
    byte4a:         in  std_logic_vector(7 downto 0);
    byte4b:         in  std_logic_vector(7 downto 0);
    ln_a:           in  xavb_hd_line_num_type;
    ln_b:           in  xavb_hd_line_num_type;
    line_f1:        in  xavb_hd_line_num_type;
    line_f2:        in  xavb_hd_line_num_type;
    line_f2_en:     in  std_logic;
    a_y_in:         in  xavb_data_stream_type;
    a_c_in:         in  xavb_data_stream_type;
    b_y_in:         in  xavb_data_stream_type;
    b_c_in:         in  xavb_data_stream_type;
    ds1a_out:       out xavb_data_stream_type;
    ds2a_out:       out xavb_data_stream_type;
    ds1b_out:       out xavb_data_stream_type;
    ds2b_out:       out xavb_data_stream_type;
    eav_out:        out std_logic;
    sav_out:        out std_logic;
    out_mode:       out std_logic_vector(1 downto 0));
end component;

component triple_sdi_tx_output_20b
port (
    clk:            in  std_logic;
    din_rdy:        in  std_logic;
    ce:             in  std_logic_vector(1 downto 0);
    rst:            in  std_logic;
    mode:           in  std_logic_vector(1 downto 0);
    ds1a:           in  xavb_data_stream_type;
    ds2a:           in  xavb_data_stream_type;
    ds1b:           in  xavb_data_stream_type;
    ds2b:           in  xavb_data_stream_type;
    insert_crc:     in  std_logic;
    insert_ln:      in  std_logic;
    insert_edh:     in  std_logic;
    ln_a:           in  xavb_hd_line_num_type;
    ln_b:           in  xavb_hd_line_num_type;
    eav:            in  std_logic;
    sav:            in  std_logic;
    txdata:         out std_logic_vector(19 downto 0);
    ce_align_err:   out std_logic);
end component;

component triple_sdi_rx_20b
generic (
    NUM_SD_CE:          integer := 2;
    NUM_3G_DRDY:        integer := 2;
    ERRCNT_WIDTH:       integer := 4;
    MAX_ERRS_LOCKED:    integer := 15;
    MAX_ERRS_UNLOCKED:  integer := 2);
port (
    -- inputs
    clk:            in  std_logic;
    rst:            in  std_logic;
    data_in:        in  std_logic_vector(19 downto 0);
    frame_en:       in  std_logic;

    -- general outputs
    mode:           out std_logic_vector(1 downto 0);
    mode_HD:        out std_logic;
    mode_SD:        out std_logic;
    mode_3G:        out std_logic;
    mode_locked:    out std_logic;
    rx_locked:      out std_logic;
    t_format:       out xavb_vid_format_type;
    level_b_3G:     out std_logic;
    ce_sd:          out std_logic_vector(NUM_SD_CE-1 downto 0);
    nsp:            out std_logic;
    ln_a:           out xavb_hd_line_num_type;
    a_vpid:         out std_logic_vector(31 downto 0);
    a_vpid_valid:   out std_logic;
    b_vpid:         out std_logic_vector(31 downto 0);
    b_vpid_valid:   out std_logic;
    crc_err_a:      out std_logic;
    ds1_a:          out xavb_data_stream_type;
    ds2_a:          out xavb_data_stream_type;
    eav:            out std_logic;
    sav:            out std_logic;
    trs:            out std_logic;

    -- outputs valid for 3G level B only
    ln_b:           out xavb_hd_line_num_type;
    dout_rdy_3G:    out std_logic_vector(NUM_3G_DRDY-1 downto 0);
    crc_err_b:      out std_logic;
    ds1_b:          out xavb_data_stream_type;
    ds2_b:          out xavb_data_stream_type;

    recclk_txdata:  out std_logic_vector(19 downto 0));
end component;

component edh_processor
port (
    clk:            in  std_ulogic;
    ce:             in  std_ulogic;
    rst:            in  std_ulogic;

    -- video decoder inputs
    vid_in:         in  video_type;
    reacquire:      in  std_ulogic;
    en_sync_switch: in  std_ulogic;
    en_trs_blank:   in  std_ulogic;

    -- EDH flag inputs
    anc_idh_local:  in  std_ulogic;
    anc_ues_local:  in  std_ulogic;
    ap_idh_local:   in  std_ulogic;
    ff_idh_local:   in  std_ulogic;
    errcnt_flg_en:  in  edh_allflg_type;
    clr_errcnt:     in  std_ulogic;
    receive_mode:   in  std_ulogic;

    -- video and decoded video timing outputs
    vid_out:        out video_type;
    std:            out vidstd_type;
    std_locked:     out std_ulogic;
    trs:            out std_ulogic;
    field:          out std_ulogic;
    v_blank:        out std_ulogic;
    h_blank:        out std_ulogic;
    horz_count:     out hpos_type;
    vert_count:     out vpos_type;
    sync_switch:    out std_ulogic;
    locked:         out std_ulogic;
    eav_next:       out std_ulogic;
    sav_next:       out std_ulogic;
    xyz_word:       out std_ulogic;
    anc_next:       out std_ulogic;
    edh_next:       out std_ulogic;

    -- EDH flag outputs
    rx_ap_flags:    out edh_flgset_type;
    rx_ff_flags:    out edh_flgset_type;
    rx_anc_flags:   out edh_flgset_type;
    ap_flags:       out edh_flgset_type;
    ff_flags:       out edh_flgset_type;
    anc_flags:      out edh_flgset_type;
    packet_flags:   out edh_pktflg_type;
    errcnt:         out edh_errcnt_type;
    edh_packet:     out std_ulogic);
end component;

component v6gtx_sdi_control
generic (
    PMA_RX_CFG_HD :         std_logic_vector(27 downto 0) := X"05ce055";
    PMA_RX_CFG_SD :         std_logic_vector(27 downto 0) := X"0f44000";
    PMA_RX_CFG_3G :         std_logic_vector(27 downto 0) := X"05CE055";
    DRPCLK_FREQ :           integer := 32000000;
    TX_PLL_OUT_DIV_HD :     integer := 2;
    TX_PLL_OUT_DIV_3G :     integer := 1;
    RX_PLL_OUT_DIV_HD :     integer := 2;
    RX_PLL_OUT_DIV_3G :     integer := 1);
port (
    drpclk :                in  std_logic;
    rst :                   in  std_logic;
    txusrclk :              in  std_logic;
    tx_mode :               in  std_logic_vector(1 downto 0);
    txreset_in :            in  std_logic;
    txresetdone :           in  std_logic;
    txbufstatus1 :          in  std_logic;
    txplllkdet :            in  std_logic;
    txreset_out :           out std_logic;
    gtxtest :               out std_logic_vector(12 downto 0);
    tx_rate_change_done :   out std_logic;
    tx_slew :               out std_logic;
    rxusrclk :              in  std_logic;
    rx_mode :               in  std_logic_vector(1 downto 0);
    rxresetdone :           in  std_logic;
    rxbufstatus2 :          in  std_logic;
    rxratedone :            in  std_logic;
    rxcdrreset :            out std_logic;
    rxbufreset :            out std_logic;
    rxrate :                out std_logic_vector(1 downto 0);
    rx_m :                  out std_logic;
    drpdo :                 in  std_logic_vector(15 downto 0);
    drdy :                  in  std_logic;
    daddr :                 out std_logic_vector(7 downto 0);
    di :                    out std_logic_vector(15 downto 0);
    den :                   out std_logic;
    dwe :                   out std_logic);
end component;

component V6SDI_WRAPPER
generic
(
    WRAPPER_SIM_GTXRESET_SPEEDUP    : integer   := 0); -- Set to 1 to speed up sim reset
port(
    GTX0_LOOPBACK_IN                        : in   std_logic_vector(2 downto 0);
    GTX0_RXDATA_OUT                         : out  std_logic_vector(19 downto 0);
    GTX0_RXRECCLK_OUT                       : out  std_logic;
    GTX0_RXRESET_IN                         : in   std_logic;
    GTX0_RXUSRCLK2_IN                       : in   std_logic;
    GTX0_RXCDRRESET_IN                      : in   std_logic;
    GTX0_RXN_IN                             : in   std_logic;
    GTX0_RXP_IN                             : in   std_logic;
    GTX0_RXBUFSTATUS_OUT                    : out  std_logic_vector(2 downto 0);
    GTX0_RXBUFRESET_IN                      : in   std_logic;
    GTX0_MGTREFCLKRX_IN                     : in   std_logic_vector(1 downto 0);
    GTX0_PERFCLKRX_IN                       : in   std_logic;
    GTX0_GREFCLKRX_IN                       : in   std_logic;
    GTX0_NORTHREFCLKRX_IN                   : in   std_logic_vector(1 downto 0);
    GTX0_SOUTHREFCLKRX_IN                   : in   std_logic_vector(1 downto 0);
    GTX0_RXPLLREFSELDY_IN                   : in   std_logic_vector(2 downto 0);
    GTX0_GTXRXRESET_IN                      : in   std_logic;
    GTX0_PLLRXRESET_IN                      : in   std_logic;
    GTX0_RXPLLLKDET_OUT                     : out  std_logic;
    GTX0_RXRATE_IN                          : in   std_logic_vector(1 downto 0);
    GTX0_RXRATEDONE_OUT                     : out  std_logic;
    GTX0_RXRESETDONE_OUT                    : out  std_logic;
    GTX0_DADDR_IN                           : in   std_logic_vector(7 downto 0);
    GTX0_DCLK_IN                            : in   std_logic;
    GTX0_DEN_IN                             : in   std_logic;
    GTX0_DI_IN                              : in   std_logic_vector(15 downto 0);
    GTX0_DRDY_OUT                           : out  std_logic;
    GTX0_DRPDO_OUT                          : out  std_logic_vector(15 downto 0);
    GTX0_DWE_IN                             : in   std_logic;
    GTX0_TXDATA_IN                          : in   std_logic_vector(19 downto 0);
    GTX0_TXOUTCLK_OUT                       : out  std_logic;
    GTX0_TXRESET_IN                         : in   std_logic;
    GTX0_TXUSRCLK2_IN                       : in   std_logic;
    GTX0_TXDIFFCTRL_IN                      : in   std_logic_vector(3 downto 0);
    GTX0_TXN_OUT                            : out  std_logic;
    GTX0_TXP_OUT                            : out  std_logic;
    GTX0_TXPOSTEMPHASIS_IN                  : in   std_logic_vector(4 downto 0);
    GTX0_TXPREEMPHASIS_IN                   : in   std_logic_vector(3 downto 0);
    GTX0_TXBUFSTATUS_OUT                    : out  std_logic_vector(1 downto 0);
    GTX0_MGTREFCLKTX_IN                     : in   std_logic_vector(1 downto 0);
    GTX0_PERFCLKTX_IN                       : in   std_logic;
    GTX0_GREFCLKTX_IN                       : in   std_logic;
    GTX0_NORTHREFCLKTX_IN                   : in   std_logic_vector(1 downto 0);
    GTX0_SOUTHREFCLKTX_IN                   : in   std_logic_vector(1 downto 0);
    GTX0_TXPLLREFSELDY_IN                   : in   std_logic_vector(2 downto 0);
    GTX0_GTXTEST_IN                         : in   std_logic_vector(12 downto 0);
    GTX0_GTXTXRESET_IN                      : in   std_logic;
    GTX0_PLLTXRESET_IN                      : in   std_logic;
    GTX0_TXPLLLKDET_OUT                     : out  std_logic;
    GTX0_TXRESETDONE_OUT                    : out  std_logic);
end component;

--------------------------------------------------------------------------------
-- Signal definitions

attribute keep : string;
attribute equivalent_register_removal : string;

-- GTX Signals

signal txoutclk :           std_logic;
signal txusrclk :           std_logic;
signal txbufstatus :        std_logic_vector(1 downto 0);
signal txreset :            std_logic;
signal txresetdone :        std_logic;
signal dp_do :              std_logic_vector(15 downto 0);
signal dp_drdy :            std_logic;
signal dp_daddr :           std_logic_vector(7 downto 0);
signal dp_di :              std_logic_vector(15 downto 0);
signal dp_den :             std_logic;
signal dp_dwe :             std_logic;
signal rxcdrreset :         std_logic;
signal rxbufstatus :        std_logic_vector(2 downto 0);
signal rxresetdone :        std_logic;
signal rxratedone :         std_logic;
signal rxbufreset :         std_logic;
signal rx_recclk :          std_logic;
signal rxusrclk :           std_logic;
signal rx_rate :            std_logic_vector(1 downto 0);
signal gtx_rxcdrreset :     std_logic;
signal gtx_txpllrefseldy :  std_logic_vector(2 downto 0);
signal gtxtest :            std_logic_vector(12 downto 0);

-- TX signal definitions

signal tx_ce :              std_logic_vector(2 downto 0) := (others => '1');    -- 3 copies of TX clock enable
attribute keep of tx_ce : signal is "TRUE";
attribute equivalent_register_removal of tx_ce : signal is "no";

signal sd_ce :              std_logic := '0';                                   -- This is the SD-SDI TX clock enable
attribute keep of sd_ce : signal is "TRUE";
attribute equivalent_register_removal of sd_ce : signal is "no";

signal gen_sd_ce :          std_logic_vector(10 downto 0) := "00000100001";     -- Generates 5/6/5/6 cadence SD-SDI TX clock enable
attribute keep of gen_sd_ce : signal is "TRUE";
attribute equivalent_register_removal of gen_sd_ce : signal is "no";

signal ce_mux :             std_logic;                                          -- Used to generate the tx_ce signals
signal m_sync :             std_logic_vector(2 downto 0) := (others => '0');    -- Synchronizes the tx_m signal to txusrclk
signal m_ctrl :             std_logic := '0';                                   -- Controlled version of tx_m (forced to 0 under some conditions)
signal m_prev :             std_logic := '0';                                   -- Used to detect change in the tx_m signal
signal m_change :           std_logic;                                          -- Indicates when m_ctrl changes values
signal tx_gtx_data :        std_logic_vector(19 downto 0);                      -- Output data to the GTX TX
signal hdgen_y :            hd_video_type;                                      -- HD pattern generator Y component
signal hdgen_c :            hd_video_type;                                      -- HD pattern generator C component
signal hdgen_ln :           hd_vpos_type;                                       -- HD pattern generator line number
signal ntsc_patgen :        std_ulogic_vector(9 downto 0);                      -- NTSC pattern generator output
signal pal_patgen :         std_ulogic_vector(9 downto 0);                      -- PAL pattern generator output
signal sd_patgen :          xavb_data_stream_type;                              -- MUX of ntsc_patgen and pal_patgen
signal tx_y_in :            xavb_data_stream_type;                              -- TX video signal into VPID insert module -- Y component
signal tx_c_in :            xavb_data_stream_type;                              -- TX video signal into VPID insert module -- C component
signal ds1a :               xavb_data_stream_type;                              -- Data stream 1 A from VPID insert module to output module
signal ds2a :               xavb_data_stream_type;                              -- Data stream 2 A from VPID insert module to output module
signal ds1b :               xavb_data_stream_type;                              -- Data stream 1 B from VPID insert module to output module
signal ds2b :               xavb_data_stream_type;                              -- Data stream 2 B from VPID insert module to output module
signal eav :                std_logic;                                          -- EAV signal from VPID insert module to output module
signal sav :                std_logic;                                          -- SAV signal from VPID insert module to output module
signal out_mode :           std_logic_vector(1 downto 0);                       -- Output mode signal from VPID insert module to output module
signal tx_vpid_byte2 :      std_logic_vector(7 downto 0);                       -- Value of SMPTE 352 VPID user data word 2
signal tx_mode_reg :        std_logic_vector(1 downto 0) := (others => '0');    -- Registered version of tx_mode
signal tx_format_reg :      std_logic_vector(2 downto 0) := (others => '0');    -- Registered version of tx_format
signal tx_vpidins_enable :  std_logic;
signal rx_ds1_a_int :       xavb_data_stream_type;
signal txplllkdet :         std_logic;

--
-- RX signal definitions
--
signal rx_ce_int :          std_logic_vector(1 downto 0);                       -- Internal version of RX clock enable
signal rx_gtx_data :        std_logic_vector(19 downto 0);                      -- Received data from GTX RX
signal rx_hd_locked :       std_logic;                                          -- HD/3G locked
signal rx_hd_format :       xavb_vid_format_type;                               -- HD/3G transport format
signal rx_mode_SD :         std_logic;                                          -- 1 = RX in SD-SDI mode
signal rx_mode_HD :         std_logic;                                          -- 1 = RX in HD-SDI mode
signal rx_mode_3G :         std_logic;                                          -- 1 = RX in 3G-SDI mode
signal rx_crc_err_a :       std_logic;                                          -- RX CRC error A
signal rx_crc_err_b :       std_logic;                                          -- RX CRC error B
signal rx_crc_err_ab :      std_logic;
signal rx_crc_err_edge :    std_logic_vector(1 downto 0) := "00";
signal rx_hd_crc_err :      std_logic := '0';                                   -- Captured version of RX CRC error signal
signal rx_edh_errcnt :      edh_errcnt_type;                                    -- EDH error count
signal rx_edh_err :         std_logic;                                          -- EDH error signal
signal rx_crc_err_count :   unsigned(23 downto 0) := (others => '0');           -- CRC error count
signal rx_err_count_tc :    std_logic;                                          -- terminal count for rx_crc_err_count reached
signal sd_clr_errs :        std_logic := '0';
signal edh_rst :            std_logic;
signal rx_dout_rdy_3G_out : std_logic_vector(0 downto 0);
signal rx_level_b_int :     std_logic;
signal rx_mode_locked_int : std_logic;
signal rx_mode_int :        std_logic_vector(1 downto 0);
signal rx_sd_format :       vidstd_type;
signal rx_sd_format_std :   std_logic_vector(2 downto 0);
signal rx_sd_locked :       std_logic;

begin

--------------------------------------------------------------------------------
-- TX section
--

--
-- Input register for TX SDI mode selection signals
--
process(txusrclk)
begin
    if rising_edge(txusrclk) then
        tx_mode_reg <= tx_mode;
    end if;
end process;

--
-- TX clock enable generator
--
-- sd_ce runs at 27 MHz and is asserted at a 5/6/5/6 cadence
-- tx_ce is always 1 for 3G-SDI and HD-SDI and equal to sd_ce for SD-SDI
--
-- Create 3 identical but separate copies of the clock enable for loading purposes.
--
process(txusrclk)
begin
    if rising_edge(txusrclk) then
        gen_sd_ce <= (gen_sd_ce(9 downto 0) & gen_sd_ce(10));
    end if;
end process;

process(txusrclk)
begin
    if rising_edge(txusrclk) then
        sd_ce <= gen_sd_ce(10);
    end if;
end process;

ce_mux <= gen_sd_ce(10) when tx_mode_reg = "01" else '1';

process(txusrclk)
begin
    if rising_edge(txusrclk) then
        tx_ce <= (others => ce_mux);
    end if;
end process;

--
-- Global clock buffer for txusrclk
--
TXUSRCLKBUFG : BUFG
port map (
    I           => txoutclk,
    O           => txusrclk);

txusrclk_out <= txusrclk;

--
-- Synchronize the tx_m reference clock selection signal to txusrclk
--
process(txusrclk)
begin
    if rising_edge(txusrclk) then
        m_sync <= (m_sync(1 downto 0) & tx_m);
    end if;
end process;

--
-- m_ctlr is the actual signal used to select the reference clock. In most cases,
-- it is the same as the synchronized versionof tx_m. But, in SD-SDI mode and 
-- in HD/3G modes when the frame rate selected is 25 Hz or 50 Hz, it is forced
-- to 0 to select the 148.5 MHz reference clock.
--
process(txusrclk)
begin
    if rising_edge(txusrclk) then
        if tx_mode_reg = "01" then
            m_ctrl <= '0';
        elsif tx_format_reg = "000" or tx_format_reg = "011" or tx_format_reg = "101" then
            m_ctrl <= '0';
        else
            m_ctrl <= m_sync(1);
        end if;
    end if;
end process;

--
-- Detect a change in the m_ctrl signal
process(txusrclk)
begin
    if rising_edge(txusrclk) then
        m_prev <= m_ctrl;
    end if;
end process;

m_change <= m_ctrl xor m_prev;

--
-- Generate the tx_format_reg signal. This is equal to tx_format in HD mode,
-- but is forced to a legal value in 3G mode because all video formats are not
-- legal in 3G mode.
--
process(txusrclk)
begin
    if rising_edge(txusrclk) then
        if tx_mode_reg /= "10" then
            tx_format_reg <= tx_format;
        elsif tx_format = "101" then
            tx_format_reg <= "101";
        else
            tx_format_reg <= "100";     -- Force all illegal 3G formats to be 1080p 60 Hz
        end if;
    end if;
end process;
        
--
-- HD video pattern generator
--
VIDGEN : multigenHD
port map (
    clk         => txusrclk,
    rst         => tx_reset,
    ce          => '1',
    std         => tx_format_reg,
    pattern     => tx_pattern,
    user_opt    => "00",
    y           => hdgen_y,
    c           => hdgen_c,
    h_blank     => open,
    v_blank     => open,
    field       => open,
    trs         => open,
    xyz         => open,
    line_num    => hdgen_ln);

--
-- SD video pattern generators
--
NTSC : vidgen_ntsc
port map (
    clk_a       => txusrclk,
    rst_a       => '0',
    ce_a        => sd_ce,
    pattern_a   => tx_pattern(0),
    q_a         => ntsc_patgen,
    h_sync_a    => open,
    v_sync_a    => open,
    field_a     => open,
    clk_b       => '0',
    rst_b       => '0',
    ce_b        => '0',
    pattern_b   => '0',
    q_b         => open,
    h_sync_b    => open,
    v_sync_b    => open,
    field_b     => open);

PAL : vidgen_pal
port map (
    clk_a       => txusrclk,
    rst_a       => '0',
    ce_a        => sd_ce,
    pattern_a   => tx_pattern(0),
    q_a         => pal_patgen,
    h_sync_a    => open,
    v_sync_a    => open,
    field_a     => open,
    clk_b       => '0',
    rst_b       => '0',
    ce_b        => '0',
    pattern_b   => '0',
    q_b         => open,
    h_sync_b    => open,
    v_sync_b    => open,
    field_b     => open);

--
-- Video pattern generator output muxes.
--
sd_patgen <= xavb_data_stream_type(pal_patgen) when tx_format_reg(0) = '1' else
             xavb_data_stream_type(ntsc_patgen);
tx_y_in <= sd_patgen when tx_mode_reg = "01" else hdgen_y;
tx_c_in <= hdgen_c;

--
-- Generate the SMPTE 352 VPID byte 2 for 3G-SDI based on the tx_format_reg and
-- bit rate.
--
process(tx_format_reg, m_ctrl)
begin
    if tx_format_reg(0) = '1' then
        tx_vpid_byte2 <= X"C9";     -- 50 Hz
    elsif m_ctrl = '1' then
        tx_vpid_byte2 <= X"CA";     -- 60 Hz
    else
        tx_vpid_byte2 <= X"CB";     -- 59.94 Hz
    end if;
end process;

--
-- Triple-rate SDI SMPTE 352 VPID packet insertion.
--
tx_vpidins_enable <= '1' when tx_mode_reg = "10" else '0';

VPIDINS : triple_sdi_vpid_insert 
port map (
    clk             => txusrclk,
    ce              => tx_ce(0),
    din_rdy         => '1',
    rst             => tx_reset,
    sdi_mode        => tx_mode_reg,
    level           => '0',                     -- always level A
    enable          => tx_vpidins_enable,       -- only enabled in 3G-SDI mode
    overwrite       => '1',
    byte1           => X"89",                   -- 1080-line 3G-SDI level A
    byte2           => tx_vpid_byte2,
    byte3           => X"00",
    byte4a          => X"09",
    byte4b          => X"09",
    ln_a            => hdgen_ln,
    ln_b            => hdgen_ln,
    line_f1         => xavb_hd_line_num_type(std_logic_vector(to_unsigned(10,  11))),
    line_f2         => xavb_hd_line_num_type(std_logic_vector(to_unsigned(572, 11))),
    line_f2_en      => '0',
    a_y_in          => tx_y_in,
    a_c_in          => tx_c_in,
    b_y_in          => "0000000000",
    b_c_in          => "0000000000",
    ds1a_out        => ds1a,
    ds2a_out        => ds2a,
    ds1b_out        => ds1b,
    ds2b_out        => ds2b,
    eav_out         => eav,
    sav_out         => sav,
    out_mode        => out_mode);

--
-- Triple-rate SDI Tx output module.
--
TXOUTPUT : triple_sdi_tx_output_20b
port map (
    clk             => txusrclk,
    ce              => tx_ce(2 downto 1),
    din_rdy         => '1',
    rst             => tx_reset,
    mode            => out_mode,
    ds1a            => ds1a,
    ds2a            => ds2a,
    ds1b            => ds1b,
    ds2b            => ds2b,
    insert_crc      => '1',
    insert_ln       => '1',
    insert_edh      => '1',
    ln_a            => hdgen_ln,
    ln_b            => hdgen_ln,
    eav             => eav,
    sav             => sav,
    txdata          => tx_gtx_data,
    ce_align_err    => open);

--------------------------------------------------------------------------------
-- RX section
--

--
-- Global clock buffer for recovered clock
--
RXBUFG : BUFG
port map (
    I               => rx_recclk,
    O               => rxusrclk);

rxusrclk_out <= rxusrclk;

--
-- Triple rate SDI data path
--
SDIRX1 : triple_sdi_rx_20b
generic map (
    NUM_SD_CE              => 2,
    NUM_3G_DRDY            => 1)
port map (
    clk                     => rxusrclk,
    rst                     => '0',
    data_in                 => rx_gtx_data,
    frame_en                => '1',
    mode                    => rx_mode_int,
    mode_HD                 => rx_mode_HD,
    mode_SD                 => rx_mode_SD,
    mode_3G                 => rx_mode_3G,
    mode_locked             => rx_mode_locked_int,
    rx_locked               => rx_hd_locked,
    t_format                => rx_hd_format,
    level_b_3G              => rx_level_b_int,
    ce_sd                   => rx_ce_int,
    nsp                     => open,
    ln_a                    => rx_ln_a,
    a_vpid                  => rx_a_vpid,
    a_vpid_valid            => rx_a_vpid_valid,
    b_vpid                  => rx_b_vpid,
    b_vpid_valid            => rx_b_vpid_valid,
    crc_err_a               => rx_crc_err_a,
    ds1_a                   => rx_ds1_a_int,
    ds2_a                   => rx_ds2_a,
    eav                     => rx_eav,
    sav                     => rx_sav,
    trs                     => open,
    ln_b                    => rx_ln_b,
    dout_rdy_3G             => rx_dout_rdy_3G_out,
    crc_err_b               => rx_crc_err_b,
    ds1_b                   => rx_ds1_b,
    ds2_b                   => rx_ds2_b);

rx_ce <= rx_ce_int(1);
rx_dout_rdy_3G <= rx_dout_rdy_3G_out(0);
rx_level_b <= rx_level_b_int;
rx_mode_locked <= rx_mode_locked_int;
rx_mode <= rx_mode_int;
rx_ds1_a <= rx_ds1_a_int;

--
-- CRC eror capture and counting logic
--
raw_rx_crc_err <= rx_crc_err_a or rx_crc_err_b;

process(rxusrclk)
begin
    if rising_edge(rxusrclk) then
        if rx_clr_errs = '1' then
            rx_hd_crc_err <= '0';
        elsif rx_crc_err_a = '1' or (rx_mode_3G = '1' and rx_crc_err_b = '1' and rx_level_b_int = '1') then
            rx_hd_crc_err <= '1';
        end if;
    end if;
end process;

rx_crc_err_ab <= rx_crc_err_a or (rx_mode_3G and rx_level_b_int and rx_crc_err_b);

process(rxusrclk)
begin
    if rising_edge(rxusrclk) then
        rx_crc_err_edge <= (rx_crc_err_edge(0) & rx_crc_err_ab);
    end if;
end process;

process(rxusrclk)
begin
    if rising_edge(rxusrclk) then
        if rx_clr_errs = '1' or rx_mode_locked_int = '0' then
            rx_crc_err_count <= (others => '0');
        elsif rx_crc_err_edge(0) = '1' and rx_crc_err_edge(1) = '0' and rx_err_count_tc = '0' then
            rx_crc_err_count <= rx_crc_err_count + 1;
        end if;
    end if;
end process;

rx_err_count <= rx_edh_errcnt when rx_mode_SD = '1' else std_logic_vector(rx_crc_err_count);
rx_err_count_tc <= '1' when rx_crc_err_count = X"FFFFFF" else '0';

process(rxusrclk)
begin
    if rising_edge(rxusrclk) then
        if rx_clr_errs = '1' then
            sd_clr_errs <= '1';
        elsif rx_ce_int(0) = '1' then
            sd_clr_errs <= '0';
        end if;
    end if;
end process;

--
-- SD-SDI EDH processor
--
edh_rst <= '1' when rx_mode_int /= "01" else '0';

EDH : edh_processor
port map (
    clk                     => rxusrclk,
    ce                      => rx_ce_int(0),
    rst                     => edh_rst,
    vid_in                  => video_type(rx_ds1_a_int),
    reacquire               => '0',
    en_sync_switch          => '1',
    en_trs_blank            => '0',
    anc_idh_local           => '0',
    anc_ues_local           => '0',
    ap_idh_local            => '0',
    ff_idh_local            => '0',
    errcnt_flg_en           => "0000010000100000",
    clr_errcnt              => sd_clr_errs,
    receive_mode            => '1',
    vid_out                 => open,
    std                     => rx_sd_format,
    std_locked              => rx_sd_locked,
    trs                     => open,
    field                   => open,
    v_blank                 => open,
    h_blank                 => rx_sd_hsync,
    horz_count              => open,
    vert_count              => open,
    sync_switch             => open,
    locked                  => open,
    eav_next                => open,
    sav_next                => open,
    xyz_word                => open,
    anc_next                => open,
    edh_next                => open,
    rx_ap_flags             => open,
    rx_ff_flags             => open,
    rx_anc_flags            => open,
    ap_flags                => open,
    ff_flags                => open,
    anc_flags               => open,
    packet_flags            => open,
    errcnt                  => rx_edh_errcnt,
    edh_packet              => open);

--
-- Generate a single bit EDH signal that is asserted when the EDH error count
-- is non zero.
--
rx_edh_err <= '1' when rx_edh_errcnt /= X"000000" else '0';

--
-- The rx_locked, rx_format, and rx_crc_err signals are driven by either the
-- EDH processor in SD-SDI mode or the main RX in HD/3G modes.
--
rx_locked  <= rx_sd_locked when rx_mode_SD = '1' else rx_hd_locked;
rx_crc_err <= rx_edh_err when rx_mode_SD = '1' else rx_hd_crc_err;
rx_sd_format_std <= std_logic_vector(rx_sd_format);
rx_format  <= ('0' & rx_sd_format_std) when rx_mode_SD = '1' else rx_hd_format;

--------------------------------------------------------------------------------
-- GTX control module
--
GTXCTRL : v6gtx_sdi_control
generic map (
    DRPCLK_FREQ             => 27000000)
port map (
    drpclk                  => drpclk,
    rst                     => '0',

    txusrclk                => txusrclk,
    tx_mode                 => tx_mode_reg,
    txreset_in              => m_change,
    txresetdone             => txresetdone,
    txbufstatus1            => txbufstatus(1),
    txplllkdet              => txplllkdet,
    txreset_out             => txreset,
    gtxtest                 => gtxtest,
    tx_rate_change_done     => open,
    tx_slew                 => open,

    rxusrclk                => rxusrclk,
    rx_mode                 => rx_mode_int,
    rxresetdone             => rxresetdone,
    rxbufstatus2            => rxbufstatus(2),
    rxratedone              => rxratedone,
    rxcdrreset              => rxcdrreset,
    rxbufreset              => rxbufreset,
    rxrate                  => rx_rate,
    rx_m                    => rx_m,

    drpdo                   => dp_do,
    drdy                    => dp_drdy,
    daddr                   => dp_daddr,
    di                      => dp_di,
    den                     => dp_den,
    dwe                     => dp_dwe);

--------------------------------------------------------------------------------
-- GTX wrapper
--

gtx_rxcdrreset <= rxcdrreset or rx_cdrreset;
gtx_txpllrefseldy <= ("00" &  m_ctrl);

SDIGTX : V6SDI_WRAPPER
port map (
    ------------------------ Loopback and Powerdown Ports ----------------------
    GTX0_LOOPBACK_IN        => "000",
    ------------------- Receive Ports - RX Data Path interface -----------------
    GTX0_RXDATA_OUT         => rx_gtx_data,
    GTX0_RXRECCLK_OUT       => rx_recclk,
    GTX0_RXRESET_IN         => '0',
    GTX0_RXUSRCLK2_IN       => rxusrclk,
    GTX0_RXCDRRESET_IN      => gtx_rxcdrreset,
    ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    GTX0_RXN_IN             => rxn,
    GTX0_RXP_IN             => rxp,
    -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
    GTX0_RXBUFSTATUS_OUT    => rxbufstatus,
    GTX0_RXBUFRESET_IN      => rxbufreset,
    ------------------------ Receive Ports - RX PLL Ports ----------------------
    GTX0_MGTREFCLKRX_IN     => (mgtclk1 & mgtclk0),
    GTX0_PERFCLKRX_IN       => '0',
    GTX0_GREFCLKRX_IN       => '0',
    GTX0_NORTHREFCLKRX_IN   => "00",
    GTX0_SOUTHREFCLKRX_IN   => "00",
    GTX0_RXPLLREFSELDY_IN   => "001",
    GTX0_GTXRXRESET_IN      => rx_gtxreset,
    GTX0_PLLRXRESET_IN      => '0',
    GTX0_RXPLLLKDET_OUT     => rxpll_locked,
    GTX0_RXRATE_IN          => rx_rate,
    GTX0_RXRATEDONE_OUT     => rxratedone,
    GTX0_RXRESETDONE_OUT    => rxresetdone,
    ------------- Shared Ports - Dynamic Reconfiguration Port (DRP) ------------
    GTX0_DADDR_IN           => dp_daddr,
    GTX0_DCLK_IN            => drpclk,
    GTX0_DEN_IN             => dp_den,
    GTX0_DI_IN              => dp_di,
    GTX0_DRDY_OUT           => dp_drdy,
    GTX0_DRPDO_OUT          => dp_do,
    GTX0_DWE_IN             => dp_dwe,
    ------------------ Transmit Ports - TX Data Path interface -----------------
    GTX0_TXDATA_IN          => tx_gtx_data,
    GTX0_TXOUTCLK_OUT       => txoutclk,
    GTX0_TXRESET_IN         => txreset,
    GTX0_TXUSRCLK2_IN       => txusrclk,
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    GTX0_TXDIFFCTRL_IN      => "0011",
    GTX0_TXN_OUT            => txn,
    GTX0_TXP_OUT            => txp,
    GTX0_TXPOSTEMPHASIS_IN  => postemphasis,
    GTX0_TXPREEMPHASIS_IN   => "0000",
    ----------- Transmit Ports - TX Elastic Buffer and Phase Alignment ---------
    GTX0_TXBUFSTATUS_OUT    => txbufstatus,
    ----------------------- Transmit Ports - TX PLL Ports ----------------------
    GTX0_MGTREFCLKTX_IN     => (mgtclk1 & mgtclk0),
    GTX0_PERFCLKTX_IN       => '0',
    GTX0_GREFCLKTX_IN       => '0',
    GTX0_NORTHREFCLKTX_IN   => "00",
    GTX0_SOUTHREFCLKTX_IN   => "00",
    GTX0_TXPLLREFSELDY_IN   => gtx_txpllrefseldy,
    GTX0_GTXTEST_IN         => gtxtest,
    GTX0_GTXTXRESET_IN      => tx_gtxreset,
    GTX0_PLLTXRESET_IN      => '0',
    GTX0_TXPLLLKDET_OUT     => txplllkdet,
    GTX0_TXRESETDONE_OUT    => txresetdone);

txpll_locked <= txplllkdet;

end xilinx;
