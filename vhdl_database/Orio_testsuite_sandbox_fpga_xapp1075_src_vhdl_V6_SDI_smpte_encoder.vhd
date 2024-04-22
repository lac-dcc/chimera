-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Solutions Development Group, Xilinx, Inc.
--  \   \        Filename: $RCSfile: smpte_encoder.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2008-11-07 11:06:38-07 $
-- /___/   /\    Date Created: May 28, 2004 
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: smpte_encoder.vhd,rcs $
-- Revision 1.2  2008-11-07 11:06:38-07  jsnow
-- Added register initializers to eliminate unknowns during simulation.
--
-- Revision 1.1  2004-12-09 14:56:05-07  jsnow
-- Cosmetic changes only.
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
-- Description of module:
-- 
-- This module performs the SMPTE scrambling and NRZ-to-NRZI converion 
-- algorithms on 10-bit video words. It is designed to support both SDI 
-- (SMPTE 259M) and HD-SDI (SMPTE 292M) standards.
-- 
-- When encoding HD-SDI video, two of these modules can be used to encode the
-- two video channels Y and C. Each module would run at the word rate (74.25 
-- MHz) and accept one video in and generate one encoded data word out per clock
--  cycle. It is also possible to use just one of these modules to encode both 
-- data channels by running the module a 2X the video rate.
-- 
-- When encoding SD-SDI video, one module is used and data is encoded one word
-- per clock cycle.
-- 
-- The module has two clock cycles of latency. It accepts one 10-bit word every
-- clock cycle and also produces 10-bits of encoded data every clock cycle.
-- 
-- One clock cycle is used to scramble the data using the SMPTE X^9 + X^4 + 1
-- polynomial. During the second clock cycles, the scrambled data is converted 
-- to NRZI data using the X + 1 polynomial.
-- 
-- Both the scrambling and NRZ-to-NRZI conversion have separate enable inputs. 
-- The scram input enables scrambling when High. The nrzi input enables NRZ-to-
-- NRZI conversion when high.
-- 
-- The p_scram input vector provides 9 bits of data that was scrambled by the
-- during the previous clock cycle or by the other channel's smpte_encoder 
-- module. When implementing a HD-SDI encoder, the p_scram input of the C 
-- scrambler module must be connected to the i_scram_q output of the Y module 
-- and the p_scram input of the Y scrambler module must be connected to the 
-- i_scram output of the C module. For SD-SDI or for HD-SDI when running this 
-- module at 2X the HD-SDI word rate, the p_scram input must be connected to the
-- i_scram_q output of this same module.
-- 
-- The p_nrzi input provides one bit of data that was converted to NRZI by the
-- companion hdsdi_scram_lower module. When implementing a HD-SDI encoder, the 
-- p_nrzi input of the C scrambler module must be connected to the q(9) bit from 
-- the Y module and the p_nrzi input of the Y scrambler module must be connected
-- to the i_nrzi output of the C module. For SD-SDI or for HD-SDI when running 
-- this module at 2X the HD-SDI word rate, the p_nrzi input must be connected to
-- the  q(9) output bit of this same module.
-- 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.hdsdi_pkg.all;

entity smpte_encoder is
    port (
        clk:        in  std_logic;                      -- word rate clock (74.25 MHz)
        rst:        in  std_logic;                      -- async reset
        ce:         in  std_logic;                      -- clock enable
        nrzi:       in  std_logic;                      -- 1 enables NRZ-to-NRZI conversion
        scram:      in  std_logic;                      -- 1 enables SDI scrambler
        d:          in  hd_video_type;                  -- input data port
        p_scram:    in  std_logic_vector(8 downto 0);   -- previously scrambled data input
        p_nrzi:     in  std_logic;                      -- MSB of previously converted NRZI word
        q:          out hd_video_type;                  -- output data port
        i_scram:    out std_logic_vector(8 downto 0);   -- intermediate scrambled data output
        i_scram_q:  out std_logic_vector(8 downto 0);   -- registered intermediate scrambled data
        i_nrzi:     out std_logic);                     -- intermediate nrzi data output
end smpte_encoder;

architecture synth of smpte_encoder is

-- Internal signal definitions
signal scram_reg :  hd_video_type := (others => '0');   -- pipeline delay register
signal out_reg :    hd_video_type := (others => '0');   -- output register
signal scram_in :   std_logic_vector(13 downto 0);      -- input to the scambler
signal scram_temp : hd_video_type;                      -- intermediate output of scrambler
signal scram_out :  hd_video_type;                      -- output of the scrambler
signal nrzi_out :   hd_video_type;                      -- output of NRZI converter
signal nrzi_temp :  hd_video_type;                      -- intermediate output of NRZI converter

begin

    --
    -- Scrambler
    --
    -- This block of logic implements the SDI scrambler algorithm. The scrambler
    -- uses the 10 incoming bits from the input port and a 14-bit vector called 
    -- scram_in. scram_in is made up of 9 bits that were scrambled in the 
    -- previous clock cycle (p_scram) and the 5 LS scrambled bits that have been
    --  generated during the current clock cycle. The results of the scrambler 
    -- are assigned to scram_temp.
    --
    -- A MUX will output either the value of scram_temp or the d input word
    -- depending on the scram enable input. The output of the MUX is stored in 
    -- the scram_reg.
    --
    scram_in <= (scram_temp(4 downto 0) & p_scram(8 downto 0));

    process(d, scram_in)
    begin
        for i in 0 to 9 loop
            scram_temp(i) <= (d(i) xor scram_in(i)) xor scram_in(i + 4);
        end loop;
    end process;

    scram_out <= scram_temp when scram = '1' else d;

    process(clk, rst)
    begin
        if rst = '1' then
            scram_reg <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                scram_reg <= scram_out;
            end if;
        end if;
    end process;

    --
    -- NRZ-to-NRZI converter
    --
    -- This block of logic implements the NRZ-to-NRZI conversion. It operates on
    -- the 10 bits coming from the scram_reg and the MSB from the output of the 
    -- NRZ-to-NRZI conversion done on the previous word (p_nrzi).. A MUX 
    -- bypasses the  conversion process if the nrzi input is low.
    --
    process(scram_reg, p_nrzi, nrzi_out)
    begin
        nrzi_temp(0) <= p_nrzi xor scram_reg(0);
        for j in 1 to 9 loop
            nrzi_temp(j) <= nrzi_out(j - 1) xor scram_reg(j);
        end loop;
    end process;

    nrzi_out <= nrzi_temp when nrzi = '1' else scram_reg;

    --
    -- out_reg: Output register
    --
    process(clk, rst)
    begin
        if rst = '1' then
            out_reg <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                out_reg <= nrzi_out;
            end if;
        end if;
    end process;

    --
    -- output assignments
    --
    q <= out_reg;
    i_scram <= scram_temp(9 downto 1);
    i_scram_q <= scram_reg(9 downto 1);
    i_nrzi <= nrzi_temp(9);

end synth;