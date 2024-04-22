-------------------------------------------------------------------------------
--
-- Title       : int_cmult_dsp48
-- Design      : FFTK
-- Author      : Kapitanov
-- Company     :
--
-- Description : Integer complex multiplier on DSP48 block
--
-------------------------------------------------------------------------------
--
--    Version 1.0: 13.02.2018
--
--  Description: Simple complex multiplier by DSP48 unit
--
--  Math:
--
--  Out:    In:
--  DO_RE = DI_RE * WW_RE - DI_IM * WW_IM;
--  DO_IM = DI_RE * WW_IM + DI_IM * WW_RE;
--
--    Input variables:
--    1. DTW - DSP48 input width (from 8 to 48): data width + FFT stage
--    2. TWD - DSP48 input width (from 8 to 24): data width + FFT stage
--    3. XSER - Xilinx series: 
--        "NEW" - DSP48E2 (Ultrascale), 
--        "OLD" - DSP48E1 (6/7-series).
--
--  DSP48 data signals:
--    A port - In B data (MSB part),
--    B port - In B data (LSB part),
--    C port - In A data,
--    P port - Output data: P = C +/- A*B 
--
--  IF (TWD < 19)
--      IF (DTW < 26) and (DTW < 18)
--          use single DSP48 for mult operation*
--      ELSE IF (DTW > 25) and (DTW < 43) 
--          use double DSP48 for mult operation**
--      ELSE
--          use triple DSP48 for mult operation
--
--  IF (TWD > 18) and (TWD < 26)
--      IF (DTW < 19)
--          use single DSP48 for mult operation
--      ELSE IF (DTW > 18) and (DTW < 34) 
--          use double DSP48 for mult operation***
--      ELSE
--          use triple DSP48 for mult operation
--
-- *   - 25 bit for DSP48E1, 27 bit for DSP48E2,
-- **  - 43 bit for DSP48E1, 45 bit for DSP48E2,
-- *** - 34 bit for DSP48E1, 35 bit for DSP48E2;
--
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--    GNU GENERAL PUBLIC LICENSE
--  Version 3, 29 June 2007
--
--    Copyright (c) 2018 Kapitanov Alexander
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
--  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
--  APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT 
--  HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY 
--  OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, 
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
--  PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM 
--  IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF 
--  ALL NECESSARY SERVICING, REPAIR OR CORRECTION. 
-- 
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.DSP48E1;
use unisim.vcomponents.DSP48E2;

entity int_cmult_dsp48 is
    generic (      
        DTW       : natural:=29;    --! Input data width
        TWD       : natural:=17;    --! Twiddle factor data width
        XSER      : string :="NEW"  --! Xilinx series: NEW - DSP48E2, OLD - DSP48E1
    );
    port (
        DI_RE     : in  std_logic_vector(DTW-1 downto 0); --! Real input data
        DI_IM     : in  std_logic_vector(DTW-1 downto 0); --! Imag input data
        WW_RE     : in  std_logic_vector(TWD-1 downto 0); --! Real twiddle factor
        WW_IM     : in  std_logic_vector(TWD-1 downto 0); --! Imag twiddle factor

        DO_RE     : out std_logic_vector(DTW-1 downto 0); --! Real output data
        DO_IM     : out std_logic_vector(DTW-1 downto 0); --! Imag output data

        RST       : in  std_logic; --! Global reset
        CLK       : in  std_logic  --! Math clock    
    );
end int_cmult_dsp48;

architecture int_cmult_dsp48 of int_cmult_dsp48 is

---------------- Calculate Data Width --------
function find_sngl_18(var : string) return natural is
    variable ret_val : natural:=0;
begin
    if (var = "NEW") then 
        ret_val := 28;
    elsif (var = "OLD") then 
        ret_val := 26;
    else 
        ret_val := 0;
    end if;
    return ret_val; 
end function find_sngl_18;

function find_dbl_18(var : string) return natural is
    variable ret_val : natural:=0;
begin
    if (var = "NEW") then 
        ret_val := 45;
    elsif (var = "OLD") then 
        ret_val := 43;
    else 
        ret_val := 0;
    end if;
    return ret_val; 
end function find_dbl_18;

function find_trpl_18(var : string) return natural is
    variable ret_val : natural:=0;
begin
    if (var = "NEW") then 
        ret_val := 79;
    elsif (var = "OLD") then 
        ret_val := 77;
    else 
        ret_val := 0;
    end if;
    return ret_val; 
end function find_trpl_18;

constant DTW18_SNGL     : integer:=find_sngl_18(XSER);
constant DTW18_DBL      : integer:=find_dbl_18(XSER);
constant DTW18_TRPL     : integer:=find_trpl_18(XSER);

function find_twd_25(var : string) return natural is
    variable ret_val : natural:=0;
begin
    if (var = "NEW") then 
        ret_val := 28;
    elsif (var = "OLD") then 
        ret_val := 26;
    else 
        ret_val := 0;
    end if;
    return ret_val; 
end function find_twd_25;

constant TWD_DSP  : integer:=find_twd_25(XSER);

signal D_RE       : std_logic_vector(DTW-1 downto 0);
signal D_IM       : std_logic_vector(DTW-1 downto 0);

begin

DO_RE <= D_RE;
DO_IM <= D_IM;

---- Twiddle factor width less than 19 ----
xGEN_TWD18: if (TWD < 19) generate
    ---- Data width from 8 to 25/27 ----
    xGEN_SNGL: if (DTW < DTW18_SNGL) generate
        signal P_RE : std_logic_vector(47 downto 0);
        signal P_IM : std_logic_vector(47 downto 0);
    begin
    
        D_RE <= P_RE(DTW+TWD-2 downto TWD-1);
        D_IM <= P_IM(DTW+TWD-2 downto TWD-1);

        xMDSP_RE: entity work.int_cmult18x25_dsp48
            generic map (
                MAW       => DTW,
                MBW       => TWD,
                XALU      => "SUB",
                XSER      => XSER
            )
            port map (
                M1_AA     => DI_IM,
                M1_BB     => WW_IM,
                M2_AA     => DI_RE,
                M2_BB     => WW_RE,
                MP_12     => P_RE,
                RST       => RST,
                CLK       => CLK
            );

        xMDSP_IM: entity work.int_cmult18x25_dsp48
            generic map (
                MAW       => DTW,
                MBW       => TWD,
                XALU      => "ADD",
                XSER      => XSER
            )
            port map (
                M1_AA     => DI_IM,
                M1_BB     => WW_RE,
                M2_AA     => DI_RE,
                M2_BB     => WW_IM,
                MP_12     => P_IM,
                RST       => RST,
                CLK       => CLK
            );
    end generate;

    ---- Data width from 25/27 to 42/44 ----
    xGEN_DBL: if (DTW > DTW18_SNGL-1) and (DTW < DTW18_DBL) generate
        xMDSP_RE: entity work.int_cmult_dbl18_dsp48
            generic map (
                MAW       => DTW,
                MBW       => TWD,
                XALU      => "SUB",
                XSER      => XSER
            )
            port map (
                M1_AA     => DI_IM,
                M1_BB     => WW_IM,
                M2_AA     => DI_RE,
                M2_BB     => WW_RE,

                MP_12     => D_RE,
                RST       => RST,
                CLK       => CLK
            );

        xMDSP_IM: entity work.int_cmult_dbl18_dsp48
            generic map (  
                MAW       => DTW,
                MBW       => TWD,
                XALU      => "ADD",
                XSER      => XSER
            )
            port map (
                M1_AA     => DI_IM,
                M1_BB     => WW_RE,
                M2_AA     => DI_RE,
                M2_BB     => WW_IM,

                MP_12     => D_IM,
                RST       => RST,
                CLK       => CLK
            );
    end generate;

    ---- Data width from 42/44 to 59/61 ----
    xGEN_TRPL: if (DTW > DTW18_DBL-1) and (DTW < DTW18_TRPL) generate 
        xMDSP_RE: entity work.int_cmult_trpl18_dsp48
            generic map (
                MAW       => DTW,
                MBW       => TWD,
                XALU      => "SUB",
                XSER      => XSER
            )
            port map (
                M1_AA     => DI_IM,
                M1_BB     => WW_IM,
                M2_AA     => DI_RE,
                M2_BB     => WW_RE,

                MP_12     => D_RE,
                RST       => RST,
                CLK       => CLK
            );

        xMDSP_IM: entity work.int_cmult_trpl18_dsp48
            generic map (
                MAW       => DTW,
                MBW       => TWD,
                XALU      => "ADD",
                XSER      => XSER
            )
            port map (
                M1_AA     => DI_IM,
                M1_BB     => WW_RE,
                M2_AA     => DI_RE,
                M2_BB     => WW_IM,

                MP_12     => D_IM,
                RST       => RST,
                CLK       => CLK
            );    
    end generate;
end generate;

---- Twiddle factor width more than 18 and less than 25/27 ----
xGEN_TWD25: if ((TWD > 18) and (TWD < TWD_DSP)) generate
    ---- Data width from 8 to 18 ----
    xGEN_SNGL: if (DTW < 19) generate
        signal P_RE : std_logic_vector(47 downto 0);
        signal P_IM : std_logic_vector(47 downto 0);
    begin

        -- D_RE <= P_RE(DTW+TWD-2 downto TWD-1);
        -- D_IM <= P_IM(DTW+TWD-2 downto TWD-1);
        D_RE <= P_RE(DTW+TWD-3 downto TWD-2);
        D_IM <= P_IM(DTW+TWD-3 downto TWD-2);
        
        xMDSP_RE: entity work.int_cmult18x25_dsp48
            generic map (
                MAW       => TWD,
                MBW       => DTW,
                XALU      => "SUB",
                XSER      => XSER
            )
            port map (
                M1_AA     => WW_IM,
                M1_BB     => DI_IM,
                M2_AA     => WW_RE,
                M2_BB     => DI_RE,

                MP_12     => P_RE,
                RST       => RST,
                CLK       => CLK
            );

        xMDSP_IM: entity work.int_cmult18x25_dsp48
            generic map (           
                MAW       => TWD,
                MBW       => DTW,
                XALU      => "ADD",
                XSER      => XSER
            )
            port map (
                M1_AA     => WW_RE,
                M1_BB     => DI_IM,
                M2_AA     => WW_IM,
                M2_BB     => DI_RE,

                MP_12     => P_IM,
                RST       => RST,
                CLK       => CLK
            );
    end generate;

    ---- Data width from 18 to 35 ----
    xGEN_DBL: if (DTW > 18) and (DTW < 36) generate
        xMDSP_RE: entity work.int_cmult_dbl35_dsp48
            generic map (
                MAW       => DTW,
                MBW       => TWD,
                XALU      => "SUB",
                XSER      => XSER
            )
            port map (
                M1_AA     => DI_IM,
                M1_BB     => WW_IM,
                M2_AA     => DI_RE,
                M2_BB     => WW_RE,

                MP_12     => D_RE,
                RST       => RST,
                CLK       => CLK
            );

        xMDSP_IM: entity work.int_cmult_dbl35_dsp48
            generic map (
                MAW       => DTW,
                MBW       => TWD,
                XALU      => "ADD",
                XSER      => XSER
            )
            port map (
                M1_AA     => DI_IM,
                M1_BB     => WW_RE,
                M2_AA     => DI_RE,
                M2_BB     => WW_IM,

                MP_12     => D_IM,
                RST       => RST,
                CLK       => CLK
            );
    end generate;
 
    ---- Data width from 35 to 52 ----
    xGEN_TRPL: if (DTW > 35) and (DTW < 53) generate
        
        xMDSP_RE: entity work.int_cmult_trpl52_dsp48
            generic map (
                MAW       => DTW,
                MBW       => TWD,
                XALU      => "SUB",
                XSER      => XSER
            )
            port map (
                M1_AA     => DI_IM,
                M1_BB     => WW_IM,
                M2_AA     => DI_RE,
                M2_BB     => WW_RE,

                MP_12     => D_RE,
                RST       => RST,
                CLK       => CLK
            );

        xMDSP_IM: entity work.int_cmult_trpl52_dsp48
            generic map (
                MAW       => DTW,
                MBW       => TWD,
                XALU      => "ADD",
                XSER      => XSER
            )
            port map (
                M1_AA     => DI_IM,
                M1_BB     => WW_RE,
                M2_AA     => DI_RE,
                M2_BB     => WW_IM,

                MP_12     => D_IM,
                RST       => RST,
                CLK       => CLK
            );    
    end generate;
end generate;

end int_cmult_dsp48;