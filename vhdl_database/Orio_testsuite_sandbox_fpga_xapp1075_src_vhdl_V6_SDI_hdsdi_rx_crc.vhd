-------------------------------------------------------------------------------- 
-- Copyright (c) 2008 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Solutions Development Group, Xilinx, Inc.
--  \   \        Filename: $RCSfile: hdsdi_rx_crc.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2008-11-14 09:17:13-07 $
-- /___/   /\    Date Created: May 21, 2004
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: hdsdi_rx_crc.vhd,rcs $
-- Revision 1.2  2008-11-14 09:17:13-07  jsnow
-- Added register initializers. Replaced hdsdi_crc module with hdsdi_crc2.
--
-- Revision 1.1  2004-08-23 13:23:51-06  jsnow
-- Comment changes only.
--
-- Revision 1.0  2004-05-21 15:27:38-06  jsnow
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
-------------------------------------------------------------------------------- 
--
-- Module Description:
--
-- This module calculates the CRC value for a line and compares it to the
-- received CRC value. The module does this for both the Y and C channels. If a 
-- CRC error is detected, the corresponding CRC error output is asserted high. 
-- This output remains asserted for one video line time, until the next CRC 
-- check is made.
-- 
-- The module also captures the line number values for the two channels and 
-- outputs them. The line number values are valid for the entire line time. 
-- 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.hdsdi_pkg.all;

entity hdsdi_rx_crc is
    port (
        clk:        in  std_logic;          -- receiver clock
        rst:        in  std_logic;          -- async reset
        ce:         in  std_logic;          -- clock enable
        c_video:    in  hd_video_type;      -- C channel video input port
        y_video:    in  hd_video_type;      -- Y channel video input port
        trs:        in  std_logic;          -- input asserted during all 4 words of TRS
        c_crc_err:  out std_logic;          -- C channel CRC error detected
        y_crc_err:  out std_logic;          -- Y channel CRC error detected
        c_line_num: out hd_vpos_type;       -- C channel received line number
        y_line_num: out hd_vpos_type);      -- Y channel received line number
end hdsdi_rx_crc;

architecture synth of hdsdi_rx_crc is

-- Signal definitions
signal c_crc_err_reg :  std_logic := '0';                   -- output register for c_crc_err
signal y_crc_err_reg :  std_logic := '0';                   -- output register for y_crc_err
signal c_line_num_reg : hd_vpos_type := (others => '0');    -- output register for c_line_num
signal y_line_num_reg : hd_vpos_type := (others => '0');    -- output register for y_line_num
signal c_rx_crc :       hd_crc18_type := (others => '0');   -- C channel received CRC register
signal y_rx_crc :       hd_crc18_type := (others => '0');   -- Y channel received CRC register
signal c_calc_crc :     hd_crc18_type;                      -- C channel calculated CRC register
signal y_calc_crc :     hd_crc18_type;                      -- Y channel calculated CRC register
signal trslncrc :                                           -- Used to generate internal timing
                        std_logic_vector(7 downto 0) := (others => '0');
signal crc_clr :        std_logic := '0';                   -- clears the CRC registers
signal crc_en :         std_logic := '0';                   -- enables the CRC calculations
signal c_line_num_int :                                     -- temporary holding reg for LS part of C LN
                        std_logic_vector(6 downto 0) := (others => '0');
signal y_line_num_int :                                     -- temporary holding reg for LS part of Y LN
                        std_logic_vector(6 downto 0) := (others => '0');

component hdsdi_crc2
    port (
        clk:        in  std_logic;          -- word rate clock (74.25 MHz)
        ce:         in  std_logic;          -- clock enable
        en:         in  std_logic;          -- enable input
        rst:        in  std_logic;          -- async reset
        clr:        in  std_logic;          -- assert during first cycle of CRC calc
        d:          in  hd_video_type;      -- video word input
        crc_out:    out hd_crc18_type);     -- CRC output value
end component;

begin

    --
    -- CRC generator modules
    --
    CRC_C : hdsdi_crc2
        port map (
            clk         => clk,
            ce          => ce,
            en          => crc_en,
            rst         => rst,
            clr         => crc_clr,
            d           => c_video,
            crc_out     => c_calc_crc);

    CRC_Y : hdsdi_crc2
        port map (
            clk         => clk,
            ce          => ce,
            en          => crc_en,
            rst         => rst,
            clr         => crc_clr,
            d           => y_video,
            crc_out     => y_calc_crc);


    --
    -- trslncrc generator
    --
    -- This code generates timing signals indicating where the CRC and LN words
    -- are located in the EAV symbol.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            trslncrc <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if trs = '1' and trslncrc(2 downto 0) = "000" then
                    trslncrc(0) <= '1';
                else
                    trslncrc(0) <= '0';
                trslncrc(7 downto 1) <= (trslncrc(6 downto 3) & 
                                         (trslncrc(2) and y_video(6)) & 
                                         trslncrc(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    --
    -- crc_clr signal
    --
    -- The crc_clr signal controls when the CRC generator's accumulation
    --  register gets reset to begin calculating the CRC for a new line.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            crc_clr <= '0';
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if trslncrc(2) = '1' and y_video(6) = '0' then
                    crc_clr <= '1';
                else
                    crc_clr <= '0';
                end if;
            end if;
        end if;
    end process;
            
    --
    -- crc_en signal
    --
    -- The crc_en signal controls which words are included in the CRC 
    -- calculation.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            crc_en <= '0';
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if trslncrc(2) = '1' and y_video(6) = '0' then
                    crc_en <= '1';
                elsif trslncrc(4) = '1' then
                    crc_en <= '0';
                end if;
            end if;
        end if;
    end process;
            
    --
    -- received CRC registers
    --
    -- These registers hold the received CRC words from the input video stream.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            c_rx_crc <= (others => '0');
            y_rx_crc <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if trslncrc(5) = '1' then
                    c_rx_crc(8 downto 0) <= c_video(8 downto 0);
                    y_rx_crc(8 downto 0) <= y_video(8 downto 0);
                elsif trslncrc(6) = '1' then
                    c_rx_crc(17 downto 9) <= c_video(8 downto 0);
                    y_rx_crc(17 downto 9) <= y_video(8 downto 0);
                end if;
            end if;
        end if;
    end process;

    --
    -- CRC comparators
    --
    -- Compare the received CRC values against the calculated CRCs.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            c_crc_err_reg <= '0';
            y_crc_err_reg <= '0';
        elsif clk'event and clk = '1' then
            if ce = '1' and trslncrc(7) = '1' then
                if c_rx_crc = c_calc_crc then
                    c_crc_err_reg <= '0';
                else
                    c_crc_err_reg <= '1';
                end if;

                if y_rx_crc = y_calc_crc then
                    y_crc_err_reg <= '0';
                else
                    y_crc_err_reg <= '1';
                end if;
            end if;
        end if;
    end process;

    c_crc_err <= c_crc_err_reg;
    y_crc_err <= y_crc_err_reg;

    --
    -- line number registers
    --
    -- These registers hold the line number values from the input video stream.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            c_line_num_int <= (others => '0');
            y_line_num_int <= (others => '0');
            c_line_num_reg <= (others => '0');
            y_line_num_reg <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if trslncrc(3) = '1' then
                    c_line_num_int <= c_video(8 downto 2);
                    y_line_num_int <= y_video(8 downto 2);
                elsif trslncrc(4) = '1' then
                    c_line_num_reg <= (c_video(5 downto 2) & c_line_num_int);
                    y_line_num_reg <= (y_video(5 downto 2) & y_line_num_int);
                end if;
            end if;
        end if;
    end process;

    c_line_num <= c_line_num_reg;
    y_line_num <= y_line_num_reg;

end synth;
