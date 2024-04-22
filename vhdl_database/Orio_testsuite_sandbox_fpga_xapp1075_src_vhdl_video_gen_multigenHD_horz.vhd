-------------------------------------------------------------------------------- 
-- Copyright (c) 2005 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: multigenHD_horz.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-10-07 09:47:27-06 $
-- /___/   /\    Date Created: Jan 5, 2005
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: multigenHD_horz.vhd,rcs $
-- Revision 1.9  2010-10-07 09:47:27-06  jsnow
-- Fixed an initialization problem that caused the line count to increment
-- constantly for a short period of time after reset. This was caused
-- by a h_counter width of 13-bits when the pattern generators was
-- designed to only support 12-bit h_counter widths.
--
-- Revision 1.8  2010-03-15 14:51:23-06  jsnow
-- Made ISE 12.1 complicant by passing BRAM inits as generics.
--
-- Revision 1.7  2009-01-05 08:39:17-07  jsnow
-- Fixed error in 720p 50 Hz mode.
--
-- Revision 1.6  2008-09-30 17:06:52-06  jsnow
-- Changed init condition on RAM to not assert h_clr.
--
-- Revision 1.5  2008-09-29 15:33:01-06  jsnow
-- Fixed error in 720p 50 Hz mode.
--
-- Revision 1.4  2008-07-29 11:40:08-06  jsnow
-- The default multigenHD modules are now designed for devices
-- with RAMB18 and RAMB36 primivites.
--
-- Revision 1.3  2006-07-12 16:38:50-06  jsnow
-- Added support for 720p50 video format.
--
-- Revision 1.2  2005-01-11 14:04:35-07  jsnow
-- VHDL generics for INIT and SRVAL were only 32 bits instead of
-- the required 36 bits. This caused ModelSim errors.
--
-- Revision 1.1  2005-01-05 10:26:29-07  jsnow
-- Header update.
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
-- This module contains the horizontal sequencer for the HD video pattern 
-- generator. A block RAM is used as a finite state machine to sequence through
-- the various horizontal regions of the video patterns. The module outputs a
-- horizontal region code indicating which horizontal region of the video 
-- pattern is currently active.
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

entity multigenHD_horz is
    port (
        clk:            in  std_logic;                      -- video clock
        rst:            in  std_logic;                      -- async reset
        ce:             in  std_logic;                      -- clock enable
        std:            in  std_logic_vector(2 downto 0);   -- video standard select
        pattern:        in  std_logic_vector(1 downto 0);   -- selects pattern type (colorbars or checkfield)
        user_opt:       in  std_logic_vector(1 downto 0);   -- selects colorbars options
        first_line:     in  std_logic;                      -- asserted during first active video line
        f:              in  std_logic;                      -- odd/even field indicator
        v_inc:          out std_logic;                      -- increment vertical counter
        trs:            out std_logic;                      -- asserted during 4 words of TRS
        xyz:            out std_logic;                      -- asserted during XYZ word of TRS
        h:              out std_logic;                      -- horizontal blanking interval indicator
        h_region:       out hrgn_type;                      -- horizontal region code
        h_counter_lsb:  out std_logic                       -- LSB of horizontal counter
    );
end multigenHD_horz;

architecture synth of multigenHD_horz is

-------------------------------------------------------------------------------
-- Signal definitions
--
signal hrom_addr :          std_logic_vector(8 downto 0);           -- HROM address
signal hrom_out :           std_logic_vector(31 downto 0);          -- HROM output
signal h_counter :          std_logic_vector(11 downto 0);          -- horizontal counter
signal h_next_evnt :        std_logic_vector(H_EVNT_MSB downto 0);  -- next horizontal event
signal h_evnt_match :       std_logic;                              -- output of horizontal event comparator
signal hrom_en :            std_logic;                              -- EN input to horizontal ROM
signal h_region_rom :       hrgn_type;                              -- current horizontal region
signal h_next_region :      hrgn_type;                              -- next horizontal region
signal h_clr :              std_logic;                              -- clears the horizontal counter
signal usropt_rgn :         std_logic;                              -- horz region where h_region is affected by user_opt inputs
signal ceqpol_rgn :         std_logic;                              -- horz region where h_region is affected by ceq polarity
signal eav2_rgn :           std_logic;                              -- last two words of EAV
signal sav2_rgn :           std_logic;                              -- last two words of SAV
signal GND :                std_logic := '0';
signal VCC :                std_logic := '1';
signal GND4 :               std_logic_vector(3 downto 0) := "0000";
signal GND32 :              std_logic_vector(31 downto 0) := (others => '0');

begin
    ------------------------------------------------------------------------------
    -- Horizontal section
    --
    hrom_addr <= (std & pattern(0) & h_next_region);
    hrom_en <= ce and h_counter(0) and h_evnt_match;

    HROM : RAMB18SDP 
        -- Simulation initialization code HROM
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
        INIT       => X"00040FFFF",
        SRVAL      => X"00040FFFF",
        INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
        INIT_00 => X"00072F0800062C27000527E6000423A500031B24000216C3020112A2000009E1",
        INIT_01 => X"004F4FF0000E4FCF000D45EE000C3D2D000B3A4C000A378B000934AA000831E9",
        INIT_02 => X"00170010011650720115505611B47BA001937B9401127B730991503501905011",
        INIT_03 => X"015F0012001E0010001D0010001C0010001B0010001A00100019001000180010",
        INIT_04 => X"0007001000060010000500100004001000030010000200100001001000000010",
        INIT_05 => X"004F4FF0000E0010000D0010000C0010000B0010000A00100009001000080010",
        INIT_06 => X"00170010011650720115505611B47BBD01937B94011266D30991503501905011",
        INIT_07 => X"015F0012001E0010041D003C001C4FCF001B0010001A00100019001000180010",
        INIT_08 => X"000746880006424700053BE600043585000328A40002222302011BC200000EE1",
        INIT_09 => X"004F77F0000E77CF000D68EE000C5C0D000B57CC000A536B00094F2A00084AC9",
        INIT_0A => X"00170010011678720115785611B4ABC00193ABB40112AB930991783501907811",
        INIT_0B => X"015F0012001E0010001D0010001C0010001B0010001A00100019001000180010",
        INIT_0C => X"0007001000060010000500100004001000030010000200100001001000000010",
        INIT_0D => X"004F77F0000E0010000D0010000C0010000B0010000A00100009001000080010",
        INIT_0E => X"00170010011678720115785611B4ABDD0193ABB40112AB930991783501907811",
        INIT_0F => X"015F0012001E0010041D003C001C77CF001B0010001A00100019001000180010",
        INIT_10 => X"000746880006424700053BE600043585000328A40002222302011BC200000EE1",
        INIT_11 => X"004F77F0000E77CF000D68EE000C5C0D000B57CC000A536B00094F2A00084AC9",
        INIT_12 => X"00170010011678720115785611B4896001938954011289330991783501907811",
        INIT_13 => X"015F0012001E0010001D0010001C0010001B0010001A00100019001000180010",
        INIT_14 => X"0007001000060010000500100004001000030010000200100001001000000010",
        INIT_15 => X"004F77F0000E0010000D0010000C0010000B0010000A00100009001000080010",
        INIT_16 => X"00170010011678720115785611B4897D01938954011289330991783501907811",
        INIT_17 => X"015F0012001E0010041D003C001C77CF001B0010001A00100019001000180010",
        INIT_18 => X"000746880006424700053BE600043585000328A40002222302011BC200000EE1",
        INIT_19 => X"004F77F0000E77CF000D68EE000C5C0D000B57CC000A536B00094F2A00084AC9",
        INIT_1A => X"00170010011678720115785611B4A4E00193A4D40112A4B30991783501907811",
        INIT_1B => X"015F0012001E0010001D0010001C0010001B0010001A00100019001000180010",
        INIT_1C => X"0007001000060010000500100004001000030010000200100001001000000010",
        INIT_1D => X"004F77F0000E0010000D0010000C0010000B0010000A00100009001000080010",
        INIT_1E => X"00170010011678720115785611B4A4FD0193A4D40112A4B30991783501907811",
        INIT_1F => X"015F0012001E0010041D003C001C77CF001B0010001A00100019001000180010",
        INIT_20 => X"000746880006424700053BE600043585000328A40002222302011BC200000EE1",
        INIT_21 => X"004F77F0000E77CF000D68EE000C5C0D000B57CC000A536B00094F2A00084AC9",
        INIT_22 => X"00170010011678720115785611B4896001938954011289330991783501907811",
        INIT_23 => X"015F0012001E0010001D0010001C0010001B0010001A00100019001000180010",
        INIT_24 => X"0007001000060010000500100004001000030010000200100001001000000010",
        INIT_25 => X"004F77F0000E0010000D0010000C0010000B0010000A00100009001000080010",
        INIT_26 => X"00170010011678720115785611B4897D01938954011289330991783501907811",
        INIT_27 => X"015F0012001E0010041D003C001C77CF001B0010001A00100019001000180010",
        INIT_28 => X"000746880006424700053BE600043585000328A40002222302011BC200000EE1",
        INIT_29 => X"004F77F0000E77CF000D68EE000C5C0D000B57CC000A536B00094F2A00084AC9",
        INIT_2A => X"00170010011678720115785611B4A4E00193A4D40112A4B30991783501907811",
        INIT_2B => X"015F0012001E0010001D0010001C0010001B0010001A00100019001000180010",
        INIT_2C => X"0007001000060010000500100004001000030010000200100001001000000010",
        INIT_2D => X"004F77F0000E0010000D0010000C0010000B0010000A00100009001000080010",
        INIT_2E => X"00170010011678720115785611B4A4FD0193A4D40112A4B30991783501907811",
        INIT_2F => X"015F0012001E0010041D003C001C77CF001B0010001A00100019001000180010",
        INIT_30 => X"000746880006424700053BE600043585000328A40002222302011BC200000EE1",
        INIT_31 => X"004F77F0000E77CF000D68EE000C5C0D000B57CC000A536B00094F2A00084AC9",
        INIT_32 => X"00170010011678720115785611B4ABC00193ABB40112AB930991783501907811",
        INIT_33 => X"015F0012001E0010001D0010001C0010001B0010001A00100019001000180010",
        INIT_34 => X"0007001000060010000500100004001000030010000200100001001000000010",
        INIT_35 => X"004F77F0000E0010000D0010000C0010000B0010000A00100009001000080010",
        INIT_36 => X"00170010011678720115785611B4ABDD0193ABB40112AB930991783501907811",
        INIT_37 => X"015F0012001E0010041D003C001C77CF001B0010001A00100019001000180010",
        INIT_38 => X"00072F0800062C27000527E6000423A500031B24000216C3020112A2000009E1",
        INIT_39 => X"004F4FF0000E4FCF000D45EE000C3D2D000B3A4C000A378B000934AA000831E9",
        INIT_3A => X"00170010011650720115505611B46700019366F4011266D30991503501905011",
        INIT_3B => X"015F0012001E0010001D0010001C0010001B0010001A00100019001000180010",
        INIT_3C => X"0007001000060010000500100004001000030010000200100001001000000010",
        INIT_3D => X"004F4FF0000E0010000D0010000C0010000B0010000A00100009001000080010",
        INIT_3E => X"00170010011650720115505611B4671D019366F4011266D30991503501905011",
        INIT_3F => X"015F0012001E0010041D003C001C4FCF001B0010001A00100019001000180010"
        )

        port map (
            DO      => hrom_out,
            DOP     => open,
            RDADDR  => hrom_addr,
            RDCLK   => clk,
            DI      => GND32,
            DIP     => GND4,
            RDEN    => hrom_en,
            SSR     => rst,
            WE      => GND4,
            REGCE   => '1',
            WRADDR  => "000000000", 
            WRCLK   => '0',
            WREN    => '0'
        );

    h_next_region   <=  hrom_out(4 downto 0);
    h_next_evnt     <=  hrom_out(15 downto 5);
    h_region_rom    <=  hrom_out(20 downto 16);
    h_clr           <=  hrom_out(21);
    v_inc           <=  hrom_out(22);
    trs             <=  hrom_out(23);
    h               <=  hrom_out(24);
    usropt_rgn      <=  hrom_out(25);
    ceqpol_rgn      <=  hrom_out(26);
    eav2_rgn        <=  hrom_out(27);
    sav2_rgn        <=  hrom_out(28);


    --
    -- Horizontal counter
    --
    -- The horizontal counter increments every clock cycle unless the h_clr
    -- signal from the HROM is asserted, in which case, it resets to a value of
    -- 0.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            h_counter <= "111111111111";
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if h_clr = '1' and h_counter(0) = '1' then
                    h_counter <= (others => '0');
                else
                    h_counter <= h_counter + 1;
                end if;
            end if; 
        end if;
    end process;

    h_counter_lsb <= h_counter(0);

    --
    -- Horizontal event comparator
    --
    -- This signal is asserted when the h_next_evnt value from the HROM matches
    -- the 11 MSBs of the h_counter.
    --
    h_evnt_match <= '1' when h_next_evnt = h_counter(h_counter'high downto 1) else '0';

    --
    -- Horizontal region encoder
    -- 
    -- This encoder can change the horizontal region value coming out of the horz
    -- ROM before it is used to address the color ROM. The horizontal region is
    -- modified under 3 conditions. 
    --
    -- First, if the horizontal region is the first (leftmost) colorbar, then the 
    -- two user_opt inputs are applied to modify the horizontal region to affect 
    -- the color generated by the color ROM. 
    --
    -- Second, if the region is the first sample of first line of the first field 
    -- of an even frame and the cable equalization pattern is being drawn, then 
    -- the sample must be drawn differently in order to provide both DC levels of 
    -- the cable equalization pattern. The horizontal ROM will indicate this 
    -- region by generating a region code of HRGN_CEQ_POL_0. The encoder will 
    -- normally change this to HRGN_CEQ_POL_0, unless this is the first active 
    -- line of the first field of an even frame, in which case it will output 
    -- HRGN_CEQ_POL_1 to the color ROM.
    --
    -- Third, the color ROM needs to know the sense of the field bit in order to
    -- properly generate the XYZ word of EAVs and SAVs. The v_band does not carry
    -- the field information into the color ROM, so the field bit from the vertical
    -- ROM is used to modify the horizontal region during the second half of the
    -- EAV and SAV regions to indicate the status of the field bit.
    --
    process(user_opt, usropt_rgn, ceqpol_rgn, eav2_rgn, sav2_rgn, first_line, h_counter, f, h_region_rom)
    begin
        if usropt_rgn = '1' then
            case user_opt is
                when "01"   => h_region <= HRGN_USROPT1;
                when "10"   => h_region <= HRGN_USROPT2;
                when "11"   => h_region <= HRGN_USROPT3;
                when others => h_region <= HRGN_BAR1;
            end case;

        elsif ceqpol_rgn = '1' then
            if first_line = '1' and h_counter(1 downto 0) = "00" then
                h_region <= HRGN_CEQ_POL_1;
            else
                h_region <= HRGN_CEQ_POL_0;
            end if;

        elsif eav2_rgn = '1' then
            if f = '1' then
                h_region <= HRGN_EAV2_F1;
            else
                h_region <= HRGN_EAV2_F0;
            end if;

        elsif sav2_rgn = '1' then
            if f = '1' then
                h_region <= HRGN_SAV2_F1;
            else
                h_region <= HRGN_SAV2_F0;
            end if;

        else
            h_region <= h_region_rom;
        
        end if;
    end process;        

    --
    -- XYZ signal decoding
    --
    xyz <= (eav2_rgn or sav2_rgn) and h_counter(0);

end synth;