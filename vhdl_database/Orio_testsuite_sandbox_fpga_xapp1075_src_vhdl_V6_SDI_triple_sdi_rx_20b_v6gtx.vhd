-------------------------------------------------------------------------------- 
-- Copyright (c) 2010 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow
--  \   \        Filename: $RCSfile: triple_sdi_rx_20b_v6gtx.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-07-29 11:55:13-06 $
-- /___/   /\    Date Created: January 5, 2010
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: triple_sdi_rx_20b_v6gtx.vhd,rcs $
-- Revision 1.2  2010-07-29 11:55:13-06  jsnow
-- For simulation purposes, the reset inputs of the dru and dru barrell
-- shifter are now connected to the rst input of the module. These
-- modules generate X's in simulation unless they are reset.
--
-- Revision 1.1  2010-04-12 09:57:18-06  jsnow
-- Changed the number of internal clock enables used.
--
-- Revision 1.0  2010-03-08 14:13:28-07  jsnow
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
-- This is the triple-rate SDI (SD/HD/3G) receiver data path. It is designed to
-- support the Virtex-6 GTX with a 20-bit RXDATA interface.
-- 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.hdsdi_pkg.all;

entity triple_sdi_rx_20b is
generic (
    NUM_SD_CE:          integer := 2;                   -- number of SD-SDI clock enable outputs
    NUM_3G_DRDY:        integer := 2;                   -- number of dout_rdy_3G outputs
    ERRCNT_WIDTH:       integer := 4;                   -- width of counter tracking lines with errors
    MAX_ERRS_LOCKED:    integer := 15;                  -- max number of consecutive lines with errors
    MAX_ERRS_UNLOCKED:  integer := 2);                  -- max number of lines with errors during mode search
port (
    -- inputs
    clk:            in  std_logic;                      -- rxusrclk input
    rst:            in  std_logic;                      -- async reset input
    data_in:        in  std_logic_vector(19 downto 0);  -- raw data from GTx RXDATA port
    frame_en:       in  std_logic;                      -- 1 = enable framer position update

    -- general outputs
    mode:           out std_logic_vector(1 downto 0);   -- 00=HD, 01=SD, 10=3G
    mode_HD:        out std_logic;                      -- 1 = HD mode
    mode_SD:        out std_logic;                      -- 1 = SD mode
    mode_3G:        out std_logic;                      -- 1 = 3G mode
    mode_locked:    out std_logic;                      -- auto mode detection locked
    rx_locked:      out std_logic;                      -- receiver locked
    t_format:       out xavb_vid_format_type;           -- transport format for 3G and HD
    level_b_3G:     out std_logic;                      -- 0=A, 1=B
    ce_sd:          out std_logic_vector(NUM_SD_CE-1 downto 0);
                                                        -- clock enables for SD, always 1 for HD & 3G
    nsp:            out std_logic;                      -- framer new start position
    ln_a:           out xavb_hd_line_num_type;          -- line number for HD & 3G (link A for 3GB)
    a_vpid:         out std_logic_vector(31 downto 0);  -- VPID data from ds1 for 3G and HD
    a_vpid_valid:   out std_logic;                      -- 1 = a_vpid is valid
    b_vpid:         out std_logic_vector(31 downto 0);  -- VPID data from ds2 for 3G and HD
    b_vpid_valid:   out std_logic;                      -- 1 = b_vpid is valid
    crc_err_a:      out std_logic;                      -- CRC error HD & 3G
    ds1_a:          out xavb_data_stream_type;          -- SD=Y/C, HD=Y, 3GA=ds1, 3GB= Y link A
    ds2_a:          out xavb_data_stream_type;          -- HD=C, 3GA=ds2, 3GB=C link A
    eav:            out std_logic;                      -- EAV
    sav:            out std_logic;                      -- SAV
    trs:            out std_logic;                      -- TRS

    -- outputs valid for 3G level B only
    ln_b:           out xavb_hd_line_num_type;          -- line number of 3GB link B
    dout_rdy_3G:    out std_logic_vector(NUM_3G_DRDY-1 downto 0);
                                                        -- 1 for level A, asserted every 
                                                        --   other clock for level B
    crc_err_b:      out std_logic;                      -- CRC error for ds2
    ds1_b:          out xavb_data_stream_type;          -- Y link B
    ds2_b:          out xavb_data_stream_type;          -- C link B

    recclk_txdata:  out std_logic_vector(19 downto 0)); -- can be wired to GTX TXDATA port for SD rec clk synthesis
end triple_sdi_rx_20b;

architecture xilinx of triple_sdi_rx_20b is

component dru
    port(
        DT_IN:          in  std_logic_vector(19 downto 0);
        CENTER_F:       in  std_logic_vector(36 downto 0);
        G1:             in  std_logic_vector(4 downto 0);
        G1_P:           in  std_logic_vector(4 downto 0);
        G2:             in  std_logic_vector(4 downto 0);
        CLK:            in  std_logic;
        RST:            in  std_logic;
        RST_FREQ:       in  std_logic;
        VER:            out std_logic_vector(7 downto 0);
        EN:             in  std_logic;
        INTEG:          out std_logic_vector(31 downto 0);
        DIRECT:         out std_logic_vector(31 downto 0);
        CTRL:           out std_logic_vector(31 downto 0);
        PH_OUT:         out std_logic_vector(20 downto 0);
        RECCLK:         out std_logic_vector(19 downto 0);
        SAMV:           out std_logic_vector(3 downto 0);
        SAM:            out std_logic_vector(9 downto 0));
end component;

component bshift10to10
    port ( 
        CLK:            in  std_logic;
        RST:            in  std_logic;
        DIN:            in  std_logic_vector(9 downto 0);
        DV:             in  std_logic_vector(3 downto 0);
        DV10:           out std_logic;
        DOUT10:         out std_logic_vector(9 downto 0));
end component;

component multi_sdi_decoder
    port (
        clk:            in  std_logic;
        rst:            in  std_logic;
        ce:             in  std_logic;
        hd_sd:          in  std_logic;
        d:              in  hd_vid20_type;
        q:              out hd_vid20_type);
end component;

component multi_sdi_framer
    port (
        clk:            in  std_logic;      
        rst:            in  std_logic;      
        ce:             in  std_logic;      
        hd_sd:          in  std_logic;      
        d:              in  hd_vid20_type;  
        frame_en:       in  std_logic;      
        c:              out xavb_data_stream_type; 
        y:              out xavb_data_stream_type; 
        trs:            out std_logic;      
        xyz:            out std_logic;      
        eav:            out std_logic;      
        sav:            out std_logic;      
        trs_err:        out std_logic;      
        nsp:            out std_logic);     
end component;

component triple_sdi_rx_autorate
    generic (
        ERRCNT_WIDTH :      integer := 4;
        TRSCNT_WIDTH :      integer := HD_HCNT_WIDTH;
        MAX_ERRS_LOCKED :   integer := 15;
        MAX_ERRS_UNLOCKED : integer := 2);
    port(
        clk :           in  std_logic;
        ce :            in  std_logic;
        rst :           in  std_logic;
        sav :           in  std_logic;
        trs_err :       in  std_logic;
        mode_enable :   in  std_logic_vector(2 downto 0);
        mode :          out std_logic_vector(1 downto 0);
        locked :        out std_logic);
end component;

component SMPTE425_B_demux2
    port (
        clk :           in  std_logic;                                  
        ce :            in  std_logic;                                  
        drdy_in :       in  std_logic;                                  
        rst :           in  std_logic;                                  
        ds1 :           in  xavb_data_stream_type;                      
        ds2 :           in  xavb_data_stream_type;                      
        trs_in :        in  std_logic;                                  
        level_b :       out std_logic;                                  
        c0 :            out xavb_data_stream_type := (others => '0');   
        y0 :            out xavb_data_stream_type;                      
        c1 :            out xavb_data_stream_type := (others => '0');   
        y1 :            out xavb_data_stream_type;                      
        trs :           out std_logic;                                  
        eav :           out std_logic;                                  
        sav :           out std_logic;                                  
        xyz :           out std_logic;                                  
        dout_rdy_gen :  out std_logic;                                  
        line_num :      out xavb_hd_line_num_type := (others => '0'));  
end component;

component triple_sdi_autodetect_ln
    port (
        clk:        in  std_logic;                      
        rst:        in  std_logic;                      
        ce:         in  std_logic;                      
        vid_in:     in  std_logic_vector(8 downto 7);   
        eav:        in  std_logic;                      
        sav:        in  std_logic;                      
        reacquire:  in  std_logic;                      
        a3g:        in  std_logic;
        std:        out xavb_vid_format_type;           
        locked:     out std_logic;                      
        ln:         out xavb_hd_line_num_type;          
        ln_valid:   out std_logic);
end component;

component hdsdi_rx_crc
    port (
        clk:        in  std_logic;          
        rst:        in  std_logic;          
        ce:         in  std_logic;          
        c_video:    in  xavb_data_stream_type;      
        y_video:    in  xavb_data_stream_type;      
        trs:        in  std_logic;          
        c_crc_err:  out std_logic;          
        y_crc_err:  out std_logic;          
        c_line_num: out xavb_hd_line_num_type;       
        y_line_num: out xavb_hd_line_num_type);      
end component;

component SMPTE352_vpid_capture
    generic (
        VPID_TIMEOUT_VBLANKS:   integer := 4);
    port (
        clk:        in  std_logic;                          
        ce:         in  std_logic;                          
        rst:        in  std_logic;                          
        sav:        in  std_logic;                          
        vid_in:     in  xavb_10b_vcomp_type;                
        payload:    out std_logic_vector(31 downto 0);      
        valid:      out std_logic);                         
end component;

attribute keep : string;
attribute equivalent_register_removal : string;

--
-- Internal signal declarations
--

-- Clock enables
constant NUM_INT_CE: integer := 1;          -- Number of internal clock enables
constant NUM_INT_LVLB_CE:   integer := 1;   -- Number of internal ce_lvlb_int clock enables

-- internal SD clock enable FFs
signal ce_int :  std_logic_vector(NUM_INT_CE-1 downto 0) := (others => '0');
attribute keep of ce_int : signal is "TRUE";
attribute equivalent_register_removal of ce_int : signal is "no";

-- internal ce's correct for all modes
signal ce_lvlb_int : std_logic_vector(NUM_INT_LVLB_CE-1 downto 0) := (others => '0');
attribute keep of ce_lvlb_int : signal is "TRUE";
attribute equivalent_register_removal of ce_lvlb_int : signal is "no";

-- external SD clock enable FFs
signal ce_sd_ff : std_logic_vector(NUM_SD_CE-1 downto 0) := (others => '0');
attribute keep of ce_sd_ff : signal is "TRUE";
attribute equivalent_register_removal of ce_sd_ff : signal is "no";

-- dout_rdy signals
signal dout_rdy_3G_ff : std_logic_vector(NUM_3G_DRDY-1 downto 0) := (others => '0');
attribute keep of dout_rdy_3G_ff : signal is "TRUE";
attribute equivalent_register_removal of dout_rdy_3G_ff : signal is "no";

signal dru_drdy : std_logic;
attribute keep of dru_drdy : signal is "TRUE";


-- Other internal signals
signal samv :               std_logic_vector(3 downto 0);
signal sam :                std_logic_vector(9 downto 0);
signal dru_dout :           std_logic_vector(9 downto 0);
signal lvlb_drdy :          std_logic := '0';
signal rxdata :             std_logic_vector(19 downto 0) := (others => '0');
signal sd_rxdata :          xavb_data_stream_type;
signal mode_int :           std_logic_vector(1 downto 0);
signal mode_locked_int :    std_logic;
signal mode_HD_int :        std_logic;
signal mode_SD_int :        std_logic;
signal mode_3G_int :        std_logic;
signal descrambler_in :     std_logic_vector(19 downto 0);
signal descrambler_out :    std_logic_vector(19 downto 0);
signal framer_ds1 :         xavb_data_stream_type;
signal framer_ds2 :         xavb_data_stream_type;
signal framer_eav :         std_logic;
signal framer_sav :         std_logic;
signal framer_trs :         std_logic;
signal framer_xyz :         std_logic;
signal framer_trs_err :     std_logic;
signal level_a :            std_logic;
signal level_b :            std_logic;
signal a_vpid_int :         std_logic_vector(31 downto 0);
signal b_vpid_int :         std_logic_vector(31 downto 0);
signal a_vpid_valid_int :   std_logic;
signal b_vpid_valid_int :   std_logic;
signal vpid_b_in :          xavb_data_stream_type;
signal lvlb_a_y :           xavb_data_stream_type;
signal lvlb_a_c :           xavb_data_stream_type;
signal lvlb_b_y :           xavb_data_stream_type;
signal lvlb_b_c :           xavb_data_stream_type;
signal lvlb_trs :           std_logic;
signal lvlb_eav :           std_logic;
signal lvlb_sav :           std_logic;
signal lvlb_dout_rdy_gen :  std_logic;
signal lvlb_sav_err :       std_logic;
signal autodetect_sav :     std_logic := '0';
signal autodetect_trs_err : std_logic := '0';
signal ad_format :          xavb_vid_format_type;
signal ad_locked :          std_logic;
signal eav_int :            std_logic := '0';
signal sav_int :            std_logic := '0';
signal trs_int :            std_logic := '0';
signal ds1_a_int :          xavb_data_stream_type := (others => '0');
signal ds2_a_int :          xavb_data_stream_type := (others => '0');
signal ds1_b_int :          xavb_data_stream_type := (others => '0');
signal ds2_b_int :          xavb_data_stream_type := (others => '0');
signal ds1_a_crc_err :      std_logic;
signal ds2_a_crc_err :      std_logic;
signal ds1_b_crc_err :      std_logic;
signal ds2_b_crc_err :      std_logic;
signal framer_nsp :         std_logic;

begin

--------------------------------------------------------------------------------
-- Clock enable generation
--

--
-- The internal clock enables and the external SD clock enables are copies of
-- the DRU's drdy output in SD mode and are always High in HD and 3G modes.
--
process(clk)
begin
    if rising_edge(clk) then
        if mode_int = "01" then
            ce_int <= (others => dru_drdy);
        else
            ce_int <= (others => '1');
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if mode_int = "01" then
            ce_sd_ff <= (others => dru_drdy);
        else
            ce_sd_ff <= (others => '1');
        end if;
    end if;
end process;

ce_sd <= ce_sd_ff;

--
-- The lvlb_drdy clock enable is High all of the time except when running in
-- 3G-SDI level B mode. In that mode, it is generate by control signals in the
-- SMPTE425_B_demux module. The lvlb_drdy signal is fed back into the 
-- SMPTE425_B_demux module to control its timing. The signal is also used to
-- produce the external dout_rdy_3G signals. The lvlb_drdy and the dout_rdy_3G
-- signals are asserted at a 74.25 MHz rate in 3G-SDI level B mode to control
-- the 40-bit data path.
--
process(clk)
begin
    if rising_edge(clk) then
        if lvlb_dout_rdy_gen = '1' or (mode_3G_int and level_b ) = '0' then
            lvlb_drdy <= '1';
        else
            lvlb_drdy <= not lvlb_drdy;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if lvlb_dout_rdy_gen = '1' or (mode_3G_int and level_b) = '0' then
            dout_rdy_3G_ff <= (others => '1');
        else
            dout_rdy_3G_ff <= (others => not lvlb_drdy);
        end if;
    end if;
end process;

dout_rdy_3G <= dout_rdy_3G_ff;

-- 
-- The ce_lvlb_int signal is a clock enable that is correct for all three
-- operating modes. It is equivalent to the data ready signal from the DRU in
-- SD-SDI mode. It is High for HD-SDI and 3G-SDI level A modes. It is asserted
-- every other clock cycle in 3G-SDI level B mode.
--
process(clk)
begin
    if rising_edge(clk) then
        if mode_int = "01" then
            ce_lvlb_int <= (others => dru_drdy);
        elsif mode_int = "00" then
            ce_lvlb_int <= (others => '1');
        else
            ce_lvlb_int <= (others => lvlb_drdy);
        end if;
    end if;
end process;

--------------------------------------------------------------------------------
-- Input register
--
process(clk)
begin
    if rising_edge(clk) then
        rxdata <= data_in;
    end if;
end process;

--------------------------------------------------------------------------------
-- Oversampling data recovery unit
--
-- This module recovers the SD-SDI data from the oversampled raw data output
-- by the RocketIO transceiver. It produces a clock enable output whenever a
-- 10-bit data word is ready on the output.
--
NIDRU : dru
    port map (
        DT_IN           => rxdata,
        CENTER_F        => "0000111010001101011111110100101111011",
        G1              => "00110",
        G1_P            => "10000",
        G2              => "00111",
        CLK             => clk,
        RST             => not rst,
        RST_FREQ        => '1',
        VER             => open,
        EN              => '1',
        INTEG           => open,
        DIRECT          => open,
        CTRL            => open,
        PH_OUT          => open,
        RECCLK          => recclk_txdata,
        SAMV            => samv,
        SAM             => sam);

DRUBSHIFT : bshift10to10
    port map (
        CLK             => clk,
        RST             => not rst,
        DIN(9 downto 2) => "00000000",
        DIN(1 downto 0) => sam(1 downto 0),
        DV(3 downto 2)  => "00",
        DV(1 downto 0)  => samv(1 downto 0),
        DV10            => dru_drdy,
        DOUT10          => dru_dout);

process(clk)
begin
    if rising_edge(clk) then
        if dru_drdy = '1' then
            sd_rxdata <= dru_dout;
        end if;
    end if;
end process;

--------------------------------------------------------------------------------  
-- SDI descrambler and framer
--
-- The output of the framer is valid for HD or SD data.
--
descrambler_in <= (sd_rxdata & "0000000000") when mode_SD_int = '1' else rxdata;

DEC : multi_sdi_decoder
    port map (
        clk            => clk,
        rst            => '0',
        ce             => ce_int(0),
        hd_sd          => mode_SD_int,
        d              => descrambler_in,
        q              => descrambler_out);

FRM : multi_sdi_framer
    port map (
        clk            => clk,
        rst            => '0',
        ce             => ce_int(0),
        d              => descrambler_out,
        frame_en       => frame_en,
        hd_sd          => mode_SD_int,
        c              => framer_ds2,
        y              => framer_ds1,
        trs            => framer_trs,
        xyz            => framer_xyz,
        eav            => framer_eav,
        sav            => framer_sav,
        trs_err        => framer_trs_err,
        nsp            => framer_nsp);

nsp <= framer_nsp;

--------------------------------------------------------------------------------
-- SDI mode detection
--
process(clk)
begin
    if rising_edge(clk) then
        if ce_int(0) = '1' then
            if mode_3G_int = '1' and level_b = '1' then
                autodetect_sav <= lvlb_sav;
                autodetect_trs_err <= lvlb_sav_err;
            else
                autodetect_sav <= framer_sav;
                autodetect_trs_err <= framer_trs_err;
            end if;
        end if;
    end if;
end process;

AUTORATE : triple_sdi_rx_autorate
    generic map (
        ERRCNT_WIDTH       => ERRCNT_WIDTH,
        MAX_ERRS_LOCKED    => MAX_ERRS_LOCKED,
        MAX_ERRS_UNLOCKED  => MAX_ERRS_UNLOCKED)
    port map (
        clk                => clk,
        ce                 => ce_int(0),
        rst                => rst,
        sav                => autodetect_sav,
        trs_err            => autodetect_trs_err,
        mode_enable        => "111",
        mode               => mode_int,
        locked             => mode_locked_int);

mode_SD_int <= '1' when mode_int = "01" else '0';
mode_3G_int <= '1' when mode_int = "10" else '0';
mode_HD_int <= '1' when mode_int = "00" or mode_int = "11" else '0';

mode_HD     <= mode_HD_int and mode_locked_int;
mode_SD     <= mode_SD_int and mode_locked_int;
mode_3G     <= mode_3G_int and mode_locked_int;
mode        <= mode_int;
mode_locked <= mode_locked_int;

--------------------------------------------------------------------------------
-- 3G-SDI level B demux
--
BDMUX : SMPTE425_B_demux2
    port map (
        clk            => clk,
        ce             => ce_int(0),
        drdy_in        => lvlb_drdy,
        rst            => rst,
        ds1            => framer_ds1,
        ds2            => framer_ds2,
        trs_in         => framer_trs,
        level_b        => level_b,
        c0             => lvlb_a_c,
        y0             => lvlb_a_y,
        c1             => lvlb_b_c,
        y1             => lvlb_b_y,
        trs            => lvlb_trs,
        eav            => lvlb_eav,
        sav            => lvlb_sav,
        xyz            => open,
        dout_rdy_gen   => lvlb_dout_rdy_gen,
        line_num       => open);

lvlb_sav_err <= lvlb_sav and (
                (lvlb_a_y(5) xor lvlb_a_y(6) xor lvlb_a_y(7)) or
                (lvlb_a_y(4) xor lvlb_a_y(8) xor lvlb_a_y(6)) or
                (lvlb_a_y(3) xor lvlb_a_y(8) xor lvlb_a_y(7)) or
                (lvlb_a_y(2) xor lvlb_a_y(8) xor lvlb_a_y(7) xor lvlb_a_y(6)) or
                not lvlb_a_y(9) or lvlb_a_y(1) or lvlb_a_y(0));

--
-- These pipelined muxes select between the framer output and the output of the
-- level B data path. They also implement a pipeline delay to improve timing
-- to the downstream logic.
--
process(clk)
begin
    if rising_edge(clk) then
        if ce_int(0) = '1' then
            if mode_3G_int = '1' and level_b = '1' then
                eav_int   <= lvlb_eav;
                sav_int   <= lvlb_sav;
                trs_int   <= lvlb_trs;
                ds1_a_int <= lvlb_a_y;
                ds2_a_int <= lvlb_a_c;
                ds1_b_int <= lvlb_b_y;
                ds2_b_int <= lvlb_b_c;
            else
                eav_int   <= framer_eav;
                sav_int   <= framer_sav;
                trs_int   <= framer_trs;
                ds1_a_int <= framer_ds1;
                ds2_a_int <= framer_ds2;
                ds1_b_int <= lvlb_b_y;
                ds2_b_int <= lvlb_b_c;
            end if;
        end if;
    end if;
end process;

ds1_a <= ds1_a_int;
ds2_a <= ds2_a_int;
ds1_b <= ds1_b_int;
ds2_b <= ds2_b_int;
eav   <= eav_int;
sav   <= sav_int;
trs   <= trs_int;
level_a    <= mode_3G_int and not level_b;
level_b_3G <= mode_3G_int and level_b;

--------------------------------------------------------------------------------
-- Video timing detection module for HD and 3G
--
AD: triple_sdi_autodetect_ln
    port map (
        clk         => clk,
        rst         => rst,
        ce          => ce_lvlb_int(0),
        vid_in      => ds1_a_int(8 downto 7),
        eav         => eav_int,
        sav         => sav_int,
        reacquire   => '0',
        a3g         => level_a,
        std         => ad_format,
        locked      => ad_locked,
        ln          => open,
        ln_valid    => open);

t_format <= ad_format;
rx_locked <= mode_locked_int when mode_SD_int = '1' else ad_locked;

--------------------------------------------------------------------------------
-- CRC checking
--
RXCRC1 : hdsdi_rx_crc
    port map (
        clk         => clk,
        rst         => '0',
        ce          => ce_lvlb_int(0),
        c_video     => ds2_a_int,
        y_video     => ds1_a_int,
        trs         => trs_int,
        c_crc_err   => ds2_a_crc_err,
        y_crc_err   => ds1_a_crc_err,
        c_line_num  => open,
        y_line_num  => ln_a);

RXCRC2 : hdsdi_rx_crc
    port map (
        clk         => clk,
        rst         => '0',
        ce          => ce_lvlb_int(0),
        c_video     => ds2_b_int,
        y_video     => ds1_b_int,
        trs         => trs_int,
        c_crc_err   => ds2_b_crc_err,
        y_crc_err   => ds1_b_crc_err,
        c_line_num  => open,
        y_line_num  => ln_b);

crc_err_a <= ds2_a_crc_err or ds1_a_crc_err;
crc_err_b <= ds2_b_crc_err or ds1_b_crc_err;

--------------------------------------------------------------------------------
-- Video payload ID capture
--
PLOD : SMPTE352_vpid_capture
    port map (
        clk             => clk,
        ce              => ce_lvlb_int(0),
        rst             => rst,
        sav             => sav_int,
        vid_in          => ds1_a_int,
        payload         => a_vpid,
        valid           => a_vpid_valid);

vpid_b_in <= ds1_b_int when mode_3G_int = '1' and level_b = '1' else ds2_a_int;

PLOD2 : SMPTE352_vpid_capture
    port map (
        clk             => clk,
        ce              => ce_lvlb_int(0),
        rst             => rst,
        sav             => sav_int,
        vid_in          => vpid_b_in,
        payload         => b_vpid,
        valid           => b_vpid_valid);

end;

