-------------------------------------------------------------------------------- 
-- Copyright (c) 2010 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow
--  \   \        Filename: $RCSfile: v6sdi_4rx4tx_demo.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-10-20 10:27:27-06 $
-- /___/   /\    Date Created: January 6, 2010
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: v6sdi_4rx4tx_demo.vhd,rcs $
-- Revision 1.2  2010-10-20 10:27:27-06  jsnow
-- DRPCLK was changed from the SystemACE clock to the 27 MHz clock
-- from the FMC because different versions of the ML605 board have
-- different SystemACE clock frequencies.
--
-- Revision 1.1  2010-04-12 10:03:28-06  jsnow
-- Changed to keep GTX TX PLL in reset for a short period of time
-- after Si5324 devices become locked.
--
-- Revision 1.0  2010-03-08 14:12:44-07  jsnow
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
-- This demo has four independent SDI RX and TX. Each TX is driven by a pattern
-- generator. The output of each RX can be observed via ChipScope.
-- 
-- This demo requires a CTSLCM1 module in the clock module "L" position of the
-- broadcast connectivity FMC mezzanine card. The Si5324 on the FMC mezzanine 
-- card generates the 148.5 MHz reference clock and the Si5324 "A" on the 
-- CTSLCM1 clock module generates the 148.5/1.001 MHz reference clock.
-- 
-- Note that the GTX TX driver postemphasis values have been optimized for the
-- broadcast FMC mezzanine card. These values are only optimum for this particular
-- card.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.hdsdi_pkg.all;

library unisim; 
use unisim.vcomponents.all; 

entity v6sdi_4rx4tx_demo is
port (
-- MGTs
    FMC_HPC_DP0_C2M_N:          out std_logic;
    FMC_HPC_DP0_C2M_P:          out std_logic;
    FMC_HPC_DP0_M2C_N:          in  std_logic;
    FMC_HPC_DP0_M2C_P:          in  std_logic;

    FMC_HPC_DP1_C2M_N:          out std_logic;
    FMC_HPC_DP1_C2M_P:          out std_logic;
    FMC_HPC_DP1_M2C_N:          in  std_logic;
    FMC_HPC_DP1_M2C_P:          in  std_logic;

    FMC_HPC_DP2_C2M_N:          out std_logic;
    FMC_HPC_DP2_C2M_P:          out std_logic;
    FMC_HPC_DP2_M2C_N:          in  std_logic;
    FMC_HPC_DP2_M2C_P:          in  std_logic;

    FMC_HPC_DP3_C2M_N:          out std_logic;
    FMC_HPC_DP3_C2M_P:          out std_logic;
    FMC_HPC_DP3_M2C_N:          in  std_logic;
    FMC_HPC_DP3_M2C_P:          in  std_logic;

-- MGT REFCLKs
    FMC_HPC_GBTCLK0_M2C_N:      in  std_logic;      -- Q113 MGTREFCLK0 (148.5 MHz)
    FMC_HPC_GBTCLK0_M2C_P:      in  std_logic;
    FMC_HPC_CLK2_M2C_MGT_C_N:   in  std_logic;      -- Q113 MGTREFCLK1 (148.35 MHz)
    FMC_HPC_CLK2_M2C_MGT_C_P:   in  std_logic;

-- AVB FMC card connections
    FMC_HPC_HB06_CC_N:          in  std_logic;      -- 27 MHz XO
    FMC_HPC_HB06_CC_P:          in  std_logic;
    
    FMC_HPC_LA00_CC_P:          out std_logic;      -- main SPI interface SCK
    FMC_HPC_LA00_CC_N:          out std_logic;      -- main SPI interface MOSI
    FMC_HPC_LA27_P:             in  std_logic;      -- main SPI interface MISO
    FMC_HPC_LA14_N:             out std_logic;      -- mian SPI interface SS

-- Clock Module L connections

    FMC_HPC_LA29_P:             out std_logic;      -- CML SPI interface SCK
    FMC_HPC_LA29_N:             in std_logic;       -- CML SPI interface MISO
    FMC_HPC_LA07_P:             out std_logic;      -- CML SPI interface MOSI
    FMC_HPC_LA07_N:             out std_logic;      -- CML SPI interface SS

    FMC_HPC_LA13_P:             out std_logic;      -- Si5324 A reset asserted low
    FMC_HPC_LA33_P:             out std_logic;      -- Si5324 B reset asserted low
    FMC_HPC_LA26_P:             out std_logic;      -- Si5324 C reset asserted low
    
    USER_SMA_GPIO_P:            out std_logic;
    USER_SMA_GPIO_N:            out std_logic;
    GPIO_LED_0:                 out std_logic;
    GPIO_LED_1:                 out std_logic;
    GPIO_LED_2:                 out std_logic;
    GPIO_LED_3:                 out std_logic;
    GPIO_LED_4:                 out std_logic;
    GPIO_LED_5:                 out std_logic;  
    LCD_DB4:                    out std_logic;
    LCD_DB5:                    out std_logic;
    LCD_DB6:                    out std_logic;
    LCD_DB7:                    out std_logic;
    LCD_E:                      out std_logic;
    LCD_RW:                     out std_logic;
    LCD_RS:                     out std_logic;
    GPIO_SW_C:                  in  std_logic;
    GPIO_SW_W:                  in  std_logic;
    GPIO_SW_E:                  in  std_logic;
    GPIO_SW_N:                  in  std_logic;
    GPIO_SW_S:                  in  std_logic);
end v6sdi_4rx4tx_demo;

architecture xilinx of v6sdi_4rx4tx_demo is
    
--------------------------------------------------------------------------------
-- Internal signals definitions

-- Global signals
signal drpclk :             std_logic;
signal mgtclk_148_5 :       std_logic;
signal mgtclk_148_35 :      std_logic;
signal clk_fmc_27M :        std_logic;
signal clk_fmc_27M_in :     std_logic;
signal tx_gtxreset :        std_logic := '1';
signal tx_gtxreset_dly :    unsigned(9 downto 0) := (others => '0');
signal tx_gtxreset_x :      std_logic;
signal tx_gtxreset_tc :     std_logic;

-- TX1 signals
signal tx1_outclk :         std_logic;
signal tx1_usrclk :         std_logic;
signal dp0_tx_pll_locked :  std_logic;
signal tx1_mode :           std_logic_vector(1 downto 0);
signal tx1_M :              std_logic;
signal tx1_hdsd :           std_logic;
signal tx1_postemphasis :   std_logic_vector(4 downto 0);

-- TX2 signals
signal tx2_outclk :         std_logic;
signal tx2_usrclk :         std_logic;
signal dp1_tx_pll_locked :  std_logic;
signal tx2_mode :           std_logic_vector(1 downto 0);
signal tx2_M :              std_logic;
signal tx2_hdsd :           std_logic;
signal tx2_postemphasis :   std_logic_vector(4 downto 0);

-- TX3 signals
signal tx3_outclk :         std_logic;
signal tx3_usrclk :         std_logic;
signal dp2_tx_pll_locked :  std_logic;
signal tx3_mode :           std_logic_vector(1 downto 0);
signal tx3_M :              std_logic;
signal tx3_hdsd :           std_logic;
signal tx3_postemphasis :   std_logic_vector(4 downto 0);

-- TX4 signals
signal tx4_outclk :         std_logic;
signal tx4_usrclk :         std_logic;
signal dp3_tx_pll_locked :  std_logic;
signal tx4_mode :           std_logic_vector(1 downto 0);
signal tx4_M :              std_logic;
signal tx4_hdsd :           std_logic;
signal tx4_postemphasis :   std_logic_vector(4 downto 0);

-- RX1 signals
signal rx1_clr_errs :       std_logic;
signal rx1_usrclk :         std_logic;
signal rx1_mode :           std_logic_vector(1 downto 0);
signal rx1_mode_locked :    std_logic;
signal rx1_locked :         std_logic;
signal rx1_format :         std_logic_vector(3 downto 0);
signal rx1_level_b :        std_logic;
signal rx1_m :              std_logic;
signal rx1_ce :             std_logic;
signal rx1_dout_rdy_3G :    std_logic;
signal rx1_ln_a :           xavb_hd_line_num_type;
signal rx1_a_vpid :         std_logic_vector(31 downto 0);
signal rx1_a_vpid_valid :   std_logic;
signal rx1_crc_err :        std_logic;
signal rx1_ds1_a :          xavb_data_stream_type;
signal rx1_ds2_a :          xavb_data_stream_type;
signal rx1_ds1_b :          xavb_data_stream_type;
signal rx1_ds2_b :          xavb_data_stream_type;
signal rx1_eav :            std_logic;
signal rx1_sav :            std_logic;
signal rx1_pll_locked :     std_logic;
signal rx1_err_count :      std_logic_vector(23 downto 0);

-- RX2 signals
signal rx2_clr_errs :       std_logic;
signal rx2_usrclk :         std_logic;
signal rx2_mode :           std_logic_vector(1 downto 0);
signal rx2_mode_locked :    std_logic;
signal rx2_locked :         std_logic;
signal rx2_format :         std_logic_vector(3 downto 0);
signal rx2_level_b :        std_logic;
signal rx2_m :              std_logic;
signal rx2_ce :             std_logic;
signal rx2_dout_rdy_3G :    std_logic;
signal rx2_ln_a :           xavb_hd_line_num_type;
signal rx2_a_vpid :         std_logic_vector(31 downto 0);
signal rx2_a_vpid_valid :   std_logic;
signal rx2_crc_err :        std_logic;
signal rx2_ds1_a :          xavb_data_stream_type;
signal rx2_ds2_a :          xavb_data_stream_type;
signal rx2_ds1_b :          xavb_data_stream_type;
signal rx2_ds2_b :          xavb_data_stream_type;
signal rx2_eav :            std_logic;
signal rx2_sav :            std_logic;
signal rx2_pll_locked :     std_logic;
signal rx2_err_count :      std_logic_vector(23 downto 0);

-- RX3 signals
signal rx3_clr_errs :       std_logic;
signal rx3_usrclk :         std_logic;
signal rx3_mode :           std_logic_vector(1 downto 0);
signal rx3_mode_locked :    std_logic;
signal rx3_locked :         std_logic;
signal rx3_format :         std_logic_vector(3 downto 0);
signal rx3_level_b :        std_logic;
signal rx3_m :              std_logic;
signal rx3_ce :             std_logic;
signal rx3_dout_rdy_3G :    std_logic;
signal rx3_ln_a :           xavb_hd_line_num_type;
signal rx3_a_vpid :         std_logic_vector(31 downto 0);
signal rx3_a_vpid_valid :   std_logic;
signal rx3_crc_err :        std_logic;
signal rx3_ds1_a :          xavb_data_stream_type;
signal rx3_ds2_a :          xavb_data_stream_type;
signal rx3_ds1_b :          xavb_data_stream_type;
signal rx3_ds2_b :          xavb_data_stream_type;
signal rx3_eav :            std_logic;
signal rx3_sav :            std_logic;
signal rx3_pll_locked :     std_logic;
signal rx3_err_count :      std_logic_vector(23 downto 0);

-- RX4 signals
signal rx4_clr_errs :       std_logic;
signal rx4_usrclk :         std_logic;
signal rx4_mode :           std_logic_vector(1 downto 0);
signal rx4_mode_locked :    std_logic;
signal rx4_locked :         std_logic;
signal rx4_format :         std_logic_vector(3 downto 0);
signal rx4_level_b :        std_logic;
signal rx4_m :              std_logic;
signal rx4_ce :             std_logic;
signal rx4_dout_rdy_3G :    std_logic;
signal rx4_ln_a :           xavb_hd_line_num_type;
signal rx4_a_vpid :         std_logic_vector(31 downto 0);
signal rx4_a_vpid_valid :   std_logic;
signal rx4_crc_err :        std_logic;
signal rx4_ds1_a :          xavb_data_stream_type;
signal rx4_ds2_a :          xavb_data_stream_type;
signal rx4_ds1_b :          xavb_data_stream_type;
signal rx4_ds2_b :          xavb_data_stream_type;
signal rx4_eav :            std_logic;
signal rx4_sav :            std_logic;
signal rx4_pll_locked :     std_logic;
signal rx4_err_count :      std_logic_vector(23 downto 0);

-- AVB FMC mezzanine card signals 
signal fmc_tx1_red_led :    std_logic_vector(1 downto 0);
signal fmc_tx1_grn_led :    std_logic_vector(1 downto 0);
signal fmc_tx2_red_led :    std_logic_vector(1 downto 0);
signal fmc_tx2_grn_led :    std_logic_vector(1 downto 0);
signal fmc_tx3_red_led :    std_logic_vector(1 downto 0);
signal fmc_tx3_grn_led :    std_logic_vector(1 downto 0);
signal fmc_tx4_red_led :    std_logic_vector(1 downto 0);
signal fmc_tx4_grn_led :    std_logic_vector(1 downto 0);
signal fmc_sync_red_led :   std_logic_vector(1 downto 0);
signal fmc_sync_grn_led :   std_logic_vector(1 downto 0);
signal fmc_sync_err :       std_logic;
signal fmc_sync_rate :      std_logic_vector(2 downto 0);
signal fmc_sync_m :         std_logic;
signal fmc_sync_format :    std_logic_vector(10 downto 0);
signal fmc_sdi_eq_cd_n :    std_logic_vector(7 downto 0);
signal fmc_sdi_eq_cli :     std_logic_vector(4 downto 0);
signal fmc_sdi_drv_hd_sd :  std_logic_vector(7 downto 0);
signal fmc_sdi_drv_enable : std_logic_vector(7 downto 0);
signal fmc_sdi_drv_fault_n: std_logic_vector(7 downto 0);
signal fmc_fpga_rev :       std_logic_vector(7 downto 0);
signal fmc_exp_brd_prsnt :  std_logic;
signal fmc_Si5324_LOL :     std_logic;
signal cml_Si5324_A_LOL :   std_logic;
signal cml_type :           std_logic_vector(15 downto 0);
signal cml_type_valid :     std_logic;
signal cml_type_error :     std_logic;
signal lcd_d :              std_logic_vector(3 downto 0);                   -- LCD display data bus

-- ChipScope signals
signal tx1_vio_sync_out :   std_logic_vector(7 downto 0);
signal tx2_vio_sync_out :   std_logic_vector(7 downto 0);
signal tx3_vio_sync_out :   std_logic_vector(7 downto 0);
signal tx4_vio_sync_out :   std_logic_vector(7 downto 0);
signal rx1_vio_sync_out :   std_logic_vector(7 downto 0);
signal rx1_vio_async_in :   std_logic_vector(67 downto 0);
signal rx1_vio_async_out :  std_logic_vector(7 downto 0);
signal rx2_vio_sync_out :   std_logic_vector(7 downto 0);
signal rx2_vio_async_in :   std_logic_vector(67 downto 0);
signal rx2_vio_async_out :  std_logic_vector(7 downto 0);
signal rx3_vio_sync_out :   std_logic_vector(7 downto 0);
signal rx3_vio_async_in :   std_logic_vector(67 downto 0);
signal rx3_vio_async_out :  std_logic_vector(7 downto 0);
signal rx4_vio_sync_out :   std_logic_vector(7 downto 0);
signal rx4_vio_async_in :   std_logic_vector(67 downto 0);
signal rx4_vio_async_out :  std_logic_vector(7 downto 0);
signal rx1_trig0 :          std_logic_vector(54 downto 0);
signal rx2_trig0 :          std_logic_vector(54 downto 0);
signal rx3_trig0 :          std_logic_vector(54 downto 0);
signal rx4_trig0 :          std_logic_vector(54 downto 0);
signal control0 :           std_logic_vector(35 downto 0);
signal control1 :           std_logic_vector(35 downto 0);
signal control2 :           std_logic_vector(35 downto 0);
signal control3 :           std_logic_vector(35 downto 0);
signal control4 :           std_logic_vector(35 downto 0);
signal control5 :           std_logic_vector(35 downto 0);
signal control6 :           std_logic_vector(35 downto 0);
signal control7 :           std_logic_vector(35 downto 0);
signal control8 :           std_logic_vector(35 downto 0);
signal control9 :           std_logic_vector(35 downto 0);
signal control10 :          std_logic_vector(35 downto 0);
signal control11 :          std_logic_vector(35 downto 0);

component v6_sdi_rxtx
port (
    mgtclk0:            in  std_logic;
    mgtclk1:            in  std_logic;
    drpclk:             in  std_logic;
    tx_gtxreset:        in  std_logic;
    tx_reset:           in  std_logic;
    tx_m:               in  std_logic;
    postemphasis:       in  std_logic_vector(4 downto 0);
    txusrclk_out:       out std_logic;
    tx_format:          in  std_logic_vector(2 downto 0);
    tx_pattern:         in  std_logic_vector(1 downto 0);
    tx_mode:            in  std_logic_vector(1 downto 0);
    txp:                out std_logic;
    txn:                out std_logic;
    txpll_locked:       out std_logic;
    rxp:                in  std_logic;
    rxn:                in  std_logic;
    rx_gtxreset:        in  std_logic;
    rx_cdrreset:        in  std_logic;
    rx_clr_errs:        in  std_logic;
    rxusrclk_out:       out std_logic;
    rx_mode:            out std_logic_vector(1 downto 0);
    rx_mode_locked:     out std_logic;
    rx_locked:          out std_logic;
    rx_format:          out std_logic_vector(3 downto 0);
    rx_level_b:         out std_logic;
    rx_m:               out std_logic;
    rx_ce:              out std_logic;
    rx_dout_rdy_3G:     out std_logic;
    rx_ln_a:            out xavb_hd_line_num_type;
    rx_ln_b:            out xavb_hd_line_num_type;
    rx_a_vpid:          out std_logic_vector(31 downto 0);
    rx_a_vpid_valid:    out std_logic;
    rx_b_vpid:          out std_logic_vector(31 downto 0);
    rx_b_vpid_valid:    out std_logic;
    rx_crc_err:         out std_logic;
    rx_ds1_a:           out xavb_data_stream_type;
    rx_ds1_b:           out xavb_data_stream_type;
    rx_ds2_a:           out xavb_data_stream_type;
    rx_ds2_b:           out xavb_data_stream_type;
    rx_eav:             out std_logic;
    rx_sav:             out std_logic;
    rx_sd_hsync:        out std_logic;
    rxpll_locked:       out std_logic;
    rx_err_count:       out std_logic_vector(23 downto 0);
    raw_rx_crc_err:     out std_logic);
end component;

component main_avb_control
port (
    clk:                in  std_logic;
    rst:                in  std_logic;
    sck:                out std_logic;
    mosi:               out std_logic;
    miso:               in  std_logic;
    ss:                 out std_logic;
    fpga_rev:           out std_logic_vector(7 downto 0);
    exp_brd_prsnt:      out std_logic;
    board_options:      out std_logic_vector(7 downto 0);
    xbar1_out0_sel:     in  std_logic_vector(1 downto 0);
    xbar1_out1_sel:     in  std_logic_vector(1 downto 0);
    xbar1_out2_sel:     in  std_logic_vector(1 downto 0);
    xbar1_out3_sel:     in  std_logic_vector(1 downto 0);
    xbar2_out0_sel:     in  std_logic_vector(1 downto 0);
    xbar2_out1_sel:     in  std_logic_vector(1 downto 0);
    xbar2_out2_sel:     in  std_logic_vector(1 downto 0);
    xbar2_out3_sel:     in  std_logic_vector(1 downto 0);
    xbar3_out0_sel:     in  std_logic_vector(1 downto 0);
    xbar3_out1_sel:     in  std_logic_vector(1 downto 0);
    xbar3_out2_sel:     in  std_logic_vector(1 downto 0);
    xbar3_out3_sel:     in  std_logic_vector(1 downto 0);
    Si5324_reset:       in  std_logic;
    Si5324_clkin_sel:   in  std_logic_vector(1 downto 0);
    Si5324_out_fsel:    in  std_logic_vector(3 downto 0);
    Si5324_in_fsel:     in  std_logic_vector(4 downto 0);
    Si5324_bw_sel:      in  std_logic_vector(3 downto 0);
    Si5324_DHOLD:       in  std_logic;
    Si5324_FOS2:        out std_logic;
    Si5324_FOS1:        out std_logic;
    Si5324_LOL:         out std_logic;
    Si5324_reg_adr:     in  std_logic_vector(7 downto 0);
    Si5324_reg_wr_dat:  in  std_logic_vector(7 downto 0);
    Si5324_reg_rd_dat:  out std_logic_vector(7 downto 0);
    Si5324_reg_wr:      in  std_logic;
    Si5324_reg_rd:      in  std_logic;
    Si5324_reg_rdy:     out std_logic := '0';
    Si5324_error:       out std_logic := '0';
    sync_video_fmt:     out std_logic_vector(10 downto 0) := (others => '0');
    sync_updating:      out std_logic := '0';
    sync_frame_rate:    out std_logic_vector(2 downto 0) := (others => '0');
    sync_m:             out std_logic := '0';
    sync_err:           out std_logic := '0';
    sdi_rx1_led:        in  std_logic_vector(1 downto 0);
    sdi_rx2_led:        in  std_logic_vector(1 downto 0);
    sdi_rx3_led:        in  std_logic_vector(1 downto 0);
    sdi_rx4_led:        in  std_logic_vector(1 downto 0);
    sdi_rx5_led:        in  std_logic_vector(1 downto 0);
    sdi_rx6_led:        in  std_logic_vector(1 downto 0);
    sdi_rx7_led:        in  std_logic_vector(1 downto 0);
    sdi_rx8_led:        in  std_logic_vector(1 downto 0);
    sdi_tx1_red_led:    in  std_logic_vector(1 downto 0);
    sdi_tx1_grn_led:    in  std_logic_vector(1 downto 0);
    sdi_tx2_red_led:    in  std_logic_vector(1 downto 0);
    sdi_tx2_grn_led:    in  std_logic_vector(1 downto 0);
    sdi_tx3_red_led:    in  std_logic_vector(1 downto 0);
    sdi_tx3_grn_led:    in  std_logic_vector(1 downto 0);
    sdi_tx4_red_led:    in  std_logic_vector(1 downto 0);
    sdi_tx4_grn_led:    in  std_logic_vector(1 downto 0);
    sdi_tx5_red_led:    in  std_logic_vector(1 downto 0);
    sdi_tx5_grn_led:    in  std_logic_vector(1 downto 0);
    sdi_tx6_red_led:    in  std_logic_vector(1 downto 0);
    sdi_tx6_grn_led:    in  std_logic_vector(1 downto 0);
    sdi_tx7_red_led:    in  std_logic_vector(1 downto 0);
    sdi_tx7_grn_led:    in  std_logic_vector(1 downto 0);
    sdi_tx8_red_led:    in  std_logic_vector(1 downto 0);
    sdi_tx8_grn_led:    in  std_logic_vector(1 downto 0);
    aes_rx1_red_led:    in  std_logic_vector(1 downto 0);
    aes_rx1_grn_led:    in  std_logic_vector(1 downto 0);
    aes_rx2_red_led:    in  std_logic_vector(1 downto 0);
    aes_rx2_grn_led:    in  std_logic_vector(1 downto 0);
    aes_tx1_red_led:    in  std_logic_vector(1 downto 0);
    aes_tx1_grn_led:    in  std_logic_vector(1 downto 0);
    aes_tx2_red_led:    in  std_logic_vector(1 downto 0);
    aes_tx2_grn_led:    in  std_logic_vector(1 downto 0);
    madi_rx_red_led:    in  std_logic_vector(1 downto 0);
    madi_rx_grn_led:    in  std_logic_vector(1 downto 0);
    madi_tx_red_led:    in  std_logic_vector(1 downto 0);
    madi_tx_grn_led:    in  std_logic_vector(1 downto 0);
    sync_red_led:       in  std_logic_vector(1 downto 0);
    sync_grn_led:       in  std_logic_vector(1 downto 0);
    sdi_eq_cd_n:        out std_logic_vector(7 downto 0) := (others => '0');
    sdi_eq_ext_3G_reach:in  std_logic_vector(7 downto 0);
    sdi_eq_select:      in  std_logic_vector(2 downto 0);
    sdi_eq_cli:         out std_logic_vector(4 downto 0) := (others => '0');
    sdi_drv_hd_sd:      in  std_logic_vector(7 downto 0);
    sdi_drv_enable:     in  std_logic_vector(7 downto 0);
    sdi_drv_fault_n:    out std_logic_vector(7 downto 0) := (others => '0'));
end component;

component cm_avb_control
port (
    clk:                in  std_logic;
    rst:                in  std_logic;
    ga:                 in  std_logic;
    sck:                out std_logic;
    mosi:               out std_logic;
    miso:               in  std_logic;
    ss:                 out std_logic;
    module_type:        out std_logic_vector(15 downto 0) := (others => '0');
    module_rev:         out std_logic_vector(15 downto 0) := (others => '0');
    module_type_valid:  out std_logic := '0';
    module_type_error:  out std_logic := '0';
    clkin5_src_sel:     in  std_logic;
    gpio_dir_0:         in  std_logic_vector(7 downto 0);
    gpio_dir_1:         in  std_logic_vector(7 downto 0);
    gpio_dir_2:         in  std_logic_vector(7 downto 0);
    gp_out_value_0:     in  std_logic_vector(7 downto 0);
    gp_out_value_1:     in  std_logic_vector(7 downto 0);
    gp_out_value_2:     in  std_logic_vector(7 downto 0);
    gp_in_value_0:      out std_logic_vector(7 downto 0) := (others => '0');
    gp_in_value_1:      out std_logic_vector(7 downto 0) := (others => '0');
    gp_in_value_2:      out std_logic_vector(7 downto 0) := (others => '0');
    gp_in:              out std_logic_vector(3 downto 0) := (others => '0');
    i2c_slave_adr:      in  std_logic_vector(7 downto 0);
    i2c_reg_adr:        in  std_logic_vector(7 downto 0);
    i2c_reg_dat_wr:     in  std_logic_vector(7 downto 0);
    i2c_reg_wr:         in  std_logic;
    i2c_reg_rd:         in  std_logic;
    i2c_reg_dat_rd:     out std_logic_vector(7 downto 0) := (others => '0');
    i2c_reg_rdy:        out std_logic := '0';
    i2c_reg_error:      out std_logic := '0';
    Si5324_A_clkin_sel: in  std_logic;
    Si5324_A_out_fsel:  in  std_logic_vector(3 downto 0);
    Si5324_A_in_fsel:   in  std_logic_vector(4 downto 0);
    Si5324_A_bw_sel:    in  std_logic_vector(3 downto 0);
    Si5324_A_DHOLD:     in  std_logic;
    Si5324_A_FOS2:      out std_logic := '0';
    Si5324_A_FOS1:      out std_logic := '0';
    Si5324_A_LOL:       out std_logic := '0';
    Si5324_B_clkin_sel: in  std_logic;
    Si5324_B_out_fsel:  in  std_logic_vector(3 downto 0);
    Si5324_B_in_fsel:   in  std_logic_vector(4 downto 0);
    Si5324_B_bw_sel:    in  std_logic_vector(3 downto 0);
    Si5324_B_DHOLD:     in  std_logic;
    Si5324_B_FOS2:      out std_logic := '0';
    Si5324_B_FOS1:      out std_logic := '0';
    Si5324_B_LOL:       out std_logic := '0';
    Si5324_C_clkin_sel: in  std_logic;
    Si5324_C_out_fsel:  in  std_logic_vector(3 downto 0);
    Si5324_C_in_fsel:   in  std_logic_vector(4 downto 0);
    Si5324_C_bw_sel:    in  std_logic_vector(3 downto 0);
    Si5324_C_DHOLD:     in  std_logic;
    Si5324_C_FOS2:      out std_logic := '0';
    Si5324_C_FOS1:      out std_logic := '0';
    Si5324_C_LOL:       out std_logic := '0');
end component;

component lcd_control3
generic (
    ROM_FILE_NAME :         string := "file_name.txt";
    MIN_FMC_FPGA_REVISION:  integer := 8;
    REQUIRED_CML_TYPE:      integer := 0;
    REQUIRED_CMH_TYPE:      integer := 0);
port (
    clk:                    in  std_logic;
    rst:                    in  std_logic;
    sw_c:                   in  std_logic;
    sw_w:                   in  std_logic;
    sw_e:                   in  std_logic;
    sw_n:                   in  std_logic;
    sw_s:                   in  std_logic;
    fpga_rev:               in  std_logic_vector(7 downto 0);
    cml_type:               in  std_logic_vector(15 downto 0);
    cml_type_valid:         in  std_logic;
    cml_type_error:         in  std_logic;
    cmh_type:               in  std_logic_vector(15 downto 0);
    cmh_type_valid:         in  std_logic;
    cmh_type_error:         in  std_logic;
    active_rx:              in  std_logic_vector(3 downto 0);
    rx1_locked:             in  std_logic;
    rx1_mode:               in  std_logic_vector(1 downto 0);
    rx1_level:              in  std_logic;
    rx1_t_format:           in  std_logic_vector(3 downto 0);
    rx1_m:                  in  std_logic;
    rx2_locked:             in  std_logic;
    rx2_mode:               in  std_logic_vector(1 downto 0);
    rx2_level:              in  std_logic;
    rx2_t_format:           in  std_logic_vector(3 downto 0);
    rx2_m:                  in  std_logic;
    rx3_locked:             in  std_logic;
    rx3_mode:               in  std_logic_vector(1 downto 0);
    rx3_level:              in  std_logic;
    rx3_t_format:           in  std_logic_vector(3 downto 0);
    rx3_m:                  in  std_logic;
    rx4_locked:             in  std_logic;
    rx4_mode:               in  std_logic_vector(1 downto 0);
    rx4_level:              in  std_logic;
    rx4_t_format:           in  std_logic_vector(3 downto 0);
    rx4_m:                  in  std_logic;
    sync_active:            in  std_logic;
    sync_enable:            in  std_logic;
    sync_v:                 in  std_logic;
    sync_err:               in  std_logic;
    sync_m:                 in  std_logic;
    sync_frame_rate:        in  std_logic_vector(2 downto 0);
    sync_video_fmt:         in  std_logic_vector(10 downto 0);
    lcd_e:                  out std_logic;
    lcd_rw:                 out std_logic;
    lcd_rs:                 out std_logic;
    lcd_d:                  out std_logic_vector(3 downto 0));
end component;

component icon
PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL1 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL2 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL3 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL4 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL5 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL6 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL7 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL8 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL9 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL10 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL11 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
end component;

component ila
PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    TRIG0 : IN STD_LOGIC_VECTOR(54 DOWNTO 0));
end component;

component rx_vio
PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    ASYNC_IN : IN STD_LOGIC_VECTOR(67 DOWNTO 0);
    ASYNC_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    SYNC_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
end component;

component vio
PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    ASYNC_IN : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    SYNC_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
end component;


begin
--------------------------------------------------------------------------------
-- Status LEDs on ML605
--
GPIO_LED_0 <= rx1_locked;
GPIO_LED_1 <= rx2_locked;
GPIO_LED_2 <= rx3_locked;
GPIO_LED_3 <= rx4_locked;
GPIO_LED_4 <= not fmc_Si5324_LOL;
GPIO_LED_5 <= not cml_Si5324_A_LOL;

--
-- The GTX TX postemphasis feature is used to compensate for lack of bandwidth
-- in the FMC mezzanine board and, thereby, cleaning up the SDI TX eye. Different
-- postemphasis values are used for HD and 3G. Different transmitters also
-- have different postemphasis values because the circuit board traces for TX1
-- and TX2 are much shorter than TX3 and TX4 (because they go through crossbar 
-- swithces). These postemphasis values are specific to the ML605 board and
-- broadcast FMC mezzanine board. For other boards, the postemphasis value, if
-- required, will probably be different.
--
tx1_postemphasis <= "10100" when tx1_mode = "10" else "01010";
tx2_postemphasis <= "10100" when tx2_mode = "10" else "01010";
tx3_postemphasis <= "11000" when tx3_mode = "10" else "01100";
tx4_postemphasis <= "11000" when tx4_mode = "10" else "01100";

--------------------------------------------------------------------------------
-- Clock inputs and outputs

-- Drive tx1_usrclk to SMA connectors for monitoring purposes
USERGPIO : OBUFDS
generic map (
    IOSTANDARD      => "LVDS_25")
port map (
    I               => tx1_usrclk,
    O               => USER_SMA_GPIO_P,
    OB              => USER_SMA_GPIO_N);


-- 148.5 MHz MGT reference clock input
MGTCLKIN0 : IBUFDS_GTXE1
port map
(
    O               => mgtclk_148_5,
    ODIV2           => open,
    CEB             => '0',
    I               => FMC_HPC_GBTCLK0_M2C_P,
    IB              => FMC_HPC_GBTCLK0_M2C_N);


-- 148.35 MHz MGT reference clock input
MGTCLKIN1 : IBUFDS_GTXE1
port map
(
    O               => mgtclk_148_35,
    ODIV2           => open,
    CEB             => '0',
    I               => FMC_HPC_CLK2_M2C_MGT_C_P,
    IB              => FMC_HPC_CLK2_M2C_MGT_C_N);

--
-- The 27 MHz clock from the AVB FMC card runs the main_avb_control and 
-- cm_avb_control modules. Route this to a BUFG.
--
HB06IBUF : IBUFDS
generic map (
    IOSTANDARD      => "LVDS_25",
    DIFF_TERM       => TRUE)
port map (
    I           => FMC_HPC_HB06_CC_P,
    IB          => FMC_HPC_HB06_CC_N,
    O           => clk_fmc_27M_in);

BUF27M : AUTOBUF
generic map (
    BUFFER_TYPE     => "BUFG")
port map (
    I           => clk_fmc_27M_in,
    O           => clk_fmc_27M);

drpclk <= clk_fmc_27M;

-- Keep the GTX transmitters reset until both reference clocks are stable.
tx_gtxreset_x <= fmc_Si5324_LOL or cml_Si5324_A_LOL;

process(drpclk, tx_gtxreset_x)
begin
    if tx_gtxreset_x = '1' then
        tx_gtxreset_dly <= (others => '0');
    elsif rising_edge(drpclk) then
        if tx_gtxreset_tc = '0' then
            tx_gtxreset_dly <= tx_gtxreset_dly + 1;
        end if;
    end if;
end process;

tx_gtxreset_tc <= tx_gtxreset_dly(tx_gtxreset_dly'high);

process(drpclk, tx_gtxreset_x)
begin
    if tx_gtxreset_x = '1' then
        tx_gtxreset <= '1';
    elsif rising_edge(drpclk) then
        if tx_gtxreset_tc = '1' then
            tx_gtxreset <= '0';
        end if;
    end if;
end process;

--------------------------------------------------------------------------------
-- HD-SDI RX/TX #1
--
SDI1 : v6_sdi_rxtx
port map (
    mgtclk0         => mgtclk_148_5,
    mgtclk1         => mgtclk_148_35,
    drpclk          => drpclk,
    
    tx_gtxreset     => tx_gtxreset,
    tx_reset        => '0',
    tx_m            => tx1_M,
    postemphasis    => tx1_postemphasis,
    txusrclk_out    => tx1_usrclk,
    tx_format       => tx1_vio_sync_out(2 downto 0),
    tx_pattern      => tx1_vio_sync_out(4 downto 3),
    tx_mode         => tx1_mode,
    txp             => FMC_HPC_DP0_C2M_P,
    txn             => FMC_HPC_DP0_C2M_N,
    txpll_locked    => dp0_tx_pll_locked,
    
    rxp             => FMC_HPC_DP0_M2C_P,
    rxn             => FMC_HPC_DP0_M2C_N,
    rx_gtxreset     => fmc_Si5324_LOL,
    rx_cdrreset     => '0',
    rx_clr_errs     => rx1_clr_errs,
    rxusrclk_out    => rx1_usrclk,
    rx_mode         => rx1_mode,
    rx_mode_locked  => rx1_mode_locked,
    rx_locked       => rx1_locked,
    rx_format       => rx1_format,
    rx_level_b      => rx1_level_b,
    rx_m            => rx1_m,
    rx_ce           => rx1_ce,
    rx_dout_rdy_3G  => rx1_dout_rdy_3G,
    rx_ln_a         => rx1_ln_a,
    rx_ln_b         => open,
    rx_a_vpid       => rx1_a_vpid,
    rx_a_vpid_valid => rx1_a_vpid_valid,
    rx_b_vpid       => open,
    rx_b_vpid_valid => open,
    rx_crc_err      => rx1_crc_err,
    rx_ds1_a        => rx1_ds1_a,
    rx_ds2_a        => rx1_ds2_a,
    rx_ds1_b        => rx1_ds1_b,
    rx_ds2_b        => rx1_ds2_b,
    rx_eav          => rx1_eav,
    rx_sav          => rx1_sav,
    rx_sd_hsync     => open,
    rxpll_locked    => rx1_pll_locked,
    rx_err_count    => rx1_err_count,
    raw_rx_crc_err  => open);

 

--------------------------------------------------------------------------------
-- HD-SDI RX/TX #2
--
SDI2 : v6_sdi_rxtx
port map (
    mgtclk0         => mgtclk_148_5,
    mgtclk1         => mgtclk_148_35,
    drpclk          => drpclk,
    
    tx_gtxreset     => tx_gtxreset,
    tx_reset        => '0',
    tx_m            => tx2_M,
    postemphasis    => tx2_postemphasis,
    txusrclk_out    => tx2_usrclk,
    tx_format       => tx2_vio_sync_out(2 downto 0),
    tx_pattern      => tx2_vio_sync_out(4 downto 3),
    tx_mode         => tx2_mode,
    txp             => FMC_HPC_DP1_C2M_P,
    txn             => FMC_HPC_DP1_C2M_N,
    txpll_locked    => dp1_tx_pll_locked,
    
    rxp             => FMC_HPC_DP1_M2C_P,
    rxn             => FMC_HPC_DP1_M2C_N,
    rx_gtxreset     => fmc_Si5324_LOL,
    rx_cdrreset     => '0',
    rx_clr_errs     => rx2_clr_errs,
    rxusrclk_out    => rx2_usrclk,
    rx_mode         => rx2_mode,
    rx_mode_locked  => rx2_mode_locked,
    rx_locked       => rx2_locked,
    rx_format       => rx2_format,
    rx_level_b      => rx2_level_b,
    rx_m            => rx2_m,
    rx_ce           => rx2_ce,
    rx_dout_rdy_3G  => rx2_dout_rdy_3G,
    rx_ln_a         => rx2_ln_a,
    rx_ln_b         => open,
    rx_a_vpid       => rx2_a_vpid,
    rx_a_vpid_valid => rx2_a_vpid_valid,
    rx_b_vpid       => open,
    rx_b_vpid_valid => open,
    rx_crc_err      => rx2_crc_err,
    rx_ds1_a        => rx2_ds1_a,
    rx_ds2_a        => rx2_ds2_a,
    rx_ds1_b        => rx2_ds1_b,
    rx_ds2_b        => rx2_ds2_b,
    rx_eav          => rx2_eav,
    rx_sav          => rx2_sav,
    rx_sd_hsync     => open,
    rxpll_locked    => rx2_pll_locked,
    rx_err_count    => rx2_err_count,
    raw_rx_crc_err  => open);

--------------------------------------------------------------------------------
-- HD-SDI RX/TX #3
--
SDI3 : v6_sdi_rxtx
port map (
    mgtclk0         => mgtclk_148_5,
    mgtclk1         => mgtclk_148_35,
    drpclk          => drpclk,
    
    tx_gtxreset     => tx_gtxreset,
    tx_reset        => '0',
    tx_m            => tx3_M,
    postemphasis    => tx3_postemphasis,
    txusrclk_out    => tx3_usrclk,
    tx_format       => tx3_vio_sync_out(2 downto 0),
    tx_pattern      => tx3_vio_sync_out(4 downto 3),
    tx_mode         => tx3_mode,
    txp             => FMC_HPC_DP2_C2M_P,
    txn             => FMC_HPC_DP2_C2M_N,
    txpll_locked    => dp2_tx_pll_locked,
    
    rxp             => FMC_HPC_DP2_M2C_P,
    rxn             => FMC_HPC_DP2_M2C_N,
    rx_gtxreset     => fmc_Si5324_LOL,
    rx_cdrreset     => '0',
    rx_clr_errs     => rx3_clr_errs,
    rxusrclk_out    => rx3_usrclk,
    rx_mode         => rx3_mode,
    rx_mode_locked  => rx3_mode_locked,
    rx_locked       => rx3_locked,
    rx_format       => rx3_format,
    rx_level_b      => rx3_level_b,
    rx_m            => rx3_m,
    rx_ce           => rx3_ce,
    rx_dout_rdy_3G  => rx3_dout_rdy_3G,
    rx_ln_a         => rx3_ln_a,
    rx_ln_b         => open,
    rx_a_vpid       => rx3_a_vpid,
    rx_a_vpid_valid => rx3_a_vpid_valid,
    rx_b_vpid       => open,
    rx_b_vpid_valid => open,
    rx_crc_err      => rx3_crc_err,
    rx_ds1_a        => rx3_ds1_a,
    rx_ds2_a        => rx3_ds2_a,
    rx_ds1_b        => rx3_ds1_b,
    rx_ds2_b        => rx3_ds2_b,
    rx_eav          => rx3_eav,
    rx_sav          => rx3_sav,
    rx_sd_hsync     => open,
    rxpll_locked    => rx3_pll_locked,
    rx_err_count    => rx3_err_count,
    raw_rx_crc_err  => open);

--------------------------------------------------------------------------------
-- HD-SDI RX/TX #4
--
SDI4 : v6_sdi_rxtx
port map (
    mgtclk0         => mgtclk_148_5,
    mgtclk1         => mgtclk_148_35,
    drpclk          => drpclk,
    
    tx_gtxreset     => tx_gtxreset,
    tx_reset        => '0',
    tx_m            => tx4_M,
    postemphasis    => tx4_postemphasis,
    txusrclk_out    => tx4_usrclk,
    tx_format       => tx4_vio_sync_out(2 downto 0),
    tx_pattern      => tx4_vio_sync_out(4 downto 3),
    tx_mode         => tx4_mode,
    txp             => FMC_HPC_DP3_C2M_P,
    txn             => FMC_HPC_DP3_C2M_N,
    txpll_locked    => dp3_tx_pll_locked,
    
    rxp             => FMC_HPC_DP3_M2C_P,
    rxn             => FMC_HPC_DP3_M2C_N,
    rx_gtxreset     => fmc_Si5324_LOL,
    rx_cdrreset     => '0',
    rx_clr_errs     => rx4_clr_errs,
    rxusrclk_out    => rx4_usrclk,
    rx_mode         => rx4_mode,
    rx_mode_locked  => rx4_mode_locked,
    rx_locked       => rx4_locked,
    rx_format       => rx4_format,
    rx_level_b      => rx4_level_b,
    rx_m            => rx4_m,
    rx_ce           => rx4_ce,
    rx_dout_rdy_3G  => rx4_dout_rdy_3G,
    rx_ln_a         => rx4_ln_a,
    rx_ln_b         => open,
    rx_a_vpid       => rx4_a_vpid,
    rx_a_vpid_valid => rx4_a_vpid_valid,
    rx_b_vpid       => open,
    rx_b_vpid_valid => open,
    rx_crc_err      => rx4_crc_err,
    rx_ds1_a        => rx4_ds1_a,
    rx_ds2_a        => rx4_ds2_a,
    rx_ds1_b        => rx4_ds1_b,
    rx_ds2_b        => rx4_ds2_b,
    rx_eav          => rx4_eav,
    rx_sav          => rx4_sav,
    rx_sd_hsync     => open,
    rxpll_locked    => rx4_pll_locked,
    rx_err_count    => rx4_err_count,
    raw_rx_crc_err  => open);


--------------------------------------------------------------------------------
-- AVB FMC card interface
--

--
-- Main AVB FMC card control module
--
AVBFMC : main_avb_control
port map (
    clk                 => clk_fmc_27M,
    rst                 => '0',

-- SPI interface to AVB FMC card
    sck                 => FMC_HPC_LA00_CC_P,
    mosi                => FMC_HPC_LA00_CC_N,
    miso                => FMC_HPC_LA27_P,
    ss                  => FMC_HPC_LA14_N,

-- General status signals
    fpga_rev            => fmc_fpga_rev,
    exp_brd_prsnt       => fmc_exp_brd_prsnt,
    board_options       => open,

-- Clock XBAR control signals
--
-- For XBAR 1, each output can be driven by any of the four inputs as follows:
--      00 selects clock from Si5324
--      01 selects clock module L CLK OUT 1
--      10 selects clock module L CLK OUT 2
--      11 selects OUT 0 of XBAR 3
-- 
    xbar1_out0_sel      => "00",    -- select 148.5 MHz ref clock from main Si5324
    xbar1_out1_sel      => "01",    -- select 148.35 MHz ref clock from CM L out 1
    xbar1_out2_sel      => "00",    -- not used
    xbar1_out3_sel      => "00",    -- not used

--
-- For XBAR 2, each output can be driven by any of the four inuts as follows:
--      00 selects OUT 3 of XBAR 3
--      01 selects clock module H CLK OUT 1
--      10 selects clock module H CLK OUT 2
--      11 selects clock module H CLK OUT 3
--
    xbar2_out0_sel      => "00",    -- not used
    xbar2_out1_sel      => "00",    -- not used
    xbar2_out2_sel      => "00",    -- not used
    xbar2_out3_sel      => "00",    -- not used

--
-- For XBAR 3, each output can be driven by any of the four inputs as follows:
--      00 selects FMC HA19
--      01 selects FMC LA22
--      10 selects FMC DP0 (LPC compatible MGT)
--      11 selects FMC DP1 (HPC compatible MGT)
--
    xbar3_out0_sel      => "00",    -- This output drives XBAR #1 IN3
    xbar3_out1_sel      => "10",    -- This output drives the TX1 cable driver
    xbar3_out2_sel      => "11",    -- This output drives the TX2 cable driver
    xbar3_out3_sel      => "01",    -- This output drives XBAR #2 IN0

-- Si5324 Status & Control
--
-- The Si5324_clkin_sel port controls the clock input selection for the Si5324.
-- There are three possible clock sources: 27 MHz XO, FPGA signal, and the HSYNC
-- signal from the clock separator. If the HSYNC signal is chosen, the device can be
-- put into auto frequency select mode where the controller automatically determines
-- the external HSYNC frequency and selects the proper frequency synthesis
-- settings to produce 27 MHz out of the Si5324. If Si5324_clkin_sel is anything
-- other than 01 (auto HSYNC mode), the frequency synthesis of the Si5324 is
-- controlled by the Si5324_in_fsel and Si5324_out_fsel ports as follows:
--
--      Si5324_in_fsel[4:0] select the input frequency:
--          0x00: 480i (NTSC) HSYNC
--          0x01: 480p HSYNC
--          0x02: 576i (PAL) HSYNC
--          0x03: 576p HSYNC
--          0x04: 720p 24 Hz HSYNC
--          0x05: 720p 23.98 Hz HSYNC
--          0x06: 720p 25 Hz HSYNC
--          0x07: 720p 30 Hz HSYNC
--          0x08: 720p 29.97 Hz HSYNC
--          0x09: 720p 50 Hz HSYNC
--          0x0A: 720p 60 Hz HSYNC
--          0x0B: 720p 59.94 Hz HSYNC
--          0x0C: 1080i 50 Hz HSYNC
--          0x0D: 1080i 60 Hz HSYNC
--          0x0E: 1080i 59.94 Hz HSYNC
--          0x0F: 1080p 24 Hz HSYNC
--          0x10: 1080p 23.98 Hz HSYNC
--          0x11: 1080p 25 Hz HSYNC
--          0x12: 1080p 30 Hz HSYNC
--          0x13: 1080p 29.97 Hz HSYNC
--          0x14: 1080p 50 Hz HSYNC
--          0x15: 1080p 60 Hz HSYNC
--          0x16: 1080p 59.94 Hz HSYNC
--          0x17: 27 MHz
--          0x18: 74.25 MHz
--          0x19: 74.25/1.001 MHz
--          0x1A: 148.5 MHz
--          0x1B: 148.5/1.001 MHz
--
--      Si5324_out_fsel[3:0] select the output frequency (MSB not used):
--          0: 27 MHz
--          1: 74.25 MHz
--          2: 74.25/1.001 MHz
--          3: 148.5 MHz
--          4: 148.5/1.001 MHz
--          5: 24.576 MHz
--
-- Note that any HSYNC frequency can only be converted to 27 MHz. Choosing any
-- output frequency except 27 MHz when the input selection is 0x00 through 0x16
-- will result in an error. Any input frequency selected by 0x17 through 0x1B
-- can be converted to any output frequency, with the exception that the
-- 74.25/1.001 and 148.5/1.001 MHz input frequencies can't be converted to 
-- 24.576 MHz.
--
-- For custom frequency synthesis, use the Si5324 register peek/poke facility
-- to modify individual registers on a custom basis.
--
    Si5324_reset        => '0',             -- 1 resets Si5324
    Si5324_clkin_sel    => "00",            -- Control input clock source selection for Si5324
                                            -- 00=27 MHz, 01=sync sep HSYNC (auto fsel mode)
                                            -- 10=FMC LA29, 11=sync sep HSYNC (manual fsel mode)
    Si5324_out_fsel     => "0011",          -- selects the output frequency
    Si5324_in_fsel      => "10111",         -- selects the input frequency
    Si5324_bw_sel       => "1010",          -- Set for 6 Hz bandwidth
    Si5324_DHOLD        => '0',
    Si5324_FOS2         => open,            -- 1=frequency offset alarm for CKIN2
    Si5324_FOS1         => open,            -- 1=frequency offset alram for CKIN1
    Si5324_LOL          => fmc_Si5324_LOL,  -- 0=PLL locked, 1=PLL unlocked

-- Si5324 register peek/poke control
    Si5324_reg_adr      => X"00",           -- Si5324 peek/poke register address (8-bit)
    Si5324_reg_wr_dat   => X"00",           -- Si5324 peek/poke register write data (8-bi)
    Si5324_reg_rd_dat   => open,            -- Si5324 peek/poke register read data (8-bit)
    Si5324_reg_wr       => '0',             -- Si5324 poke request, assert High for one clk
    Si5324_reg_rd       => '0',             -- Si5324 peek request, assert High for one clk
    Si5324_reg_rdy      => open,            -- Si5324 peek/poke cycle done when 1
    Si5324_error        => open,            -- Si5324 peek/poke error when 1 (transfer was NACKed on I2C bus)

--
-- These ports are associated with the LMH1981 sync separator.  Note that the
-- actual sync signals are available directly to the FPGA via FMC signals. The
-- sync_video_frame value is a count of the number of lines in a field or frame
-- as captured directly by the LMH1981. The sync_m and sync_frame_rate indicate
-- the frame rate of the video signal as shown below. 
--
--      sync_frame_rate     Frame Rate      sync_m
--              000         23.98 Hz            1
--              001         24 Hz               0
--              010         25 Hz               0
--              011         29.97 Hz            1
--              100         30 Hz               0
--              101         50 Hz               0
--              110         59.94 Hz            1
--              111         60 Hz               0
--
    sync_video_fmt      => fmc_sync_format,  -- count of lines per field/frame (11-bit)
    sync_updating       => open,             -- sync_video_frame only valid when this port is 0
    sync_frame_rate     => fmc_sync_rate,    -- frame rate indicator (3-bit)
    sync_m              => fmc_sync_m,       -- 1 = frame rate is 1000/1001
    sync_err            => fmc_sync_err,     -- 1 = error detected frame rate

--
-- LED control ports
--

-- The eight two-color LEDs associated with the SDI RX connectors are controlled
-- by 2 bits each as follows:
--      00 = off
--      01 = green
--      10 = red
--      11 = controlled by cable EQ CD signal (green when carrier detected, else red)
--
    sdi_rx1_led         => "11",            -- controls the SDI RX1 LED
    sdi_rx2_led         => "11",            -- controls the SDI RX2 LED
    sdi_rx3_led         => "11",            -- controls the SDI RX3 LED
    sdi_rx4_led         => "11",            -- controls the SDI RX4 LED
    sdi_rx5_led         => "00",            -- controls the SDI RX5 LED
    sdi_rx6_led         => "00",            -- controls the SDI RX6 LED
    sdi_rx7_led         => "00",            -- controls the SDI RX7 LED
    sdi_rx8_led         => "00",            -- controls the SDI RX8 LED

-- All other LEDs have separate 2-bit control ports for both the red and green LEDs
-- so that the red and green sides of the LED are independently controlled like this:
--      00 = off
--      01 = on
--      10 = flash slowly
--      11 = flash quickly
--
    sdi_tx1_red_led     => fmc_tx1_red_led, -- controls the SDI TX1 red LED
    sdi_tx1_grn_led     => fmc_tx1_grn_led, -- controls the SDI TX1 green LED
    sdi_tx2_red_led     => fmc_tx2_red_led, -- controls the SDI TX2 red LED
    sdi_tx2_grn_led     => fmc_tx2_grn_led, -- controls the SDI TX2 green LED
    sdi_tx3_red_led     => fmc_tx3_red_led, -- controls the SDI TX3 red LED
    sdi_tx3_grn_led     => fmc_tx3_grn_led, -- controls the SDI TX3 green LED
    sdi_tx4_red_led     => fmc_tx4_red_led, -- controls the SDI TX4 red LED
    sdi_tx4_grn_led     => fmc_tx4_grn_led, -- controls the SDI TX4 green LED
    sdi_tx5_red_led     => "00",            -- controls the SDI TX5 red LED
    sdi_tx5_grn_led     => "00",            -- controls the SDI TX5 green LED
    sdi_tx6_red_led     => "00",            -- controls the SDI TX6 red LED
    sdi_tx6_grn_led     => "00",            -- controls the SDI TX6 green LED
    sdi_tx7_red_led     => "00",            -- controls the SDI TX7 red LED
    sdi_tx7_grn_led     => "00",            -- controls the SDI TX7 green LED
    sdi_tx8_red_led     => "00",            -- controls the SDI TX8 red LED
    sdi_tx8_grn_led     => "00",            -- controls the SDI TX8 green LED

    aes_rx1_red_led     => "00",            -- controls the AES3 RX1 red LED
    aes_rx1_grn_led     => "00",            -- controls the AES3 RX1 green LED
    aes_rx2_red_led     => "00",            -- controls the AES3 RX2 red LED
    aes_rx2_grn_led     => "00",            -- controls the AES3 RX2 green LED
    aes_tx1_red_led     => "00",            -- controls the AES3 TX1 red LED
    aes_tx1_grn_led     => "00",            -- controls the AES3 TX1 green LED
    aes_tx2_red_led     => "00",            -- controls the AES3 TX2 red LED
    aes_tx2_grn_led     => "00",            -- controls the AES3 TX2 green LED
    madi_rx_red_led     => "00",            -- controls the MADI RX red LED
    madi_rx_grn_led     => "00",            -- controls the MADI RX green LED
    madi_tx_red_led     => "00",            -- controls the MADI TX red LED
    madi_tx_grn_led     => "00",            -- controls the MADI TX green LED
    sync_red_led        => "00",            -- controls the external sync red LED
    sync_grn_led        => "00",            -- controls the external sync green LED
    
-- SDI Cable EQ control & status
--
-- In the first two ports, there is one bit for each possible cable EQ device with
-- bit 0 for SDI RX1 and bit 7 for SDI RX8.
--
    sdi_eq_cd_n         => fmc_sdi_eq_cd_n, -- carrier detects from cable drivers, asserted low
    sdi_eq_ext_3G_reach => "00000000",      -- Enable bits for extended 3G reach mode, 1=enable, 0=disable
    sdi_eq_select       => "000",           -- selects which EQ's status signals drive port below
    sdi_eq_cli          => fmc_sdi_eq_cli,  -- cable length indicator

-- SDI Cable Driver control & status
--
-- For these ports, there is one bit for each possible cable driver device with
-- bit 0 for SDI TX1 and bit 7 for SDI TX8.
--
    sdi_drv_hd_sd       => fmc_sdi_drv_hd_sd,   -- Sets slew rate of each cable driver, 1=SD, 0=HD/3G
    sdi_drv_enable      => fmc_sdi_drv_enable,  -- 1 enables the driver, 0 powers driver down
    sdi_drv_fault_n     => fmc_sdi_drv_fault_n);-- 1 = normal operation, 0 = fault

tx1_hdsd <= '1' when tx1_mode = "01" else '0';
tx2_hdsd <= '1' when tx2_mode = "01" else '0';
tx3_hdsd <= '1' when tx3_mode = "01" else '0';
tx4_hdsd <= '1' when tx4_mode = "01" else '0';

fmc_sdi_drv_hd_sd <= ("0000" & tx4_hdsd & tx3_hdsd & tx2_hdsd & tx1_hdsd);
fmc_sdi_drv_enable <= X"0F";

-- Transmitter LEDs
fmc_tx1_grn_led <= (not fmc_sdi_drv_fault_n(0) & fmc_sdi_drv_fault_n(0)) when dp0_tx_pll_locked = '1' else "00";
fmc_tx1_red_led <= "00" when dp0_tx_pll_locked = '1' else "01";

fmc_tx2_grn_led <= (not fmc_sdi_drv_fault_n(1) & fmc_sdi_drv_fault_n(1)) when dp1_tx_pll_locked = '1' else "00";
fmc_tx2_red_led <= "00" when dp1_tx_pll_locked = '1' else "01";

fmc_tx3_grn_led <= (not fmc_sdi_drv_fault_n(2) & fmc_sdi_drv_fault_n(2)) when dp2_tx_pll_locked = '1' else "00";
fmc_tx3_red_led <= "00" when dp2_tx_pll_locked = '1' else "01";

fmc_tx4_grn_led <= (not fmc_sdi_drv_fault_n(3) & fmc_sdi_drv_fault_n(3)) when dp3_tx_pll_locked = '1' else "00";
fmc_tx4_red_led <= "00" when dp3_tx_pll_locked = '1' else "01";

--------------------------------------------------------------------------------
-- LCD Control Module
--
LCD : lcd_control3
generic map (
    ROM_FILE_NAME           => "v6sdi_4rx4tx_demo_name.txt",
    MIN_FMC_FPGA_REVISION   => 8,
    REQUIRED_CML_TYPE       => 1,   -- Si5324 clock module required in CM L
    REQUIRED_CMH_TYPE       => 0)   -- no clock module required in CM H
port map (
    clk                     => drpclk,
    rst                     => '0',
    sw_c                    => GPIO_SW_C,
    sw_w                    => GPIO_SW_W,
    sw_e                    => GPIO_SW_E,
    sw_n                    => GPIO_SW_N,
    sw_s                    => GPIO_SW_S,
    fpga_rev                => fmc_fpga_rev,
    cml_type                => cml_type,
    cml_type_valid          => cml_type_valid,
    cml_type_error          => cml_type_error,
    cmh_type                => X"0000",
    cmh_type_valid          => '0',
    cmh_type_error          => '0',
    active_rx               => "1111",  -- All 4 receivers are active
    rx1_locked              => rx1_locked,
    rx1_mode                => rx1_mode,
    rx1_level               => rx1_level_b,
    rx1_t_format            => rx1_format,
    rx1_m                   => rx1_m,
    rx2_locked              => rx2_locked,
    rx2_mode                => rx2_mode,
    rx2_level               => rx2_level_b,
    rx2_t_format            => rx2_format,
    rx2_m                   => rx2_m,
    rx3_locked              => rx3_locked,
    rx3_mode                => rx3_mode,
    rx3_level               => rx3_level_b,
    rx3_t_format            => rx3_format,
    rx3_m                   => rx3_m,
    rx4_locked              => rx4_locked,
    rx4_mode                => rx4_mode,
    rx4_level               => rx4_level_b,
    rx4_t_format            => rx4_format,
    rx4_m                   => rx4_m,
    sync_active             => '0',
    sync_enable             => '0',
    sync_v                  => '0',
    sync_err                => '0',
    sync_m                  => '0',
    sync_frame_rate         => "000",
    sync_video_fmt          => "00000000000",
    lcd_e                   => LCD_E,
    lcd_rw                  => LCD_RW,
    lcd_rs                  => LCD_RS,
    lcd_d                   => LCD_D);

LCD_DB4 <= lcd_d(0);
LCD_DB5 <= lcd_d(1);
LCD_DB6 <= lcd_d(2);
LCD_DB7 <= lcd_d(3);

--------------------------------------------------------------------------------
-- Clock Module L interface
--
CMLCTRL : cm_avb_control
port map (
    clk                 => clk_fmc_27M,
    rst                 => '0',
    ga                  => '0',
    
-- SPI signals
    sck                 => FMC_HPC_LA29_P,
    mosi                => FMC_HPC_LA07_P,
    miso                => FMC_HPC_LA29_N,
    ss                  => FMC_HPC_LA07_N,

-- Module identification
    module_type         => cml_type,
    module_rev          => open,
    module_type_valid   => cml_type_valid,
    module_type_error   => cml_type_error,

-- General control
    clkin5_src_sel      => '0',         -- Clock module CLKIN 5 source
                                        -- 0 = 27 MHz, 1 = from FMC connector
-- GPIO direction signals
-- These control the direction of signals between the FPGA on the AVB FMC card
-- and the clock module. A value of 0 indicates an FPGA output to the clock
-- module. A value of 1 indicates an input to the FPGA from the clock module.
    gpio_dir_0          => X"00",
    gpio_dir_1          => X"00",
    gpio_dir_2          => X"A4",        -- 23, 21, & 18 are inputs from Si5324 Clock Module

-- General purpose output values
-- These control the of the GPIO signals when they are outputs from the FPGA
-- on the AVB FMC card to the clock module.
    gp_out_value_0      => X"00",
    gp_out_value_1      => X"00",
    gp_out_value_2      => X"00",

-- General purpose input values
-- The ports reflect the values of the GPIO signals when they are inputs to the
-- FPGA on the AVB FMC card from the clock clock module.
    gp_in_value_0       => open,
    gp_in_value_1       => open,
    gp_in_value_2       => open,
    gp_in               => open,

-- I2C bus register peek/poke control
-- These ports provide peek/poke capability to devices connected to the
-- I2C bus on the clock module. To write a value to a device register, set the
-- the slave address, register address, and data to be written and then pulse
-- i2c_reg_wr high for one cycle of the 27 MHz clock. The i2c_reg_rdy signal
-- will go low on the rising edge of the clock when i2c_reg_wr is high and
-- will stay low until the write is completed. To read a register, setup the
-- slave address and register address then pulse i2c_reg_rd high for one cycle
-- of the clock. Again, i2c_reg_rdy will go low until the read cycle is completed.
-- When i2c_reg_rdy goes high, the data read from the register will be present
-- on i2c_reg_dat_rd.
    i2c_slave_adr       => X"00",
    i2c_reg_adr         => X"00",
    i2c_reg_dat_wr      => X"00",
    i2c_reg_wr          => '0',
    i2c_reg_rd          => '0',
    i2c_reg_dat_rd      => open,
    i2c_reg_rdy         => open,
    i2c_reg_error       => open,

-- Si5324 module signals
--
-- These ports are only valid if the Si5324 clock module is installed on the
-- AVB FMC card. There are 3 identical sets of ports, one set for each of the
-- three Si5324 parts on the clock module. The out_fsel and in_fsel ports
-- set the predefined frequency synthesis options as follows:
--
--      Si5324_X_in_fsel[4:0] select the input frequency:
--          0x00: 480i (NTSC) HSYNC
--          0x01: 480p HSYNC
--          0x02: 576i (PAL) HSYNC
--          0x03: 576p HSYNC
--          0x04: 720p 24 Hz HSYNC
--          0x05: 720p 23.98 Hz HSYNC
--          0x06: 720p 25 Hz HSYNC
--          0x07: 720p 30 Hz HSYNC
--          0x08: 720p 29.97 Hz HSYNC
--          0x09: 720p 50 Hz HSYNC
--          0x0A: 720p 60 Hz HSYNC
--          0x0B: 720p 59.94 Hz HSYNC
--          0x0C: 1080i 50 Hz HSYNC
--          0x0D: 1080i 60 Hz HSYNC
--          0x0E: 1080i 59.94 Hz HSYNC
--          0x0F: 1080p 24 Hz HSYNC
--          0x10: 1080p 23.98 Hz HSYNC
--          0x11: 1080p 25 Hz HSYNC
--          0x12: 1080p 30 Hz HSYNC
--          0x13: 1080p 29.97 Hz HSYNC
--          0x14: 1080p 50 Hz HSYNC
--          0x15: 1080p 60 Hz HSYNC
--          0x16: 1080p 59.94 Hz HSYNC
--          0x17: 27 MHz
--          0x18: 74.25 MHz
--          0x19: 74.25/1.001 MHz
--          0x1A: 148.5 MHz
--          0x1B: 148.5/1.001 MHz
--
--      Si5324_X_out_fsel[3:0] select the output frequency (MSB not used):
--          0x0: 27 MHz
--          0x1: 74.25 MHz
--          0x2: 74.25/1.001 MHz
--          0x3: 148.5 MHz
--          0x4: 148.5/1.001 MHz
--          0x5: 24.576 MHz
--          0x6: 148.5/1.0005 MHz
--
-- Note that any HSYNC frequency can only be converted to 27 MHz. Choosing any
-- output frequency except 27 MHz when the input selection is 0x00 through 0x16
-- will result in an error. Any input frequency selected by 0x17 through 0x1B
-- can be converted to any output frequency, with the exception that the
-- 74.25/1.001 and 148.5/1.001 MHz input frequencies can't be converted to 
-- 24.576 MHz.
--
-- Only Si5324_A is currently used in this demo. It generates a 148.35 MHz
-- reference clock for the SDI transmitters.
--
    Si5324_A_clkin_sel  => '0',         -- Select 27 MHz from FPGA (CKIN0)
    Si5324_A_out_fsel   => "0100",      -- 148.35 out
    Si5324_A_in_fsel    => "10111",     -- 27 MHz in
    Si5324_A_bw_sel     => "1000",      -- 4 Hz bandwidth
    Si5324_A_DHOLD      => '0',
    Si5324_A_FOS2       => open,
    Si5324_A_FOS1       => open,
    Si5324_A_LOL        => cml_Si5324_A_LOL,

    Si5324_B_clkin_sel  => '0',         -- select output of Si5324 as source     
    Si5324_B_out_fsel   => "0100",      -- 148.35 MHz out
    Si5324_B_in_fsel    => "11011",     -- 148.35 MHz in
    Si5324_B_bw_sel     => "1010",
    Si5324_B_DHOLD      => '0',
    Si5324_B_FOS2       => open,
    Si5324_B_FOS1       => open,
    Si5324_B_LOL        => open,

    Si5324_C_clkin_sel  => '0',         -- select CLKIN4 of clock module 
    Si5324_C_out_fsel   => "0110",      -- 148.35 MHz out 
    Si5324_C_in_fsel    => "11010",     -- 148.5 MHz in 
    Si5324_C_bw_sel     => "1010",
    Si5324_C_DHOLD      => '0',
    Si5324_C_FOS2       => open,
    Si5324_C_FOS1       => open,
    Si5324_C_LOL        => open);


-- Asserted low resets to the 3 Si5324 parts on CM L
FMC_HPC_LA13_P <= '1';
FMC_HPC_LA33_P <= '1';
FMC_HPC_LA26_P <= '1';

--------------------------------------------------------------------------------
-- ChipScope modules

i_icon : icon
port map (
    CONTROL0    => control0,
    CONTROL1    => control1,
    CONTROL2    => control2,
    CONTROL3    => control3,
    CONTROL4    => control4,
    CONTROL5    => control5,
    CONTROL6    => control6,
    CONTROL7    => control7,
    CONTROL8    => control8,
    CONTROL9    => control9,
    CONTROL10   => control10,
    CONTROL11   => control11);

tx1_vio : vio
port map (
    CONTROL     => control0,
    CLK         => tx1_usrclk,
    SYNC_OUT    => tx1_vio_sync_out,
    ASYNC_IN(1) => dp0_tx_pll_locked,
    ASYNC_IN(0) => fmc_sdi_drv_fault_n(0));

tx2_vio : vio
port map (
    CONTROL     => control1,
    CLK         => tx2_usrclk,
    SYNC_OUT    => tx2_vio_sync_out,
    ASYNC_IN(1) => dp1_tx_pll_locked,
    ASYNC_IN(0) => fmc_sdi_drv_fault_n(1));

tx3_vio : vio 
port map (
    CONTROL     => control2,
    CLK         => tx3_usrclk,
    SYNC_OUT    => tx3_vio_sync_out,
    ASYNC_IN(1) => dp2_tx_pll_locked,
    ASYNC_IN(0) => fmc_sdi_drv_fault_n(2));

tx4_vio : vio 
port map (
    CONTROL     => control3,
    CLK         => tx4_usrclk,
    SYNC_OUT    => tx4_vio_sync_out,
    ASYNC_IN(1) => dp3_tx_pll_locked,
    ASYNC_IN(0) => fmc_sdi_drv_fault_n(3));


rx1_vio : rx_vio 
port map (
    CONTROL     => control4,
    CLK         => rx1_usrclk,
    SYNC_OUT    => rx1_vio_sync_out,
    ASYNC_IN    => rx1_vio_async_in,
    ASYNC_OUT   => rx1_vio_async_out);

rx1_clr_errs <= rx1_vio_sync_out(0);

rx1_vio_async_in <= (rx1_err_count & rx1_pll_locked & rx1_crc_err & rx1_a_vpid_valid
                     & rx1_a_vpid(7 downto 0) & rx1_a_vpid(15 downto 8) 
                     & rx1_a_vpid(23 downto 16) & rx1_a_vpid(31 downto 24) & rx1_m 
                     & rx1_level_b & rx1_format & rx1_mode_locked & rx1_mode);

rx1_ila : ila
port map (
    CONTROL     => control5,
    CLK         => rx1_usrclk,
    TRIG0       => rx1_trig0);

rx1_trig0 <= (rx1_sav & rx1_eav & rx1_ds2_b & rx1_ds1_b & rx1_ds2_a & rx1_ds1_a & 
              rx1_ln_a & rx1_dout_rdy_3G & rx1_ce);

rx2_vio : rx_vio
port map (
    CONTROL     => control6,
    CLK         => rx2_usrclk,
    SYNC_OUT    => rx2_vio_sync_out,
    ASYNC_IN    => rx2_vio_async_in,
    ASYNC_OUT   => rx2_vio_async_out);

rx2_clr_errs <= rx2_vio_sync_out(0);

rx2_vio_async_in <= (rx2_err_count & rx2_pll_locked & rx2_crc_err & rx2_a_vpid_valid 
                     & rx2_a_vpid(7 downto 0) & rx2_a_vpid(15 downto 8) 
                     & rx2_a_vpid(23 downto 16) & rx2_a_vpid(31 downto 24) 
                     & rx2_m & rx2_level_b & rx2_format & rx2_mode_locked & rx2_mode);

rx2_ila : ila 
port map (
    CONTROL     => control7,
    CLK         => rx2_usrclk,
    TRIG0       => rx2_trig0);

rx2_trig0 <= (rx2_sav & rx2_eav & rx2_ds2_b & rx2_ds1_b & rx2_ds2_a & rx2_ds1_a & 
              rx2_ln_a & rx2_dout_rdy_3G & rx2_ce);


rx3_vio : rx_vio
port map (
    CONTROL     => control8,
    CLK         => rx3_usrclk,
    SYNC_OUT    => rx3_vio_sync_out,
    ASYNC_IN    => rx3_vio_async_in,
    ASYNC_OUT   => rx3_vio_async_out);

rx3_clr_errs <= rx3_vio_sync_out(0);

rx3_vio_async_in <= (rx3_err_count & rx3_pll_locked & rx3_crc_err 
                     & rx3_a_vpid_valid & rx3_a_vpid(7 downto 0) 
                     & rx3_a_vpid(15 downto 8) & rx3_a_vpid(23 downto 16) 
                     & rx3_a_vpid(31 downto 24) & rx3_m & rx3_level_b 
                     & rx3_format & rx3_mode_locked & rx3_mode);

rx3_ila : ila
port map (
    CONTROL     => control9,
    CLK         => rx3_usrclk,
    TRIG0       => rx3_trig0);

rx3_trig0 <= (rx3_sav & rx3_eav & rx3_ds2_b & rx3_ds1_b & rx3_ds2_a & rx3_ds1_a & 
              rx3_ln_a & rx3_dout_rdy_3G & rx3_ce);


rx4_vio : rx_vio 
port map (
    CONTROL     => control10,
    CLK         => rx4_usrclk,
    SYNC_OUT    => rx4_vio_sync_out,
    ASYNC_IN    => rx4_vio_async_in,
    ASYNC_OUT   => rx4_vio_async_out);

rx4_clr_errs <= rx4_vio_sync_out(0);

rx4_vio_async_in <= (rx4_err_count & rx4_pll_locked & rx4_crc_err 
                     & rx4_a_vpid_valid & rx4_a_vpid(7 downto 0) 
                     & rx4_a_vpid(15 downto 8) & rx4_a_vpid(23 downto 16) 
                     & rx4_a_vpid(31 downto 24) & rx4_m & rx4_level_b 
                     & rx4_format & rx4_mode_locked & rx4_mode);

rx4_ila : ila 
port map (
    CONTROL    => control11,
    CLK        => rx4_usrclk,
    TRIG0      => rx4_trig0);

rx4_trig0 <= (rx4_sav & rx4_eav & rx4_ds2_b & rx4_ds1_b & rx4_ds2_a & rx4_ds1_a & 
              rx4_ln_a & rx4_dout_rdy_3G & rx4_ce);

tx1_M <= tx1_vio_sync_out(5);
tx2_M <= tx2_vio_sync_out(5);
tx3_M <= tx3_vio_sync_out(5);
tx4_M <= tx4_vio_sync_out(5);

tx1_mode <= tx1_vio_sync_out(7 downto 6);
tx2_mode <= tx2_vio_sync_out(7 downto 6);
tx3_mode <= tx3_vio_sync_out(7 downto 6);
tx4_mode <= tx4_vio_sync_out(7 downto 6);

end xilinx;
    
