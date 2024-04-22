-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: trs_detect.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2004-08-27 10:01:43-06 $
-- /___/   /\    Date Created: March 11, 2002 
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: trs_detect.vhd,rcs $
-- Revision 1.0  2004-08-27 10:01:43-06  jsnow
-- Initial release.
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
-- This module examines the input video stream for TRS symbols and ancillary 
-- data packets. It does some decoding of the TRS symbols and ANC packets to 
-- generate a variety of outputs.
-- 
-- This input video stream is passed through a four register pipeline, delaying 
-- the video by four clock cycles. This allows the pipeline to contain the 
-- entire TRS symbol or the ancillary data flag plus DID word to allow them to 
-- be decoded before the video emerges from the module.
-- 
-- This module has the following inputs:
-- 
-- clk: clock input
-- 
-- ce: clock enable
-- 
-- rst: asynchronous reset input
-- 
-- vid_in: input video stream port
-- 
-- This module generates the following outputs:
-- 
-- vid_out: This is the output video stream. It is identical to the input video
-- stream, but delayed by four clock cycles.
-- 
-- rx_trs: This output is asserted only when the first word of a TRS symbol is
-- present on vid_out.
-- 
-- rx_eav: This output is asserted only when the first word of an EAV symbol is
-- present on vid_out.
-- 
-- rx_sav: This output is asserted only when the first word of an SAV symbol is
-- present on vid_out.
-- 
-- rx_f: This is the field indicator bit F latched from the XYZ word of the last
-- received TRS symbol.
-- 
-- rx_v: This is the vertical blanking interval bit V latched from the XYZ word 
-- of the last received TRS symbol.
-- 
-- rx_h: This is the horizontal blanking interval bit H latched from the XYZ 
-- word of the last received TRS symbol.
-- 
-- rx_xyz: This output is asserted when the XYZ word of a TRS symbol is present
-- on vid_out.
-- 
-- rx_xyz_err: This output is asserted when the received XYZ word contains an
-- error. It is only asserted when the XYZ word appears on vid_out. This signal 
-- is only valid for the 4:2:2 video standards.
-- 
-- rx_xyz_err_4444: This output is asserted when the received XYZ word contains 
-- an error. It is only asserted when the XYZ word appears on vid_out. This 
-- signals is only valid for the 4:4:4:4 video standards.
-- 
-- rx_anc: This output is asserted when the first word of an ANC packet (the 
-- first word of the ancillary data flag) is present on vid_out.
-- 
-- rx_edh: This output is asserted when the first word of an EDH packet (the 
-- first word of the ancillary data flag) is present on vid_out.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity trs_detect is
    port (
        clk:            in  std_ulogic;                     -- clock input
        ce:             in  std_ulogic;                     -- clock enable
        rst:            in  std_ulogic;                     -- async reset input
        vid_in:         in  std_ulogic_vector(9 downto 0);  -- video input
        vid_out:        out std_ulogic_vector(9 downto 0);  -- delayed and clipped video output
        rx_trs:         out std_ulogic;                     -- asserted during first word of TRS symbol
        rx_eav:         out std_ulogic;                     -- asserted during first word of an EAV symbol
        rx_sav:         out std_ulogic;                     -- asserted during first word of an SAV symbol
        rx_f:           out std_ulogic;                     -- field bit from last received TRS symbol
        rx_v:           out std_ulogic;                     -- vertical blanking interval bit from last TRS symbol
        rx_h:           out std_ulogic;                     -- horizontal blanking interval bit from last TRS symbol
        rx_xyz:         out std_ulogic;                     -- asserted during TRS XYZ word
        rx_xyz_err:     out std_ulogic;                     -- XYZ error flag for non-4444 standards
        rx_xyz_err_4444:out std_ulogic;                     -- XYZ error flag for 4444 standards
        rx_anc:         out std_ulogic;                     -- asserted during first word of ADF
        rx_edh:         out std_ulogic                      -- asserted during first word of ADF if it is an EDH packet
    );
end trs_detect;

         
architecture synth of trs_detect is

subtype video is std_ulogic_vector(9 downto 0);

-- internal signals
signal in_reg:               video;         -- input register
signal pipe1_vid:            video;         -- first pipeline register
signal pipe1_ones:           std_ulogic;    -- asserted if pipe1_vid[9:2] is all 1s
signal pipe1_zeros:          std_ulogic;    -- asserted if pipe1_vid[9:2] is all 0s
signal pipe2_vid:            video;         -- second pipeline register
signal pipe2_ones:           std_ulogic;    -- asserted if pipe2_vid[9:2] is all 1s 
signal pipe2_zeros:          std_ulogic;    -- asserted if pipe2_vid[9:2] is all 0s
signal out_reg_vid:          video;         -- output register - video stream
signal out_reg_anc:          std_ulogic;    -- output register - rx_anc signal
signal out_reg_edh:          std_ulogic;    -- output register - rx_edh signal
signal out_reg_trs:          std_ulogic;    -- output register - rx_trs signal
signal out_reg_eav:          std_ulogic;    -- output register - rx_eav signal
signal out_reg_sav:          std_ulogic;    -- output register - rx_sav signal
signal out_reg_xyz:          std_ulogic;    -- output register - rx_xyz signal
signal out_reg_xyz_err:      std_ulogic;    -- output register - rx_xyz_err signal
signal out_reg_xyz_err_4444: std_ulogic;    -- output register - rx_xyz_err_4444 signal
signal out_reg_f:            std_ulogic;    -- output register - rx_f signal
signal out_reg_v:            std_ulogic;    -- output register - rx_v signal
signal out_reg_h:            std_ulogic;    -- output register - rx_h signal
signal xyz:                  std_ulogic;    -- XYZ detect input to out_reg
signal xyz_err:              std_ulogic;    -- XYZ error detect input to out_reg
signal xyz_err_4444:         std_ulogic;    -- XYZ 4444 error detect input to out_reg
signal anc:                  std_ulogic;    -- anc input to out_reg
signal trs:                  std_ulogic;    -- trs input to out_reg
signal eav:                  std_ulogic;    -- eav input to out_reg
signal sav:                  std_ulogic;    -- sav input to out_reg
signal edh_in:               std_ulogic;    -- asserted when in_reg = 0x1f4 (EDH DID)
signal all_ones_in:          std_ulogic;    -- asserted when in_reg is all ones
signal all_zeros_in:         std_ulogic;    -- asserted when in_reg is all zeros
signal f:                    std_ulogic;    -- internal version of rx_f
signal v:                    std_ulogic;    -- internal version of rx_v
signal h:                    std_ulogic;    -- internal version of rx_h
signal trs_delay:            
    std_ulogic_vector(1 downto 0);          -- delay register used to assert xyz signal

begin
    
    --
    -- in_reg
    --
    -- The input register loads the value on the vid_in port.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            in_reg <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                in_reg <= vid_in;
            end if;
        end if;
    end process;

    --
    -- all ones and all zeros detectors
    --
    -- This logic determines if the input video word is all ones or all zeros. 
    -- To provide compatibility with 8-bit video equipment, the LS two bits are
    -- ignored.  
    -- 
    all_ones_in  <= in_reg(9) and in_reg(8) and in_reg(7) and in_reg(6) and
                    in_reg(5) and in_reg(4) and in_reg(3) and in_reg(2);

    all_zeros_in <= not(in_reg(9) or in_reg(8) or in_reg(7) or in_reg(6) or
                        in_reg(5) or in_reg(4) or in_reg(3) or in_reg(2));


    --
    -- DID detector decoder
    --
    -- The edh_in signal is asserted if the in_reg contains a value of 0x1f4.
    -- This is the value of the DID word for an EDH packet. 
    --
    edh_in <= '1' when (vid_in = "0111110100") else '0';

    --
    -- pipe1
    --
    -- The pipe1 register holds the inut video and the outputs of the all zeros
    -- and all ones detectors.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            pipe1_vid   <= (others => '0');
            pipe1_ones  <= '0';
            pipe1_zeros <= '0';
        elsif (clk'event and clk ='1') then
            if (ce = '1') then
                pipe1_vid   <= in_reg;
                pipe1_ones  <= all_ones_in;
                pipe1_zeros <= all_zeros_in;
            end if;
        end if; 
    end process;

    --
    -- pipe2_reg
    --
    -- The pipe2 register delays the contents of the pipe1 register for one more
    -- clock cycle.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            pipe2_vid   <= (others => '0');
            pipe2_ones  <= '0';
            pipe2_zeros <= '0';
        elsif (clk'event and clk ='1') then
            if (ce = '1') then
                pipe2_vid   <= pipe1_vid;
                pipe2_ones  <= pipe1_ones;
                pipe2_zeros <= pipe1_zeros;
            end if;
        end if; 
    end process;

    --
    -- TRS & ANC detector
    --
    -- The trs signal when the sequence 3ff, 000, 000 is stored in the pipe2, 
    -- pipe1, and in_reg registers, respectively. The anc signal is asserted 
    -- when these same registers hold the sequence 000, 3ff, 3ff.
    --
    trs <= all_zeros_in and pipe1_zeros and pipe2_ones;
    anc <= all_ones_in and pipe1_ones and pipe2_zeros;
    eav <= trs and vid_in(6);
    sav <= trs and not vid_in(6);


    --
    -- f, v, and h flag generation
    --
    f <= vid_in(8) when (trs = '1') else out_reg_f;
    v <= vid_in(7) when (trs = '1') else out_reg_v;
    h <= vid_in(6) when (trs = '1') else out_reg_h;

    --
    -- XYZ and XYZ error logic
    --
    -- The xyz signal is asserted when the pipe2 register holds the XYZ word of 
    -- a TRS symbol. The xyz_err signal is asserted if an error is detected in 
    -- the format of the XYZ word stored in pipe2. This signal is not valid for 
    -- the 4444 component digital video formats. The xyz_err_4444 signal is 
    -- asserted for XYZ word format errors.
    --
    xyz <= trs_delay(1);

    xyz_err <= 
        xyz and 
        ((pipe2_vid(5) xor pipe2_vid(7) xor pipe2_vid(6)) or                   -- P3 = V ^ H
         (pipe2_vid(4) xor pipe2_vid(8) xor pipe2_vid(6)) or                   -- P2 = F ^ H
         (pipe2_vid(3) xor pipe2_vid(8) xor pipe2_vid(7)) or                   -- P1 = F ^ V
         (pipe2_vid(2) xor pipe2_vid(8) xor pipe2_vid(7) xor pipe2_vid(6)) or  -- P0 = F ^ V ^ H
         not pipe2_vid(9));

    xyz_err_4444 <= 
        xyz and
        ((pipe2_vid(4) xor pipe2_vid(8) xor pipe2_vid(7) xor pipe2_vid(6)) or  -- P4 = F ^ V ^ H
         (pipe2_vid(3) xor pipe2_vid(8) xor pipe2_vid(7) xor pipe2_vid(5)) or  -- P3 = F ^ V ^ S
         (pipe2_vid(2) xor pipe2_vid(7) xor pipe2_vid(6) xor pipe2_vid(5)) or  -- P2 = V ^ H ^ S
         (pipe2_vid(1) xor pipe2_vid(8) xor pipe2_vid(6) xor pipe2_vid(5)) or  -- P1 = F ^ H ^ S
         not pipe2_vid(9));

    --
    -- output reg
    --
    -- The output register holds the the output video data and various flags.
    -- 
    process(rst, clk)
    begin
        if (rst = '1') then
            out_reg_vid <= (others => '0');
            out_reg_trs <= '0';
            out_reg_eav <= '0';
            out_reg_sav <= '0';
            out_reg_anc <= '0';
            out_reg_edh <= '0';
            out_reg_xyz <= '0';
            out_reg_xyz_err <= '0';
            out_reg_xyz_err_4444 <= '0';
            out_reg_f <= '0';
            out_reg_v <= '0';
            out_reg_h <= '0';
        elsif (clk'event and clk ='1') then
            if (ce = '1') then
                out_reg_vid <= pipe2_vid;
                out_reg_trs <= trs;
                out_reg_eav <= eav;
                out_reg_sav <= sav;
                out_reg_anc <= anc;
                out_reg_edh <= anc and edh_in;
                out_reg_xyz <= xyz;
                out_reg_xyz_err <= xyz_err;
                out_reg_xyz_err_4444 <= xyz_err_4444;
                out_reg_f <= f;
                out_reg_v <= v;
                out_reg_h <= h;
                
            end if;
        end if; 
    end process;

    --
    -- trs_delay register
    --
    -- Used to assert the xyz signal when pipe2 contains the XYZ word of a TRS
    -- symbol.
    process(rst, clk)
    begin
        if (rst = '1') then
            trs_delay <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                trs_delay <= (trs_delay(0) & out_reg_trs);
            end if;
        end if;
    end process;

    --
    -- assign the outputs
    --
    vid_out <= out_reg_vid;
    rx_trs <= out_reg_trs;
    rx_eav <= out_reg_eav;
    rx_sav <= out_reg_sav;
    rx_anc <= out_reg_anc;
    rx_xyz <= out_reg_xyz;
    rx_xyz_err <= out_reg_xyz_err;
    rx_xyz_err_4444 <= out_reg_xyz_err_4444;
    rx_edh <= out_reg_edh;
    rx_f <= out_reg_f;
    rx_v <= out_reg_v;
    rx_h <= out_reg_h;
            
end synth;