-------------------------------------------------------------------------------- 
-- Copyright (c) 2009 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow
--  \   \        Filename: $RCSfile: triple_sdi_tx_output_20b.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2009-03-11 15:25:54-06 $
-- /___/   /\    Date Created: January 8, 2009
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: triple_sdi_tx_output_20b.vhd,rcs $
-- Revision 1.0  2009-03-11 15:25:54-06  jsnow
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
-- This is the output module for a triple-rate SD/HD/3G-SDI transmitter. It
-- inserts EDH packets for SD and CRC & LN words for HD and 3G. It scrambles the
-- data for transmission. For SD, it implements 11X bit replication. For HD and
-- 3G, it converts the data to a 10-bit data stream for connection to a 20-bit
-- TXDATA port on the serializer.
-- 
-- The clk frequency is normally 74.25 MHz for HD-SDI and 148.5 MHz for 3G-SDI 
-- and SD-SDI. The clock enable must be 1 always for HD-SDI and 3G-SDI, unless 
-- for some reason, the clock frequency is twice as much as normal). For SD-SDI,
-- it must average 27 MHz, by asserting it at a 5/6/5/6 clock cycle cadence. For 
-- level B 3G-SDI, all four input data streams are active and the actual data 
-- rate is 74.25 MHz, even though the clock frequency is 148.5 MHz. In this 
-- case, din_rdy must be asserted every other clock cycle to indicate on which 
-- clock cycle the input data should be taken by the module. For all other 
-- modes, din_rdy should always be High. For dual link HD-SDI with 1080p 60 Hz 
-- or 50 Hz video, the clock frequency will typically be 148.5 MHz, but the data
-- rate is 74.25 MHz and ce is asserted every other clock cycle with din_rdy 
--always High.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.hdsdi_pkg.all;
use work.anc_edh_pkg.all;

entity triple_sdi_tx_output_20b is
port (
    clk:            in  std_logic;                                  -- 148.5 MHz (HD) or 297 MHz (SD/3G)
    din_rdy:        in  std_logic;                                  -- data input ready
    ce:             in  std_logic_vector(1 downto 0);               -- runs at scrambler data rate:..
                                                                    --   27 MHz, 74.25 MHz or 148.5 MHz
    rst:            in  std_logic;                                  -- async reset input
    mode:           in  std_logic_vector(1 downto 0);               -- data path mode: 00=HD/3GA, 01=SD, 10=3GB
    ds1a:           in  std_logic_vector(9 downto 0);               -- SD Y/C, HD Y, 3G Y, dual-link A Y
    ds2a:           in  std_logic_vector(9 downto 0);               -- HD C, 3G C, dual-link A C
    ds1b:           in  std_logic_vector(9 downto 0);               -- dual-link B Y
    ds2b:           in  std_logic_vector(9 downto 0);               -- dual-link B C
    insert_crc:     in  std_logic;                                  -- 1 = insert CRC for HD and 3G
    insert_ln:      in  std_logic;                                  -- 1 = insert LN for HD or 3G
    insert_edh:     in  std_logic;                                  -- 1 = generate & insert EDH for SD
    ln_a:           in  std_logic_vector(10 downto 0);              -- HD/3G line number for link A
    ln_b:           in  std_logic_vector(10 downto 0);              -- HD/3G line number for link B
    eav:            in  std_logic;                                  -- HD/3G EAV (asserted on EAV XYZ word)
    sav:            in  std_logic;                                  -- HD/3G SAV (asserted on SAV XYZ word)
    txdata:         out std_logic_vector(19 downto 0);              -- output data stream
    ce_align_err:   out std_logic);                                 -- 1 if ce 5/6/5/6 cadence is broken
end triple_sdi_tx_output_20b;

architecture xilinx of triple_sdi_tx_output_20b is

attribute equivalent_register_removal : string;

--
-- Internal signals
--
signal ds1a_reg :       xavb_data_stream_type := (others => '0');
signal ds2a_reg :       xavb_data_stream_type := (others => '0');
signal ds1b_reg :       xavb_data_stream_type := (others => '0');
signal ds2b_reg :       xavb_data_stream_type := (others => '0');
signal ln_a_reg :       xavb_hd_line_num_type := (others => '0');
signal ln_b_reg :       xavb_hd_line_num_type := (others => '0');
signal mode_reg :       std_logic_vector(1 downto 0) := (others => '0');
signal eav_reg :        std_logic := '0';
signal sav_reg :        std_logic := '0';
signal ins_crc_reg :    std_logic := '0';
signal ins_ln_reg :     std_logic := '0';
signal ins_edh_reg :    std_logic := '0';
signal eav_dly :        std_logic_vector(3 downto 0) := (others => '0');
signal edh_out_int :    video_type;                 -- EDH processor video output
signal edh_out :        xavb_data_stream_type;      -- EDH processor video output
signal edh_mux :        xavb_data_stream_type;      -- EDH processor bypass mux
signal ds1a_edh_mux :   xavb_data_stream_type;      -- chooses SD or HD/3G data stream 1A
signal ln_out_ds1a :    xavb_data_stream_type;      -- data stream 1 A out of LN insert
signal ln_out_ds2a :    xavb_data_stream_type;      -- data stream 2 A out of LN insert
signal ln_out_ds1b :    xavb_data_stream_type;      -- data stream 1 B out of LN insert
signal ln_out_ds2b :    xavb_data_stream_type;      -- data stream 2 B out of LN insert
signal crc_enable :     std_logic;                  -- enables CRC calculation
signal crc_ds1a :       xavb_hd_crc18_type;         -- calculated CRC for data stream 1 A
signal crc_ds2a :       xavb_hd_crc18_type;         -- calculated CRC for data stream 2 A
signal crc_ds1b :       xavb_hd_crc18_type;         -- calculated CRC for data stream 1 B
signal crc_ds2b :       xavb_hd_crc18_type;         -- calculated CRC for data steam 2 B
signal crc_out_ds1a :   xavb_data_stream_type;      -- data stream 1 A out of CRC insert
signal crc_out_ds2a :   xavb_data_stream_type;      -- data stream 2 A out of CRC insert
signal crc_out_ds1b :   xavb_data_stream_type;      -- data stream 1 B out of CRC insert
signal crc_out_ds2b :   xavb_data_stream_type;      -- data stream 2 B out of CRC insert
signal scram_in_ds1 :   xavb_data_stream_type;      -- scrambler ds1 input
signal scram_in_ds2 :   xavb_data_stream_type;      -- scrambler ds2 input
signal scram_out :      std_logic_vector(19 downto 0);
signal sd_bit_rep_out : std_logic_vector(19 downto 0);
signal crc_en :         std_logic := '0';           -- CRC control signal
signal clr_crc :        std_logic := '0';           -- CRC control signal
signal mode_SD :        std_logic;                  -- 1 when mode = 01 (SD)
signal mode_3G_B :      std_logic;                  -- 1 when in 3G-SDI mode, level B
signal txdata_reg :     std_logic_vector(19 downto 0) := (others => '0');
signal rst_reg :        std_logic_vector(2 downto 0) := (others => '0');
signal align_err :      std_logic;

attribute equivalent_register_removal of rst_reg : signal is "no";

begin

process(clk)
begin
    if rising_edge(clk) then
        if ce(0) = '1' then
            rst_reg <= (others => rst);
        end if;
    end if;
end process;

--
-- Input registers
--
process(clk)
begin
    if rising_edge(clk) then
        if ce(0) = '1' then
            if din_rdy = '1' then
                ds1a_reg    <= ds1a;
                ds2a_reg    <= ds2a;
                ds1b_reg    <= ds1b;
                ds2b_reg    <= ds2b;
                ln_a_reg    <= ln_a;
                ln_b_reg    <= ln_b;
                mode_reg    <= mode;
                eav_reg     <= eav;
                sav_reg     <= sav;
                ins_crc_reg <= insert_crc;
                ins_ln_reg  <= insert_ln;
                ins_edh_reg <= insert_edh;
            end if;
        end if;
    end if;
end process;

mode_SD   <= '1' when mode_reg = "01" else '0';
mode_3G_B <= '1' when mode_reg = "10" else '0';

--
-- EAV delay register
--
-- Generates timing control signals for line number insertion and CRC generation
-- and insertion.
--
process(clk, rst_reg(0))
begin
    if rst_reg(0) = '1' then
        eav_dly <= (others => '0');
    elsif rising_edge(clk) then
        if ce(0) = '1' then
            if din_rdy = '1' then
                eav_dly <= (eav_dly(2 downto 0) & eav_reg);
            end if;
        end if;
    end if;
end process;

--
-- Instantiate the line number formatting and insertion modules
--
INSLNA : entity work.hdsdi_insert_ln
    port map (
        insert_ln   => ins_ln_reg,
        ln_word0    => eav_dly(0),
        ln_word1    => eav_dly(1),
        c_in        => ds2a_reg,
        y_in        => ds1a_reg,
        ln          => ln_a_reg,
        c_out       => ln_out_ds2a,
        y_out       => ln_out_ds1a);

INSLNB : entity work.hdsdi_insert_ln
    port map (
        insert_ln   => ins_ln_reg,
        ln_word0    => eav_dly(0),
        ln_word1    => eav_dly(1),
        c_in        => ds2b_reg,
        y_in        => ds1b_reg,
        ln          => ln_b_reg,
        c_out       => ln_out_ds2b,
        y_out       => ln_out_ds1b);
        
--
-- Generate timing control signals for the CRC calculators.
--
-- The crc_en signal determines which words are included into the CRC 
-- calculation. All words that enter the hdsdi_crc module when crc_en is high
-- are included in the calculation. To meet the HD-SDI spec, the CRC calculation
-- must being with the first word after the SAV and end after the second line
-- number word after the EAV.
--
-- The clr_crc signal clears the internal registers of the hdsdi_crc modules to
-- cause a new CRC calculation to begin. The crc_en signal is asserted during
-- the XYZ word of the SAV since the next word after the SAV XYZ word is the
-- first word to be included into the new CRC calculation.
--
process(clk, rst_reg(0))
begin
    if rst_reg(0) = '1' then
        crc_en <= '0';
    elsif rising_edge(clk) then
        if ce(0) = '1' then
            if din_rdy = '1' then
                if sav_reg = '1' then
                    crc_en <= '1';
                elsif eav_dly(1) = '1' then
                    crc_en <= '0';
                end if;
            end if;
        end if;
    end if;
end process;

process(clk, rst_reg(0))
begin
    if rst_reg(0) = '1' then
        clr_crc <= '0';
    elsif rising_edge(clk) then
        if ce(0) = '1' then
            if din_rdy = '1' then
                clr_crc <= sav_reg;
            end if;
        end if;
    end if;
end process;

--
-- Instantiate the CRC generators
--
crc_enable <= din_rdy and crc_en;

CRC1A : entity work.hdsdi_crc2 
    port map (
        clk     => clk,
        ce      => ce(0),
        en      => crc_enable,
        rst     => rst_reg(0),
        clr     => clr_crc,
        d       => ln_out_ds1a,
        crc_out => crc_ds1a);

CRC2A : entity work.hdsdi_crc2 
    port map (
        clk     => clk,
        ce      => ce(0),
        en      => crc_enable,
        rst     => rst_reg(0),
        clr     => clr_crc,
        d       => ln_out_ds2a,
        crc_out => crc_ds2a);

CRC1B : entity work.hdsdi_crc2 
    port map (
        clk     => clk,
        ce      => ce(0),
        en      => crc_enable,
        rst     => rst_reg(0),
        clr     => clr_crc,
        d       => ln_out_ds1b,
        crc_out => crc_ds1b);

CRC2B : entity work.hdsdi_crc2 
    port map (
        clk     => clk,
        ce      => ce(0),
        en      => crc_enable,
        rst     => rst_reg(0),
        clr     => clr_crc,
        d       => ln_out_ds2b,
        crc_out => crc_ds2b);

--
-- Insert the CRC values into the data streams. The CRC values are inserted
-- after the line number words after the EAV.
--
CRCA: entity work.hdsdi_insert_crc
    port map (
        insert_crc  => ins_crc_reg,
        crc_word0   => eav_dly(2),
        crc_word1   => eav_dly(3),
        y_in        => ln_out_ds1a,
        c_in        => ln_out_ds2a,
        y_crc       => crc_ds1a,
        c_crc       => crc_ds2a,
        y_out       => crc_out_ds1a,
        c_out       => crc_out_ds2a);

CRCB: entity work.hdsdi_insert_crc
    port map (
        insert_crc  => ins_crc_reg,
        crc_word0   => eav_dly(2),
        crc_word1   => eav_dly(3),
        y_in        => ln_out_ds1b,
        c_in        => ln_out_ds2b,
        y_crc       => crc_ds1b,
        c_crc       => crc_ds2b,
        y_out       => crc_out_ds1b,
        c_out       => crc_out_ds2b);

--
-- EDH Processor for SD-SDI
--
EDH : entity work.edh_processor
    port map (
        clk             => clk,
        ce              => ce(1),
        rst             => rst_reg(1),
        vid_in          => video_type(ds1a_reg),
        reacquire       => '0',
        en_sync_switch  => '0',
        en_trs_blank    => '0',
        anc_idh_local   => '0',
        anc_ues_local   => '0',
        ap_idh_local    => '0',
        ff_idh_local    => '0',
        errcnt_flg_en   => "0000000000000000",
        clr_errcnt      => '0',
        receive_mode    => '0',

        vid_out         => edh_out_int,
        std             => open,
        std_locked      => open,
        trs             => open,
        field           => open,
        v_blank         => open,
        h_blank         => open,
        horz_count      => open,
        vert_count      => open,
        sync_switch     => open,
        locked          => open,
        eav_next        => open,
        sav_next        => open,
        xyz_word        => open,
        anc_next        => open,
        edh_next        => open,
        rx_ap_flags     => open,
        rx_ff_flags     => open,
        rx_anc_flags    => open,
        ap_flags        => open,
        ff_flags        => open,
        anc_flags       => open,
        packet_flags    => open,
        errcnt          => open,
        edh_packet      => open);

edh_out <= xavb_data_stream_type(edh_out_int);

--
-- This mux bypasses the EDH inserter if insert_edh is 0.
--
edh_mux <= edh_out when ins_edh_reg = '1' else ds1a_reg;

--
-- These muxes select the inputs for the scrambler. In SD, HD, and 3G level A
-- modes, they simply pass ds1a and ds2a through. In 3G level B mode, they
-- interleave data streams 1 and 2 of link A onto the Y input of the scrambler
-- and data streams 1 and 2 of link B onto the C input.
--
scram_in_ds1 <= crc_out_ds2a when mode_3G_B = '1' and din_rdy = '0' else
                crc_out_ds1a;

scram_in_ds2 <= crc_out_ds1b when mode_3G_B = '1' and din_rdy = '1' else
                crc_out_ds2b when mode_3G_B = '1' and din_rdy = '0' else
                crc_out_ds2a;

--
-- This mux selects the SD path or the HD/3G path for data stream 1.
--
ds1a_edh_mux <= edh_mux when mode_SD = '1' else scram_in_ds1;

--
-- SDI scrambler
--
-- In SD mode, this module scrambles just 10 bits on the Y channel. In HD and
-- 3G modes, this modules scrambles 20 bits. In HD mode, the scrambler is
-- enabled by ce AND din_rdy in order to support both regular HD-SDI and dual-
-- link HD-SDI. In 3G-SDI mode, the scramber is controlled by just ce.
--
SCRAM : entity work.multi_sdi_encoder
    port map (
        clk         => clk,
        rst         => '0',
        ce          => ce(0),
        hd_sd       => mode_SD,
        nrzi        => '1',
        scram       => '1',
        c           => scram_in_ds2,
        y           => ds1a_edh_mux,
        q           => scram_out);

--
-- SD 11X bit replicator
--
BITREP : entity work.sdi_bitrep_20b
    port map (
        clk         => clk,
        rst         => rst_reg(2),
        ce          => ce(0),
        d           => scram_out(19 downto 10),
        q           => sd_bit_rep_out,
        align_err   => align_err);

ce_align_err <= align_err and mode_SD;

--
-- Output register
--
process(clk)
begin
    if rising_edge(clk) then
        if mode_SD = '1' then
            txdata_reg <= sd_bit_rep_out;
        elsif ce(0) = '1' then
            txdata_reg <= scram_out;
        end if;
    end if;
end process;

txdata <= txdata_reg;

end;