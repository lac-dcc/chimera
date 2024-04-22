-------------------------------------------------------------------------------- 
-- Copyright (c) 2008 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow
--  \   \        Filename: $RCSfile: multi_sdi_framer.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2008-11-17 16:06:37-07 $
-- /___/   /\    Date Created: May 21, 2004
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: multi_sdi_framer.vhd,rcs $
-- Revision 1.7  2008-11-17 16:06:37-07  jsnow
-- Added register initializers.
--
-- Revision 1.6  2008-09-26 13:21:45-06  jsnow
-- Added keep constraints on sd_trs_detected and sd_trs_err
-- to allow them to be used as TPTHRU points for relaxed timing
-- constraints when used in the triple-rate SDI reference design.
--
-- Revision 1.5  2008-05-29 10:25:55-06  jsnow
-- Fixed missing clock enable on hd_zeros_dly register.
--
-- Revision 1.4  2006-01-10 10:17:27-07  jsnow
-- Fixed error in HD mode which caused false TRS detection on
-- some input patterns.
--
-- Revision 1.3  2005-03-29 15:50:59-07  jsnow
-- Fixed error in SD mode which caused false TRS detection on
-- some input patterns.
--
-- Revision 1.2  2004-11-08 08:12:22-07  jsnow
-- Force c input port to all zeros in SD mode.
--
-- Revision 1.1  2004-08-23 13:24:14-06  jsnow
-- Comment changes only.
--
-- Revision 1.0  2004-05-21 15:46:22-06  jsnow
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
-- SMPTE 292M-1998 HD-SDI is a standard for transmitting high-definition digital 
-- video over a serial link.  SMPTE 259M (SD-SDI) is an equivalent standard for 
-- standard-definition video. This module performs the framing function on the 
-- decoded data from the multi-rate decoder for both SD-SDI and HD-SDI
-- 
-- This module accepts 20-bit "unframed" data words in HD-SDI mode and
-- 10-bit data in SD-SDI mode. It examines the video stream for the 30-bit TRS 
-- preamble. Once a TRS is found, the framer then knows the bit boundary of all 
-- subsequent 10-bit characters in the video stream and uses this offset to 
-- generate properly framed video.
-- 
-- The d input port is 20-bits wide to accommodate the 20-bit HD-SDI data word
-- from the decoder. In SD-SDI mode, only the 10 most significant bits (19:10)
-- are used.
-- 
-- The module has the following control inputs:
-- 
-- ce: The clock enable input controls loading of all registers in the module. 
-- It must be asserted whenever a new 10-bit word is to be loaded into the 
-- module. By providing a clock enable, this module can use a clock that is 
-- running at the bit rate of the SDI bit stream if ce is asserted once every 
-- ten clock cycles.
-- 
-- hd_sd: Controls whether the framer runs in HD-SDI mode (0) or SD-SDI mode 
-- (1).
-- 
-- frame_en: This input controls whether the framer resynchronize to new 
-- character offsets when out-of-phase TRS symbols are detected. When this input
-- is high, out-of-phase TRS symbols will cause the framer to resynchronize.
-- 
-- The module generates the following outputs:
-- 
-- c: This port contains the framed 10-bit C component for HD-SDI. It is unused
-- for SD-SDI.
-- 
-- y: This port contains the framed 10-bit Y component for HD-SDI or the 10-bit
-- framed video word for SD-SDI.
-- 
-- trs: (timing reference signal) This output is asserted when the y and c 
-- outputs have any of the four words of a TRS.
-- 
-- xyz: This output is asserted when the XYZ word of a TRS is output.
-- 
-- eav: This output is asserted when the XYZ word of a EAV is output.
-- 
-- sav: This output is asserted when the XYZ word of a SAV is output.
-- 
-- trs_err: This output is asserted during the XYZ word if an error is detected
-- by examining the protection bits.
-- 
-- nsp: (new start position) If frame_en is low and a TRS is detected that does 
-- not match the current character offset, this signal will be asserted high. 
-- The nsp signal will remain asserted until the offset error has been 
-- corrected..
-- 
-- There are normally three ways to use the frame_en input:
-- 
-- frame_en tied high: When frame_en is tied high, the framer will resynchronize
-- on every TRS detected. 
-- 
-- frame_en tied to nsp: When in this mode, the framer implements TRS filtering.
-- If a TRS is detected that is out of phase with the existing character offset,
-- nsp will be asserted, but the framer will not resynchronize. If the next TRS
-- received is in phase with the current character offset, nsp will go low and 
-- the will not resynchronize. If the next TRS arrives out of phase with the 
-- current character offset, then the new character offset will be loaded and 
-- nsp will be deasserted. Single erroneous TRS  are ignored in this mode, but 
-- if they persist, the decoder will adjust.
-- 
-- frame_en tied low: The automatic framing function is disabled when frame_en 
-- is tied low. If data is being sent across the interface that does not comply 
-- with the SDI standard and may contain data that looks like TRS symbols, the 
-- framing function can be disabled in this manner.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.hdsdi_pkg.all;

entity multi_sdi_framer is
    port (
        clk:        in  std_logic;       -- word rate clock (74.25 MHz)
        rst:        in  std_logic;       -- async reset
        ce:         in  std_logic;       -- clock enable
        hd_sd:      in  std_logic;       -- 0 = HD-SDI, 1 = SD-SDI
        d:          in  hd_vid20_type;   -- input data port
        frame_en:   in  std_logic;       -- enables resynch when high
        c:          out hd_video_type;   -- chroma channel output port
        y:          out hd_video_type;   -- luma channel output port
        trs:        out std_logic := '0';-- asserted when out reg contains a TRS symbol
        xyz:        out std_logic;       -- asserted when out reg contains XYZ of TRS
        eav:        out std_logic;       -- asserted when out reg contains XYZ of EAV
        sav:        out std_logic;       -- asserted when out reg contains XYZ of SAV
        trs_err:    out std_logic;       -- asserted if error detected in XYZ word
        nsp:        out std_logic := '1' -- new start position detected
    );
end multi_sdi_framer;

architecture synth of multi_sdi_framer is

-- Internal signal definitions
signal in_reg        :  hd_vid20_type := (others => '0');   -- input register 
signal dly_reg       :  hd_vid20_type := (others => '0');   -- pipeline delay register
signal dly_reg2      :  hd_vid20_type := (others => '0');   -- pipeline delay register
signal offset_reg    :                  -- offset register
                        std_logic_vector(4 downto 0) := (others => '0');
signal barrel_in     :                  -- input register for the barrel shifter
                        std_logic_vector(38 downto 0) := (others => '0');
signal trs_out       :                  -- used to generate the trs output signal
                        std_logic_vector(3 downto 0) := (others => '0');
signal bs_1_out      :                  -- output of first level of barrel shifter
                        std_logic_vector(34 downto 0);
signal bs_2_out      :                  -- output of second level of barrel shifter
                        std_logic_vector(22 downto 0);
signal hd_in_0       :  std_logic_vector(38 downto 0);
                                        -- input vector for zeros detector
signal hd_in_1       :  std_logic_vector(38 downto 0);
                                        -- input vector for ones detector
signal hd_ones_in    :  std_logic_vector(19 downto 0);
                                        -- ones detector result vector
signal hd_zeros_in   :  std_logic_vector(19 downto 0);
                                        -- zeros detector result vector                                      
signal hd_zeros_dly  :  std_logic_vector(19 downto 0) := (others => '0');
                                        -- zeros detector result vector delayed
signal hd_trs_match  :  std_logic_vector(19 downto 0);
                                        -- TRS detector result vector   
signal hd_trs_detected: std_logic;      -- asserted when TRS symbol is detected
signal hd_trs_err:      std_logic;      -- asserted when TRS error is detected
signal hd_offset_val :                  -- calculated offset value from HD TRS detector
                        std_logic_vector(4 downto 0);
signal barrel_out    :  hd_vid20_type;  -- output of barrel shifter
signal new_offset    :  std_logic;      -- mismatch between offset_val and offset_reg
signal bs_in         :                  -- input vector to barrel shifter first level
                        std_logic_vector(50 downto 0);
signal bs_sel_1      :  std_logic;      -- barrel shifter first level select bit
signal bs_sel_2      :                  -- barrel shifter second level select bits
                        std_logic_vector(1 downto 0);
signal bs_sel_3      :                  -- barrel shifter third level select bits
                        std_logic_vector(1 downto 0);
signal c_int :          hd_video_type   -- C channel output register
                            := (others => '0');  
signal y_int :          hd_video_type   -- Y channel output register
                            := (others => '0');  
signal xyz_int :        std_logic := '0';-- XYZ output register
signal GND20 :                          -- 20-bit vector of zeros
                        std_logic_vector(19 downto 0);
signal sd_in_vector:    std_logic_vector(38 downto 0); 
                                        -- concat of 3 input regs & d
signal sd_trs_match1:   std_logic_vector( 9 downto 0); 
                                        -- offsets in in_vector(18:0) matching 0x3ff
signal sd_trs_match2:   std_logic_vector( 9 downto 0); 
                                        -- offsets in in_vector(28:10) matching 0x000
signal sd_trs_match3:   std_logic_vector( 9 downto 0); 
                                        -- offsets in in_vector(38:20) matching 0x000
signal sd_trs_match_all:std_logic_vector( 9 downto 0); 
                                        -- offsets matching complete TRS preamble
signal sd_trs_match1_l1:std_logic_vector(15 downto 0); 
                                        -- intermediate level of gate outputs
signal sd_trs_match2_l1:std_logic_vector(15 downto 0); 
                                        -- intermediate level of gate outputs
signal sd_trs_match3_l1:std_logic_vector(15 downto 0); 
                                        -- intermediate level of gate outputs
signal sd_trs_detected: std_logic;      -- asserted when TRS is detected
signal sd_offset_val:   std_logic_vector(3 downto 0);
                                        -- calculated offset value from SD TRS detector
signal trs_detected:    std_logic;      -- HD/SD trs_detected mux output
signal sd_trs_err:      std_logic;      -- more than one offset matched the TRS symbol
signal offset_val:      std_logic_vector(4 downto 0);
                                        -- HD/SD offset value mux output
attribute keep : string;
attribute keep of sd_trs_detected : signal is "TRUE";
attribute keep of sd_trs_err : signal is "TRUE";

begin

    GND20 <= (others => '0');

    --
    -- input register
    --
    -- 20-bit wide input register captures the received data from the decoder
    -- module every clock cycle.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            in_reg <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                in_reg <= d;
            end if;
        end if;
    end process;

        
    --
    -- delay register
    --
    -- 20-bit wide delay register loads from the output of the in_reg.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            dly_reg <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                dly_reg <= in_reg;
            end if;
        end if;
    end process;

    --
    -- delay register 2
    --
    -- 20-bit wide delay register loads from the output of the dly_reg.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            dly_reg2 <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                dly_reg2 <= dly_reg;
            end if;
        end if;
    end process;


    ----------------------------------------------------------------------------
    -- HD TRS detector and offset encoder
    --
    -- The HD TRS detector identifies the 60-bit TRS sequence consisting of 20 
    -- '1' bits followed by 40 '0' bits. The first level of the TRS detector
    -- consists of a ones detector and a zeros detector. The ones detector 
    -- looks for a run of 20 consecutive ones in the hd_in_1 vector. The hd_in_1
    -- vector is a 39-bit vector made up of the contents of dly_reg2 and the 19
    -- LSBs of dly_reg. The zeros detector looks for a run of 20 consecutive '0'
    -- bits in the hd_in_0 vector. The hd_in_0 vector is 39-bits wide and is 
    -- made up of in_reg and the 19 LSBs of the d input port. The output of the 
    -- zeros detector is stored in the hd_zeros_dly register so that the zeros 
    -- detector can be used twice to find two consecutive runs of 20 zeros. The 
    -- output of the zeros detector (both hd_zeros_in and hd_zeros_dly) and the 
    -- ones detector (hd_ones_in) are 20-bit vectors with a bit for each 
    -- possible starting position of the 20-bit run.
    --
    -- A vector called hd_trs_match is created by ORing the hd_ones_in, 
    -- hd_zeros_in, and hd_zeros_dly values together. The 20-bit hd_trs_match 
    -- vector will have a single bit set indicating the starting position of a 
    -- TRS if one is present in the input vector. The hd_trs_detected signal, 
    -- asserted when a TRS is detected, can then be created by ORing all of the 
    -- bits of hd_trs_match together. And, the hd_offset_val, which is a 4-bit 
    -- binary value indicating the starting position of the the TRS to the 
    -- barrel shifter, can be generated from the hd_trs_match vector.
    --
    hd_in_0 <= (d(18 downto 0) & in_reg);
    hd_in_1 <= (dly_reg(18 downto 0) & dly_reg2);

    --
    -- zeros detector
    --
    process(hd_in_0)
    begin
        for l in 0 to 19 loop
            hd_zeros_in(l) <= not (hd_in_0(l+19) or hd_in_0(l+18) or hd_in_0(l+17) or 
                                   hd_in_0(l+16) or hd_in_0(l+15) or hd_in_0(l+14) or 
                                   hd_in_0(l+13) or hd_in_0(l+12) or hd_in_0(l+11) or 
                                   hd_in_0(l+10) or hd_in_0(l+ 9) or hd_in_0(l+ 8) or
                                   hd_in_0(l+ 7) or hd_in_0(l+ 6) or hd_in_0(l+ 5) or 
                                   hd_in_0(l+ 4) or hd_in_0(l+ 3) or hd_in_0(l+ 2) or 
                                   hd_in_0(l+ 1) or hd_in_0(l+ 0));
        end loop;
    end process;

    --
    -- ones detector
    --
    process(hd_in_1)
    begin
        for m in 0 to 19 loop
            hd_ones_in(m) <= hd_in_1(m+19) and hd_in_1(m+18) and hd_in_1(m+17) and 
                             hd_in_1(m+16) and hd_in_1(m+15) and hd_in_1(m+14) and 
                             hd_in_1(m+13) and hd_in_1(m+12) and hd_in_1(m+11) and 
                             hd_in_1(m+10) and hd_in_1(m+ 9) and hd_in_1(m+ 8) and
                             hd_in_1(m+ 7) and hd_in_1(m+ 6) and hd_in_1(m+ 5) and 
                             hd_in_1(m+ 4) and hd_in_1(m+ 3) and hd_in_1(m+ 2) and 
                             hd_in_1(m+ 1) and hd_in_1(m+ 0);
        end loop;
    end process;

    -- 
    -- zeros delay register
    --
    process(clk, rst)
    begin
        if rst = '1' then
            hd_zeros_dly <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                hd_zeros_dly <= hd_zeros_in;
            end if;
        end if;
    end process;

    --
    -- hd_trs_match and hd_trs_detected signals
    --
    hd_trs_match <= hd_zeros_in and hd_zeros_dly and hd_ones_in;
    hd_trs_detected <= '0' when hd_trs_match = GND20 else '1';

    --
    -- The following assignments encode the hd_trs_match vector into a binary
    -- offset code.
    --
    hd_offset_val(0) <= hd_trs_match(1)  or hd_trs_match(3)  or hd_trs_match(5)  or
                        hd_trs_match(7)  or hd_trs_match(9)  or hd_trs_match(11) or
                        hd_trs_match(13) or hd_trs_match(15) or hd_trs_match(17) or
                        hd_trs_match(19);

    hd_offset_val(1) <= hd_trs_match(2)  or hd_trs_match(3)  or hd_trs_match(6)  or
                        hd_trs_match(7)  or hd_trs_match(10) or hd_trs_match(11) or
                        hd_trs_match(14) or hd_trs_match(15) or hd_trs_match(18) or
                        hd_trs_match(19);

    hd_offset_val(2) <= hd_trs_match(4)  or hd_trs_match(5)  or hd_trs_match(6)  or
                        hd_trs_match(7)  or hd_trs_match(12) or hd_trs_match(13) or
                        hd_trs_match(14) or hd_trs_match(15);

    hd_offset_val(3) <= hd_trs_match(8)  or hd_trs_match(9)  or hd_trs_match(10) or
                        hd_trs_match(11) or hd_trs_match(12) or hd_trs_match(13) or
                        hd_trs_match(14) or hd_trs_match(15);

    hd_offset_val(4) <= hd_trs_match(16) or hd_trs_match(17) or hd_trs_match(18) or
                        hd_trs_match(19);
                       

    ----------------------------------------------------------------------------
    -- SD TRS detector
    --
    -- The SD TRS detector finds 30-bit TRS preambles (0x3ff, 0x000, 0x000) in    
    -- the input data stream. The TRS detector scans a 39-bit input vector
    -- consisting of all the MS 10 bits bits from the input register and the
    -- two delay registers plus 9 bits of the d input data.
    --
    -- The detector consists two main parts. 
    --
    -- The first part is a series 10-bit AND and NOR gates that examine each
    -- possible bit location in the 39 input vector for the TRS preamble. These
    -- 10-bit wide AND and NOR gates have been coded here as two levels of
    -- 3 and 4 input gates because this results in a more compact implementation
    -- in most synthesis engines. 
    --
    -- The outputs of these gates are assigned to the vectors sd_trs_match1, 2, 
    -- and 3. These three vectors each contain 10 unary bits that indicate which 
    -- offset(s) matched the pattern being detected. ANDing these three vectors
    -- together generates another 10-bit vector called sd_trs_match_all whose 
    -- bits indicate which offset(s) matches the entire 30-bit TRS preamble.
    --
    -- The second part of the TRS detector consists of a case statement based on
    -- the sd_trs_match_all vector derived above. The case statement generates 
    -- two outputs. The first, sd_offset_val, is a value between 0 and 9 that 
    -- indicates the bit offset of the TRS preamble. This value is only valid if
    -- there is one and only one bit asserted in the sd_trs_match_all vector. If 
    -- sd_trs_match_all contains more or less than one bit set, the sd_trs_err 
    -- signal will be asserted indicating a error in the TRS detection 
    -- algorithm.
    -- 
    sd_in_vector <= d(18 downto 10) & in_reg(19 downto 10) & 
                    dly_reg(19 downto 10) & dly_reg2(19 downto 10);

    -- first level of gates

    process(sd_in_vector)
    begin
        sd_trs_match1_l1( 0) <= sd_in_vector( 3) and sd_in_vector( 2) and 
                                sd_in_vector( 1) and sd_in_vector( 0);
        sd_trs_match1_l1( 1) <= sd_in_vector( 4) and sd_in_vector( 3) and 
                                sd_in_vector( 2) and sd_in_vector( 1);
        sd_trs_match1_l1( 2) <= sd_in_vector( 5) and sd_in_vector( 4) and 
                                sd_in_vector( 3) and sd_in_vector( 2);
        sd_trs_match1_l1( 3) <= sd_in_vector( 6) and sd_in_vector( 5) and 
                                sd_in_vector( 4) and sd_in_vector( 3);
        sd_trs_match1_l1( 4) <= sd_in_vector( 7) and sd_in_vector( 6) and 
                                sd_in_vector( 5) and sd_in_vector( 4);
        sd_trs_match1_l1( 5) <= sd_in_vector( 8) and sd_in_vector( 7) and 
                                sd_in_vector( 6) and sd_in_vector( 5);
        sd_trs_match1_l1( 6) <= sd_in_vector( 9) and sd_in_vector( 8) and 
                                sd_in_vector( 7) and sd_in_vector( 6);
        sd_trs_match1_l1( 7) <= sd_in_vector(10) and sd_in_vector( 9) and 
                                sd_in_vector( 8) and sd_in_vector( 7);
        sd_trs_match1_l1( 8) <= sd_in_vector(11) and sd_in_vector(10) and 
                                sd_in_vector( 9) and sd_in_vector( 8);
        sd_trs_match1_l1( 9) <= sd_in_vector(12) and sd_in_vector(11) and 
                                sd_in_vector(10) and sd_in_vector( 9);
        sd_trs_match1_l1(10) <= sd_in_vector(13) and sd_in_vector(12) and 
                                sd_in_vector(11) and sd_in_vector(10);
        sd_trs_match1_l1(11) <= sd_in_vector(14) and sd_in_vector(13) and 
                                sd_in_vector(12) and sd_in_vector(11);
        sd_trs_match1_l1(12) <= sd_in_vector(15) and sd_in_vector(14) and 
                                sd_in_vector(13) and sd_in_vector(12);
        sd_trs_match1_l1(13) <= sd_in_vector(16) and sd_in_vector(15) and 
                                sd_in_vector(14) and sd_in_vector(13);
        sd_trs_match1_l1(14) <= sd_in_vector(17) and sd_in_vector(16) and 
                                sd_in_vector(15) and sd_in_vector(14);
        sd_trs_match1_l1(15) <= sd_in_vector(18) and sd_in_vector(17) and 
                                sd_in_vector(16) and sd_in_vector(15);

        sd_trs_match2_l1( 0) <= not (sd_in_vector(13) or sd_in_vector(12) or 
                                     sd_in_vector(11) or sd_in_vector(10));
        sd_trs_match2_l1( 1) <= not (sd_in_vector(14) or sd_in_vector(13) or 
                                     sd_in_vector(12) or sd_in_vector(11));
        sd_trs_match2_l1( 2) <= not (sd_in_vector(15) or sd_in_vector(14) or 
                                     sd_in_vector(13) or sd_in_vector(12));
        sd_trs_match2_l1( 3) <= not (sd_in_vector(16) or sd_in_vector(15) or 
                                     sd_in_vector(14) or sd_in_vector(13));
        sd_trs_match2_l1( 4) <= not (sd_in_vector(17) or sd_in_vector(16) or 
                                     sd_in_vector(15) or sd_in_vector(14));
        sd_trs_match2_l1( 5) <= not (sd_in_vector(18) or sd_in_vector(17) or 
                                     sd_in_vector(16) or sd_in_vector(15));
        sd_trs_match2_l1( 6) <= not (sd_in_vector(19) or sd_in_vector(18) or 
                                     sd_in_vector(17) or sd_in_vector(16));
        sd_trs_match2_l1( 7) <= not (sd_in_vector(20) or sd_in_vector(19) or 
                                     sd_in_vector(18) or sd_in_vector(17));
        sd_trs_match2_l1( 8) <= not (sd_in_vector(21) or sd_in_vector(20) or 
                                     sd_in_vector(19) or sd_in_vector(18));
        sd_trs_match2_l1( 9) <= not (sd_in_vector(22) or sd_in_vector(21) or 
                                     sd_in_vector(20) or sd_in_vector(19));
        sd_trs_match2_l1(10) <= not (sd_in_vector(23) or sd_in_vector(22) or 
                                     sd_in_vector(21) or sd_in_vector(20));
        sd_trs_match2_l1(11) <= not (sd_in_vector(24) or sd_in_vector(23) or 
                                     sd_in_vector(22) or sd_in_vector(21));
        sd_trs_match2_l1(12) <= not (sd_in_vector(25) or sd_in_vector(24) or 
                                     sd_in_vector(23) or sd_in_vector(22));
        sd_trs_match2_l1(13) <= not (sd_in_vector(26) or sd_in_vector(25) or 
                                     sd_in_vector(24) or sd_in_vector(23));
        sd_trs_match2_l1(14) <= not (sd_in_vector(27) or sd_in_vector(26) or 
                                     sd_in_vector(25) or sd_in_vector(24));
        sd_trs_match2_l1(15) <= not (sd_in_vector(28) or sd_in_vector(27) or 
                                     sd_in_vector(26) or sd_in_vector(25));

        sd_trs_match3_l1( 0) <= not (sd_in_vector(23) or sd_in_vector(22) or 
                                     sd_in_vector(21) or sd_in_vector(20));
        sd_trs_match3_l1( 1) <= not (sd_in_vector(24) or sd_in_vector(23) or 
                                     sd_in_vector(22) or sd_in_vector(21));
        sd_trs_match3_l1( 2) <= not (sd_in_vector(25) or sd_in_vector(24) or 
                                     sd_in_vector(23) or sd_in_vector(22));
        sd_trs_match3_l1( 3) <= not (sd_in_vector(26) or sd_in_vector(25) or 
                                     sd_in_vector(24) or sd_in_vector(23));
        sd_trs_match3_l1( 4) <= not (sd_in_vector(27) or sd_in_vector(26) or 
                                     sd_in_vector(25) or sd_in_vector(24));
        sd_trs_match3_l1( 5) <= not (sd_in_vector(28) or sd_in_vector(27) or 
                                     sd_in_vector(26) or sd_in_vector(25));
        sd_trs_match3_l1( 6) <= not (sd_in_vector(29) or sd_in_vector(28) or 
                                     sd_in_vector(27) or sd_in_vector(26));
        sd_trs_match3_l1( 7) <= not (sd_in_vector(30) or sd_in_vector(29) or 
                                     sd_in_vector(28) or sd_in_vector(27));
        sd_trs_match3_l1( 8) <= not (sd_in_vector(31) or sd_in_vector(30) or 
                                     sd_in_vector(29) or sd_in_vector(28));
        sd_trs_match3_l1( 9) <= not (sd_in_vector(32) or sd_in_vector(31) or 
                                     sd_in_vector(30) or sd_in_vector(29));
        sd_trs_match3_l1(10) <= not (sd_in_vector(33) or sd_in_vector(32) or 
                                     sd_in_vector(31) or sd_in_vector(30));
        sd_trs_match3_l1(11) <= not (sd_in_vector(34) or sd_in_vector(33) or 
                                     sd_in_vector(32) or sd_in_vector(31));
        sd_trs_match3_l1(12) <= not (sd_in_vector(35) or sd_in_vector(34) or 
                                     sd_in_vector(33) or sd_in_vector(32));
        sd_trs_match3_l1(13) <= not (sd_in_vector(36) or sd_in_vector(35) or 
                                     sd_in_vector(34) or sd_in_vector(33));
        sd_trs_match3_l1(14) <= not (sd_in_vector(37) or sd_in_vector(36) or 
                                     sd_in_vector(35) or sd_in_vector(34));
        sd_trs_match3_l1(15) <= not (sd_in_vector(38) or sd_in_vector(37) or 
                                     sd_in_vector(36) or sd_in_vector(35));
    end process;

    -- second level of gates

    process(sd_trs_match1_l1)
    begin
        sd_trs_match1(0) <= sd_trs_match1_l1( 0) and sd_trs_match1_l1( 4) and 
                            sd_trs_match1_l1( 6);
        sd_trs_match1(1) <= sd_trs_match1_l1( 1) and sd_trs_match1_l1( 5) and 
                            sd_trs_match1_l1( 7);
        sd_trs_match1(2) <= sd_trs_match1_l1( 2) and sd_trs_match1_l1( 6) and 
                            sd_trs_match1_l1( 8);
        sd_trs_match1(3) <= sd_trs_match1_l1( 3) and sd_trs_match1_l1( 7) and 
                            sd_trs_match1_l1( 9);
        sd_trs_match1(4) <= sd_trs_match1_l1( 4) and sd_trs_match1_l1( 8) and 
                            sd_trs_match1_l1(10);
        sd_trs_match1(5) <= sd_trs_match1_l1( 5) and sd_trs_match1_l1( 9) and 
                            sd_trs_match1_l1(11);
        sd_trs_match1(6) <= sd_trs_match1_l1( 6) and sd_trs_match1_l1(10) and 
                            sd_trs_match1_l1(12);
        sd_trs_match1(7) <= sd_trs_match1_l1( 7) and sd_trs_match1_l1(11) and 
                            sd_trs_match1_l1(13);
        sd_trs_match1(8) <= sd_trs_match1_l1( 8) and sd_trs_match1_l1(12) and 
                            sd_trs_match1_l1(14);
        sd_trs_match1(9) <= sd_trs_match1_l1( 9) and sd_trs_match1_l1(13) and 
                            sd_trs_match1_l1(15);
    end process;

    process(sd_trs_match2_l1)
    begin
        sd_trs_match2(0) <= sd_trs_match2_l1( 0) and sd_trs_match2_l1( 4) and 
                            sd_trs_match2_l1( 6);
        sd_trs_match2(1) <= sd_trs_match2_l1( 1) and sd_trs_match2_l1( 5) and 
                            sd_trs_match2_l1( 7);
        sd_trs_match2(2) <= sd_trs_match2_l1( 2) and sd_trs_match2_l1( 6) and 
                            sd_trs_match2_l1( 8);
        sd_trs_match2(3) <= sd_trs_match2_l1( 3) and sd_trs_match2_l1( 7) and 
                            sd_trs_match2_l1( 9);
        sd_trs_match2(4) <= sd_trs_match2_l1( 4) and sd_trs_match2_l1( 8) and 
                            sd_trs_match2_l1(10);
        sd_trs_match2(5) <= sd_trs_match2_l1( 5) and sd_trs_match2_l1( 9) and 
                            sd_trs_match2_l1(11);
        sd_trs_match2(6) <= sd_trs_match2_l1( 6) and sd_trs_match2_l1(10) and 
                            sd_trs_match2_l1(12);
        sd_trs_match2(7) <= sd_trs_match2_l1( 7) and sd_trs_match2_l1(11) and 
                            sd_trs_match2_l1(13);
        sd_trs_match2(8) <= sd_trs_match2_l1( 8) and sd_trs_match2_l1(12) and 
                            sd_trs_match2_l1(14);
        sd_trs_match2(9) <= sd_trs_match2_l1( 9) and sd_trs_match2_l1(13) and 
                            sd_trs_match2_l1(15);
    end process;

    process(sd_trs_match3_l1)
    begin
        sd_trs_match3(0) <= sd_trs_match3_l1( 0) and sd_trs_match3_l1( 4) and 
                            sd_trs_match3_l1( 6);
        sd_trs_match3(1) <= sd_trs_match3_l1( 1) and sd_trs_match3_l1( 5) and 
                            sd_trs_match3_l1( 7);
        sd_trs_match3(2) <= sd_trs_match3_l1( 2) and sd_trs_match3_l1( 6) and 
                            sd_trs_match3_l1( 8);
        sd_trs_match3(3) <= sd_trs_match3_l1( 3) and sd_trs_match3_l1( 7) and 
                            sd_trs_match3_l1( 9);
        sd_trs_match3(4) <= sd_trs_match3_l1( 4) and sd_trs_match3_l1( 8) and 
                            sd_trs_match3_l1(10);
        sd_trs_match3(5) <= sd_trs_match3_l1( 5) and sd_trs_match3_l1( 9) and 
                            sd_trs_match3_l1(11);
        sd_trs_match3(6) <= sd_trs_match3_l1( 6) and sd_trs_match3_l1(10) and 
                            sd_trs_match3_l1(12);
        sd_trs_match3(7) <= sd_trs_match3_l1( 7) and sd_trs_match3_l1(11) and 
                            sd_trs_match3_l1(13);
        sd_trs_match3(8) <= sd_trs_match3_l1( 8) and sd_trs_match3_l1(12) and 
                            sd_trs_match3_l1(14);
        sd_trs_match3(9) <= sd_trs_match3_l1( 9) and sd_trs_match3_l1(13) and 
                            sd_trs_match3_l1(15);
    end process;

    -- third level of gates generates a unary bit pattern indicating which
    -- offsets contain valid TRS symbols
    sd_trs_match_all <= sd_trs_match1 and sd_trs_match2 and sd_trs_match3;

    -- If any of the bits in sd_trs_match_all are asserted, the assert 
    -- trs_detected        
    sd_trs_detected <= '0' when (sd_trs_match_all = (sd_trs_match_all'range => '0')) 
                       else '1';

    -- The following case statement asserts trs_error if more than one bit is 
    -- set in sd_trs_match_all.
    process(sd_trs_match_all)
    begin
        case sd_trs_match_all is
            when "0000000000" => sd_trs_err  <= '0';
            when "0000000001" => sd_trs_err  <= '0';
            when "0000000010" => sd_trs_err  <= '0';
            when "0000000100" => sd_trs_err  <= '0';
            when "0000001000" => sd_trs_err  <= '0';
            when "0000010000" => sd_trs_err  <= '0';
            when "0000100000" => sd_trs_err  <= '0';
            when "0001000000" => sd_trs_err  <= '0';
            when "0010000000" => sd_trs_err  <= '0';
            when "0100000000" => sd_trs_err  <= '0';
            when "1000000000" => sd_trs_err  <= '0';
            when others       => sd_trs_err  <= '1';
        end case;   
    end process;

    --
    -- The following logic encodes the sd_trs_match_all vector into a binary 
    -- offset code.
    --
    sd_offset_val(0) <= sd_trs_match_all(1) or sd_trs_match_all(3) or 
                        sd_trs_match_all(5) or sd_trs_match_all(7) or 
                        sd_trs_match_all(9);

    sd_offset_val(1) <= sd_trs_match_all(2) or sd_trs_match_all(3) or 
                        sd_trs_match_all(6) or sd_trs_match_all(7);

    sd_offset_val(2) <= sd_trs_match_all(4) or sd_trs_match_all(5) or 
                        sd_trs_match_all(6) or sd_trs_match_all(7);

    sd_offset_val(3) <= sd_trs_match_all(8) or sd_trs_match_all(9);

    ----------------------------------------------------------------------------
    -- Offset register & new start position detector
    --

    --
    -- HD/SD muxes for the trs_detected and offset_val signals
    --
    trs_detected <= sd_trs_detected when hd_sd = '1' else hd_trs_detected;
    offset_val <= ('0' & sd_offset_val) when hd_sd = '1' else hd_offset_val;

    --
    -- offset_reg: barrel shifter offset register
    --
    -- The offset_reg loads the offset_val whenever trs_detected is
    -- asserted and trs_error is not asserted and frame_en is asserted.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            offset_reg <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if trs_detected = '1' and frame_en = '1' then
                    offset_reg <= offset_val;
                end if;
            end if;
        end if;
    end process;

    --
    -- New start position detector
    -- 
    -- A comparison between offset_val and offset_reg determines if
    -- the new offset is different than the current one. If there is
    -- a mismatch and frame_en is not asserted, then the nsp output
    -- will be asserted.
    --
    new_offset <= '1' when offset_val /= offset_reg else '0';

    process(clk, rst)
    begin
        if rst = '1' then
            nsp <= '1';
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if trs_detected = '1' then
                    nsp <= not frame_en and new_offset;
                end if;
            end if;
        end if;
    end process;

    --
    -- barrel_in: barrel shifter input register
    --
    -- This register implements a pipeline delay stage so that the
    -- barrel shifter's data input matches the delay on the offset
    -- input caused by the offset_reg.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            barrel_in <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if hd_sd = '1' then
                    barrel_in <= dly_reg(18 downto 0) & '0' & 
                                 dly_reg(18 downto 10) & dly_reg2(19 downto 10);
                else
                    barrel_in <= dly_reg(18 downto 0) & dly_reg2;
                end if;
            end if;
        end if;
    end process;

    --
    -- barrel shifter
    --
    -- The barrel shifter extracts a 20-bit field from the 39-bit barrel_in 
    -- vector. The bits extracted depend on the value of the offset_reg. 
    --
    bs_in <= ("000000000000" & barrel_in);
    bs_sel_1 <= offset_reg(4);
    bs_sel_2 <= offset_reg(3 downto 2);
    bs_sel_3 <= offset_reg(1 downto 0);

    process(bs_in, bs_sel_1)
    begin
        for i in bs_1_out'range loop        -- 0 to 34
            if bs_sel_1 = '1' then
                bs_1_out(i) <= bs_in(i + 16);
            else
                bs_1_out(i) <= bs_in(i);
            end if;
        end loop;
    end process;

    process(bs_1_out, bs_sel_2)
    begin
        for j in bs_2_out'range loop   -- 0 to 22
            case bs_sel_2 is
                when "00"   => bs_2_out(j) <= bs_1_out(j);
                when "01"   => bs_2_out(j) <= bs_1_out(j + 4);
                when "10"   => bs_2_out(j) <= bs_1_out(j + 8);
                when others => bs_2_out(j) <= bs_1_out(j+ 12);
            end case;
        end loop;
    end process;

    process(bs_2_out, bs_sel_3)
    begin
        for k in barrel_out'range loop  -- 0 to 19
            case bs_sel_3 is
                when "00"   => barrel_out(k) <= bs_2_out(k);
                when "01"   => barrel_out(k) <= bs_2_out(k + 1);
                when "10"   => barrel_out(k) <= bs_2_out(k + 2);
                when others => barrel_out(k) <= bs_2_out(k + 3);
            end case;
        end loop;
    end process;

    --
    -- Output registers
    --
    process(clk, rst)
    begin
        if rst = '1' then
            c_int <= (others => '0');
            y_int <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                c_int <= barrel_out(9 downto 0);
                if hd_sd = '1' then
                    y_int <= barrel_out(9 downto 0);
                else
                    y_int <= barrel_out(19 downto 10);
                end if;
            end if;
        end if;
    end process;

    c <= c_int;
    y <= y_int;

    --
    -- trs: trs output generation logic
    --
    -- The trs_out register is a 4-bit shift register which shifts every time
    -- the bit_cntr(0) bit is asserted. The trs output signal is the OR of
    -- the four bits in this register so it becomes asserted when the first
    -- character of the TRS symbol is output and remains asserted for the
    -- following three characters of the TRS symbol.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            trs_out <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                trs_out <= (trs_detected & trs_out(3 downto 1));
            end if;
        end if;
    end process;

    process(clk, rst)
    begin
        if rst = '1' then
            trs <= '0';
        elsif clk'event and clk = '1' then
            if ce = '1' then
                trs <= trs_out(3) or trs_out(2) or trs_out(1) or trs_out(0);
            end if;
        end if;
    end process;

    process(clk, rst)
    begin
        if rst = '1' then
            xyz_int <= '0';
        elsif clk'event and clk = '1' then
            if ce = '1' then
                xyz_int <= trs_out(0);
            end if;
        end if;
    end process;

    xyz <= xyz_int;
    eav <= xyz_int and y_int(6);
    sav <= xyz_int and not y_int(6);


    --
    -- TRS error detection
    --
    -- This code examines the protection bits in the XYZ word and asserts the
    -- trs_err output if an err is detected.
    --
    hd_trs_err <= xyz_int and (
                  (y_int(5) xor y_int(6) xor y_int(7)) or
                  (y_int(4) xor y_int(8) xor y_int(6)) or
                  (y_int(3) xor y_int(8) xor y_int(7)) or
                  (y_int(2) xor y_int(8) xor y_int(7) xor y_int(6)) or
                  not y_int(9) or y_int(1) or y_int(0));

    trs_err <= sd_trs_err when hd_sd = '1' else hd_trs_err;

end synth;