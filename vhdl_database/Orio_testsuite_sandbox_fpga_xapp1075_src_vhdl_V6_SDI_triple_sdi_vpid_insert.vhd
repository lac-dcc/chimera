-------------------------------------------------------------------------------- 
-- Copyright (c) 2008 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: triple_sdi_vpid_insert.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2008-07-31 14:17:35-06 $
-- /___/   /\    Date Created: May 20, 2008
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: triple_sdi_vpid_insert.vhd,rcs $
-- Revision 1.1  2008-07-31 14:17:35-06  jsnow
-- Comment changes only.
--
-- Revision 1.0  2008-06-12 15:38:00-06  jsnow
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
--
-- Module Description:
-- 
-- This module inserts SMPTE 352M video payload ID packets into SD-SDI, HD-SDI, 
-- or 3G-SDI data streams.
-- 
-- For SD-SDI, it accepts one 10-bit multiplexed Y/C data stream. The clock rate
-- must be 297 MHz and ce must be asserted 1 out of 11 clock cycles for a 27 MHz
-- data rate. The din_rdy input must be High always.
-- 
-- For HD-SDI, it accepts two 10-bit data streams, Y and C,. The clock rate is
-- 148.5 MHz and ce must be asserted every other clock cycle for an input data
-- rate of 74.25 MHz. The din_rdy input must be High always.
-- 
-- For 3G-SDI level A, it accepts two 10-bit data streams. These can either be
-- the Y and C channels of 1080p 50 or 60 Hz video, or they can be pre-formatted
-- 3G-SDI level A data streams. The clock frequency is 297 MHz and ce must be
-- asserted every other clock cycle for an input data rate of 148.5 MHz. The
-- din_rdy input must be High always.
-- 
-- For 33G-SDI level B, it accepts four 10-bit data streams. These can either be
-- a SMPTE 372M dual link pair or they can be two independent, but synchronized,
-- HD-SDI signals. The clock frequency is 297 MHz, ce runs at 148.5 MHz, and
-- din_rdy is asserted one out of four clock cycles for an input data rate of
-- 74.25 MHz. Input data is only accepted when din_rdy and ce are both High.
-- Because din_rdy is also used to mux the four data streams down to two data
-- streams on the output of the module, it must have a 50% duty cycle -- High 
-- for two clock cycles and low for two clock cycles.
--
-------------------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.hdsdi_pkg.all;

entity triple_sdi_vpid_insert is
port (
    clk:            in  std_logic;                      -- clock input
    ce:             in  std_logic;                      -- clock enable
    din_rdy:        in  std_logic;                      -- data input ready for level B,
                                                        -- .. must be 1 in all other modes
    rst:            in  std_logic;                      -- async reset input
    sdi_mode:       in  std_logic_vector(1 downto 0);   -- data path mode: 00=HD, 01=SD, 10=3G
    level:          in  std_logic;                      -- 0=A, 1=B
    enable:         in  std_logic;                      -- 0 = disable insertion
    overwrite:      in  std_logic;                      -- 1 = overwrite existing VPID packets
    byte1:          in  std_logic_vector(7 downto 0);   -- VPID byte 1
    byte2:          in  std_logic_vector(7 downto 0);   -- VPID byte 2
    byte3:          in  std_logic_vector(7 downto 0);   -- VPID byte 3
    byte4a:         in  std_logic_vector(7 downto 0);   -- VPID byte 4 for link A
    byte4b:         in  std_logic_vector(7 downto 0);   -- VPID byte 4 for link B
    ln_a:           in  std_logic_vector(10 downto 0);  -- current line number for link A
    ln_b:           in  std_logic_vector(10 downto 0);  -- current line number for link B
    line_f1:        in  std_logic_vector(10 downto 0);  -- VPID line for field 1
    line_f2:        in  std_logic_vector(10 downto 0);  -- VPID line for field 2
    line_f2_en:     in  std_logic;                      -- enable VPID insertion on line_f2
    a_y_in:         in  std_logic_vector(9 downto 0);   -- SD in, HD & 3GA Y in 3GB A Y in
    a_c_in:         in  std_logic_vector(9 downto 0);   -- HD & 3GA C in, 3GB A C in
    b_y_in:         in  std_logic_vector(9 downto 0);   -- 3GB only, B Y in
    b_c_in:         in  std_logic_vector(9 downto 0);   -- 3GB only, B Y in
    ds1a_out:       out std_logic_vector(9 downto 0);   -- data stream 1, link A out
    ds2a_out:       out std_logic_vector(9 downto 0);   -- data stream 2, link A out
    ds1b_out:       out std_logic_vector(9 downto 0);   -- data stream 1, link B out
    ds2b_out:       out std_logic_vector(9 downto 0);   -- data stream 2, link B out
    eav_out:        out std_logic;                      -- asserted on XYZ word of EAV
    sav_out:        out std_logic;                      -- asserted on XYZ word of SAV
    out_mode:       out std_logic_vector(1 downto 0)    -- connect to mode port of the
);                                                      -- .. triple_sdi_tx_output module
end triple_sdi_vpid_insert;

architecture xilinx of triple_sdi_vpid_insert is

signal ds2_in :         xavb_data_stream_type;
signal ds1_c :          xavb_data_stream_type;
signal ds2_y :          xavb_data_stream_type;
signal ds2_ln :         xavb_hd_line_num_type;
signal sdi_mode_reg :   std_logic_vector(1 downto 0) := "00";
signal mode_SD :        std_logic;
signal mode_3G_A :      std_logic;
signal mode_3G_B :      std_logic;
signal level_reg :      std_logic := '0';
signal vpid_ins_ce :    std_logic;

begin

--
-- Register timing critical signals
--
process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            sdi_mode_reg <= sdi_mode;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            level_reg <= level;
        end if;
    end if;
end process;

mode_SD <= '1' when sdi_mode_reg = "01" else '0';
mode_3G_A <= '1' when sdi_mode_reg = "10" and level_reg = '0' else '0';
mode_3G_B <= '1' when sdi_mode_reg = "10" and level_reg = '1' else '0';

--
-- Insert VPID packets on both data streams
--
-- The SMPTE352_vpid_insert module only inserts VPID packets into the Y data
-- stream, so two of them are used to insert packets into each data stream.
--
vpid_ins_ce <= ce and din_rdy;

VPIDINS1 : entity work.SMPTE352_vpid_insert
    port map (
        clk            => clk,
        ce             => vpid_ins_ce,
        rst            => rst,
        hd_sd          => mode_SD,
        level_b        => level_reg,
        enable         => enable,
        overwrite      => overwrite,
        line           => ln_a,
        line_a         => line_f1,
        line_b         => line_f2,
        line_b_en      => line_f2_en,
        byte1          => byte1,
        byte2          => byte2,
        byte3          => byte3,
        byte4          => byte4a,
        y_in           => a_y_in,
        c_in           => a_c_in,
        y_out          => ds1a_out,
        c_out          => ds1_c,
        eav_out        => eav_out,
        sav_out        => sav_out);

ds2_in <= a_c_in when mode_3G_A = '1' else b_y_in;
ds2_ln <= ln_b when mode_3G_B = '1' else ln_a;

VPIDINS2 : entity work.SMPTE352_vpid_insert
    port map (
        clk            => clk,
        ce             => vpid_ins_ce,
        rst            => rst,
        hd_sd          => mode_SD,
        level_b        => level_reg,
        enable         => enable,
        overwrite      => overwrite,
        line           => ds2_ln,
        line_a         => line_f1,
        line_b         => line_f2,
        line_b_en      => line_f2_en,
        byte1          => byte1,
        byte2          => byte2,
        byte3          => byte3,
        byte4          => byte4b,
        y_in           => ds2_in,
        c_in           => b_c_in,
        y_out          => ds2_y,
        c_out          => ds2b_out,
        eav_out        => open,
        sav_out        => open);

--
-- Output muxes
--
ds2a_out <= ds2_y when mode_3G_A = '1' else ds1_c;
ds1b_out <= ds2_y;

out_mode <= "01" when mode_SD = '1' else
            "10" when mode_3G_B = '1' else
            "00";

end;
