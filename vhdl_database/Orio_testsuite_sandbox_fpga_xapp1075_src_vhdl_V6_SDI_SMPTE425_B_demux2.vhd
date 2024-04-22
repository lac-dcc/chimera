-------------------------------------------------------------------------------- 
-- Copyright (c) 2008 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: SMPTE425_B_demux2.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2008-06-02 13:37:29-06 $
-- /___/   /\    Date Created: May 21, 2008
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: SMPTE425_B_demux2.vhd,rcs $
-- Revision 1.1  2008-06-02 13:37:29-06  jsnow
-- Minor changes to clock enables.
--
-- Revision 1.0  2008-05-30 16:12:56-06  jsnow
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
-- This is the SMPTE 425M 3G-SDI receiver demux for level B only. This
-- module takes two 10-bit streams at 148.5 MHz and converts them into two
-- streams each with two 10-bit components (Y and C) at 74.25 MHz. Typically,
-- the two 10-bit input streams to this module come directly from the C (ds1) 
-- and Y (ds2) outputs of a hdsdi_framer module.
-- 
-- The module also generates correct timing signals for the video including
-- TRS, XYZ, EAV, and SAV signals and line number information captured from the
-- data stream.
-- 
-- The module also creates an output clock enable signal, dout_rdy, that is
-- asserted when valid data is present on the outputs. If the input clock rate
-- is 148.5 MHz (with ce asserted high always), the dout_rdy will be asserted
-- every other clock cycle with a 50% duty cycle. If the input clock rate is
-- 297 MHz (with ce asserted every other clock cycle), then dout_rdy will be
-- asserted one cycle out of every four with a 25% duty cycle.
-- 
-- Note: If ce input is used (not wired to 1), then dout_rdy will be asserted 
-- for multiple clock cycles and will only change when the ce input is 1. Thus,
-- downstream devices should not treat dout_rdy as a clock enable, but as a
-- data ready signal that must be qualified with the clock enable.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.hdsdi_pkg.all;

entity SMPTE425_B_demux2 is
port (
    clk :           in  std_logic;                                  -- 148.5 MHz or integer multiple
    ce :            in  std_logic;                                  -- 148.5 MHz clock enable
    drdy_in :       in  std_logic;                                  -- data ready input
    rst :           in  std_logic;                                  -- async reset
    ds1 :           in  xavb_data_stream_type;                      -- connect to Y output of hdsdi_framer
    ds2 :           in  xavb_data_stream_type;                      -- connect to C output of hdsdi_framer
    trs_in :        in  std_logic;                                  -- connect to trs output of hdsdi_framer
    level_b :       out std_logic;                                  -- 1 = level B, 0 = level A
    c0 :            out xavb_data_stream_type := (others => '0');   -- channel 0 data stream C out
    y0 :            out xavb_data_stream_type;                      -- channel 0 data stream Y out
    c1 :            out xavb_data_stream_type := (others => '0');   -- channel 1 data stream C out
    y1 :            out xavb_data_stream_type;                      -- channel 1 data stream Y out
    trs :           out std_logic;                                  -- 1 during all 4 words of EAV & SAV
    eav :           out std_logic;                                  -- 1 during XYZ word of EAV
    sav :           out std_logic;                                  -- 1 during XYZ word of SAV
    xyz :           out std_logic;                                  -- 1 during XYZ word of EAV & SAV
    dout_rdy_gen :  out std_logic;                                  -- used to generate drdy_in
    line_num :      out xavb_hd_line_num_type := (others => '0'));  -- line number
end SMPTE425_B_demux2;

architecture xilinx of SMPTE425_B_demux2 is

--
-- Internal signals
--
signal c0_int :         xavb_data_stream_type := (others => '0');       -- capture reg for c0
signal y0_int :         xavb_data_stream_type := (others => '0');       -- capture reg for y0
signal c1_int :         xavb_data_stream_type := (others => '0');       -- capture reg for c1
signal y1_int :         xavb_data_stream_type := (others => '0');       -- capture reg for y1
signal trs_dly :        std_logic_vector(4 downto 0) := (others => '0');-- TRS timing delay shift reg
signal ln_ls :          std_logic_vector(6 downto 0) := (others => '0');-- LS bits of line number capture
signal trs_rise :       std_logic := '0';                               -- TRS rising edge detect
signal all_ones :       std_logic;                                      -- ds1 is all 1s
signal all_zeros :      std_logic;                                      -- ds1 is all 0s
signal zeros :          std_logic_vector(2 downto 0) := (others => '0');-- all 0s delay shift reg
signal ones :           std_logic_vector(4 downto 0) := (others => '0');-- all 1s delay shift reg
signal level_b_detect : std_logic := '0';                               -- generates the level_b output
signal trs_rise_dly :   std_logic := '0';
signal eav_dly :        std_logic_vector(1 downto 0) := (others => '0');
signal xyz_int :        std_logic;
signal eav_int :        std_logic;

begin

--
-- Clock enable logic
--
-- First detect the rising edge of the trs input signal. The dout_rdy_gen signal
-- is set to one the cycle after the rising edge of trs. 
--
process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            if trs_in = '1' and trs_dly(0) = '0' then
                trs_rise <= '1';
            else
                trs_rise <= '0';
            end if;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            trs_rise_dly <= trs_rise;
        end if;
    end if;
end process;

dout_rdy_gen <= trs_rise and not trs_rise_dly;

--
-- Capture registers
--
-- The capture registers convert the two 10-bit data streams into two 20-bit
-- data streams. The C components are captured first and stored in temporary
-- registers. The temporary C component registers and the incoming Y components
-- are then captured in the final capture registers and output from the module
-- as y0, c0, y1, and c1.
--
process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            if drdy_in = '0' then
                c0_int <= ds1;
                c1_int <= ds2;
            end if;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            if drdy_in = '1' then
                y0_int <= ds1;
                c0     <= c0_int;
                y1_int <= ds2;
                c1     <= c1_int;
            end if;
        end if;
    end if;
end process;

y0 <= y0_int;
y1 <= y1_int;

--
-- TRS timing
--
-- This logic generates the trs, xyz, eav, and sav timing signals, all derived
-- from the trs_in signal.
--
process(clk,rst)
begin
    if rst = '1' then
        trs_dly <= (others => '0');
    elsif rising_edge(clk) then
        if ce = '1' then
            if drdy_in = '1' then
                trs_dly <= (trs_dly(3 downto 0) & trs_in);
            end if;
        end if;
    end if;
end process;

trs <= trs_dly(2) or trs_dly(1) or trs_dly(0) or (trs_dly(3) and trs_dly(2));
xyz_int <= trs_dly(3) and not trs_dly(4);
xyz <= xyz_int;
eav_int <= xyz_int and y0_int(6);
eav <= eav_int;
sav <= xyz_int and not y0_int(6);

--
-- Line number capture
--
-- This logic captures the line number information that is embedded in the y0
-- data stream.
--
process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            if drdy_in = '1' then
                eav_dly <= (eav_dly(0) & eav_int);
            end if;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            if drdy_in = '1' and eav_dly(0) = '1' then
                ln_ls <= y0_int(8 downto 2);
            end if;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            if drdy_in = '1' and eav_dly(1) = '1' then
                line_num <= (y0_int(5 downto 2) & ln_ls);
            end if;
        end if;
    end if;
end process;

--
-- Level B detector
--
-- This logic determines whether the input data streams are carrying level A
-- or level B encoded data. This determination is not dependent upon SMPTE
-- 352M video payload ID packets. The determination is made by examining the
-- pattern of words with all 1's and all 0's at each TRS. The pattern is 
-- different between level A and level B.
--
all_ones  <= '1' when ds1 = "1111111111" else '0';
all_zeros <= '1' when ds1 = "0000000000" else '0';

process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            ones <= (ones(3 downto 0) & all_ones);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            zeros <= (zeros(1 downto 0) & all_zeros);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            if drdy_in = '1' then
                level_b_detect <= ones(4) and ones(3) and zeros(2) and zeros(1) and
                                  zeros(0) and all_zeros;
            end if;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if ce = '1' then
            if drdy_in = '1' and trs_dly(2) = '1' and trs_dly(1) = '1' then
                level_b <= level_b_detect;
            end if;
        end if;
    end if;
end process;

end xilinx;
