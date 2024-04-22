-------------------------------------------------------------------------------- 
-- Copyright (c) 2006 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: multigenHD_output.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-03-15 14:51:38-06 $
-- /___/   /\    Date Created: July 12, 2006
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: multigenHD_output.vhd,rcs $
-- Revision 1.5  2010-03-15 14:51:38-06  jsnow
-- Made ISE 12.1 complicant by passing BRAM inits as generics.
--
-- Revision 1.4  2008-07-29 11:40:47-06  jsnow
-- The default multigenHD modules are now designed for devices
-- with RAMB18 and RAMB36 primivites.
--
-- Revision 1.0  2006-07-12 16:40:23-06  jsnow
-- Support for 720p50 and RAMB18.
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
-- This module contains the output section of the HD video pattern generator. A
-- block RAM is used to convert the vertical and horizontal coordinates of the
-- video pattern into Y and C output values.
-- 
-- A Y-Ramp generator is used to create the Y-Ramp pattern for RP 219.   
--
-- This version of the file uses the RAMB18 primitive found in Virtex-5.   
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.hdsdi_pkg.all;
use work.multigenHD_pkg.all;

library unisim; 
use unisim.vcomponents.all; 

entity multigenHD_output is
    port (
        clk:            in  std_logic;                                  -- video clock
        rst:            in  std_logic;                                  -- async reset
        ce:             in  std_logic;                                  -- clock enable
        h_region:       in  std_logic_vector(HRGN_WIDTH - 1 downto 0);  -- horizontal region
        v_band:         in  std_logic_vector(VBAND_WIDTH - 1 downto 0); -- vertical region
        h_counter_lsb:  in  std_logic;                                  -- LSB of horizontal counter
        y_ramp_inc_sel: in  std_logic;                                  -- controls the Y-Ramp increment MUX
        y:              out hd_video_type;                              -- luma output channel
        c:              out hd_video_type                               -- C channel output
    );
end multigenHD_output;

architecture synth of multigenHD_output is

-------------------------------------------------------------------------------
-- Signal definitions
--

signal y_ramp_reload :      std_logic;                              -- reloads the y_ramp reg
signal y_ramp_en :          std_logic;                              -- enables output of the y_ramp reg
signal y_ramp :             yramp_type;                             -- Y ramp register
signal y_ramp_round :       yramp_type;                             -- Y ramp rounder
signal y_ramp_out :         hd_video_type;                          -- rounded output of Y ramp reg
signal y_ramp_inc :         yramp_type;                             -- output of Y ramp increment MUX
signal crom_addr :          std_logic_vector(8 downto 0);           -- CROM address
signal crom_out :           std_logic_vector(31 downto 0);          -- CROM output
signal y_rom :              hd_video_type;                          -- Y output of color ROM
signal c_rom :              hd_video_type;                          -- C output of color ROM
signal y_ramp_mux :         hd_video_type;                          -- output of Y ramp mux
signal GND :                std_logic := '0';
signal VCC :                std_logic := '1';
signal GND4 :               std_logic_vector(3 downto 0) := "0000";
signal GND32 :              std_logic_vector(31 downto 0) := (others => '0');

begin

    ------------------------------------------------------------------------------
    -- Color ROM
    --
    crom_addr <= (v_band & h_region & h_counter_lsb);

    CROM : RAMB18SDP 
    -- Simulation initialization code CROM
    -- Created by multigenHD_romgen.v
    -- Video format mapping:
    --   0 =  SMPTE 296M - 720p   50Hz                   
    --   1 =  SMPTE 274M - 1080sF 24Hz & 23.98Hz         
    --   2 =  SMPTE 274M - 1080i  30Hz & 29.97 Hz        
    --   3 =  SMPTE 274M - 1080i  25Hz                   
    --   4 =  SMPTE 274M - 1080p  30Hz & 29.97Hz         
    --   5 =  SMPTE 274M - 1080p  25Hz                   
    --   6 =  SMPTE 274M - 1080p  24Hz & 23.98Hz         
    --   7 =  SMPTE 296M - 720p   60Hz & 59.94Hz         
    generic map (
    INIT       => X"000800100",
    SRVAL      => X"000800100",
    INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
    INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
    INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
    INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
    INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
    INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
    INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
    INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
    INIT_00 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_01 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_02 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_03 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_04 => X"0000000000FFCFFC008001000080010000B60B60000000000000000000FFCFFC",
    INIT_05 => X"00EC0EC0000000000080010000800100008001000080010000AB0AB000000000",
    INIT_06 => X"00F10F1000000000008001000080010000800100008001000080010000800100",
    INIT_07 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_08 => X"0087CA88002C0A880087CA88002C0A8800800B4400800B440080067800800678",
    INIT_09 => X"00CC43EC00C0C3EC0033C858003F48580033C858003F4858002C091400934914",
    INIT_0A => X"00D40330006CC33000D40330006CC33000CC43EC00C0C3EC00CC43EC00C0C3EC",
    INIT_0B => X"00800678008006780080067800800678007841BC00D401BC00D40330006CC330",
    INIT_0C => X"0000000000FFCFFC0080010000800100009D09D0000000000000000000FFCFFC",
    INIT_0D => X"00C70C7000000000008001000080010000800100008001000080080000000000",
    INIT_0E => X"00DA0DA00000000000800B4400800B4400800B4400800B4400800B4400800B44",
    INIT_0F => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_10 => X"00800B4400800B4400800B4400800B4400800B4400800B4400100BC80099CBC8",
    INIT_11 => X"00800B4400800B4400800B4400800B4400800B4400800B4400800B4400800B44",
    INIT_12 => X"00800B4400800B4400800B4400800B4400800B4400800B4400800B4400800B44",
    INIT_13 => X"0075C1FC00F001FC0075C1FC00F001FC00800B4400800B4400800B4400800B44",
    INIT_14 => X"0000000000FFCFFC0080010000800100009D09D0000000000000000000FFCFFC",
    INIT_15 => X"00C70C7000000000008001000080010000800100008001000080080000000000",
    INIT_16 => X"00DA0DA0000000000062C3D0009903D0009D43D4006703D400800EB000800EB0",
    INIT_17 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_18 => X"00800EB200800EB200800EB200800EB20080010100800101008A4DB400100DB4",
    INIT_19 => X"00800EB200800EB200800EB200800EB200800EB200800EB200800EB200800EB2",
    INIT_1A => X"00800EB200800EB200800EB200800EB200800EB200800EB200800EB200800EB2",
    INIT_1B => X"00F003E8006643E800F003E8006643E800800EB200800EB200800EB200800EB2",
    INIT_1C => X"0000000000FFCFFC0080010000800100009D09D0000000000000000000FFCFFC",
    INIT_1D => X"00C70C7000000000008001000080010000800100008001000080080000000000",
    INIT_1E => X"00DA0DA0000000000097823500AE423500800101008001010080010100800101",
    INIT_1F => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_20 => X"00800EB000800EB0008001000080010000800100008001000080030C0080030C",
    INIT_21 => X"0080010000800100008001000080010000800EB000800EB000800EB000800EB0",
    INIT_22 => X"008001000080010000800148008001480080010000800100008000B8008000B8",
    INIT_23 => X"0080030C0080030C0080030C0080030C00800100008001000080018C0080018C",
    INIT_24 => X"0000000000FFCFFC0080010000800100009D09D0000000000000000000FFCFFC",
    INIT_25 => X"00C70C7000000000008001000080010000800100008001000080080000000000",
    INIT_26 => X"00DA0DA000000000008001000080010000800100008001000080010000800100",
    INIT_27 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_28 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_29 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_2A => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_2B => X"00C0066000C00660008001000080010000800100008001000080010000800100",
    INIT_2C => X"0000000000FFCFFC0080010000800100009D09D0000000000000000000FFCFFC",
    INIT_2D => X"00C70C7000000000008001000080010000800100008001000080080000000000",
    INIT_2E => X"00DA0DA000000000008001000080010000800100008001000080010000800100",
    INIT_2F => X"008001000080010000C0064000C0064000C0066000C0066000C0066000C00660",
    INIT_30 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_31 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_32 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_33 => X"0080044000800440008001000080010000800100008001000080010000800100",
    INIT_34 => X"0000000000FFCFFC0080010000800100009D09D0000000000000000000FFCFFC",
    INIT_35 => X"00C70C7000000000008001000080010000800100008001000080080000000000",
    INIT_36 => X"00DA0DA000000000008001000080010000800100008001000080010000800100",
    INIT_37 => X"0080010000800100008004400080044000800440008004400080044000800440",
    INIT_38 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_39 => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_3A => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_3B => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_3C => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_3D => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_3E => X"0080010000800100008001000080010000800100008001000080010000800100",
    INIT_3F => X"0080010000800100008001000080010000800100008001000080010000800100"
    )
    port map (
            DO      => crom_out,
            DOP     => open,
            RDADDR  => crom_addr,
            RDCLK   => clk,
            DI      => GND32,
            DIP     => GND4,
            RDEN    => '1',
            REGCE   => '1',
            SSR     => rst,
            WRADDR  => "000000000",
            WRCLK   => '0',
            WREN    => '0',
            WE      => "0000"
        );

    y_ramp_reload <= crom_out(0);
    y_ramp_en     <= crom_out(1);
    y_rom         <= crom_out(y_rom'high + 2 downto 2);
    c_rom         <= crom_out(c_rom'high + 14 downto 14);

    --
    -- Y Ramp increment selection
    --
    -- This MUX selects the Y Ramp increment value. Different increment values are
    -- used for formats with 1920 active samples per line vs. 1280 active samples
    -- per line. This is because the Y Ramp pattern contains less samples if there
    -- are only 1280 active samples per line, so the increment value must be
    -- bigger in order to reach the maximum Y value by the end of the Y Ramp
    -- pattern.
    --
    -- The control for this MUX comes from an output of the VROM. The VROM decodes
    -- the std input code and controls this MUX appropriately.
    --
    y_ramp_inc <= Y_INC_1280 when y_ramp_inc_sel = '1' else Y_INC_1920;

    --
    -- Y Ramp register & adder
    --
    process(clk, rst)
    begin
        if rst = '1' then
            y_ramp <= YRAMP_INIT;
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if y_ramp_reload = '1' then
                    y_ramp <= YRAMP_INIT;
                else
                    y_ramp <= y_ramp + y_ramp_inc;
                end if;
            end if;
        end if;
    end process;

    --
    -- Y Ramp rounder
    --
    y_ramp_round <= y_ramp + YRAMP_RND;
    y_ramp_out <= y_ramp_round(y_ramp_round'high downto y_ramp_round'high - y_ramp_out'high);

    --
    -- Y output mux
    --
    y_ramp_mux <= y_ramp_out when y_ramp_en = '1' else y_rom;

    y <= y_ramp_mux;
    c <= c_rom;

end synth;