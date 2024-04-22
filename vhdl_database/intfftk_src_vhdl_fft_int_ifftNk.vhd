-------------------------------------------------------------------------------
--
-- Title       : int_ifftNk
-- Design      : Integer Inverse FFTK
-- Author      : Kapitanov Alexander
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-------------------------------------------------------------------------------
--
-- Description : Integer Unscaled / Scaled Forward Fast Fourier Transform: 
--               N = 8 to 512K (points of data)        
--               For N > 512K you should use 2D-FFT scheme
--
--    Input data: IN0 and IN1 where
--      IN0 - Even part of data
--      IN1 - Odd part of data flow
--    
--    Output data: OUT0 and OUT1 where
--      OUT0 - 1st half part of data
--      OUT1 - 2nd half part of data flow (length = NFFT)
--
--    RAMB_TYPE:
--        > CONT MODE: Clock enable (Input data valid) must be cont. strobe 
--        N = 2^(NFFT) cycles w/o interruption!!!
--        > WRAP MODE: Clock enable (Input data valid) can be bursting
--
--    RAMB_TYPE - Cross-commutation type: "WRAP" / "CONT"
--       "WRAP" - data valid strobe can be bursting (no need continuous valid),
--       "CONT" - data valid must be continuous (strobe length = N/2 points);
--
--      Example Wrapped Mode: 
--        Input data:   ________________________
--        DI_EN     ___/                        \____
--        DI_AA:        /0\/1\/2\/3\/4\/5\/6\/7\
--        DI_BB:        \8/\9/\A/\B/\C/\D/\E/\F/
-- 
--    FORMAT: 1 - Unscaled, 0 - Scaled data output
--    RNDMODE : 1 - Rounding (round), 0 - Truncate (floor)
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--  GNU GENERAL PUBLIC LICENSE
--  Version 3, 29 June 2007
--  
--  Copyright (c) 2018 Kapitanov Alexander
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

entity int_ifftNk is
    generic (
        -- IS_SIM      : boolean:=FALSE;        --! Simulation model: TRUE / FALSE
        NFFT        : integer:=5;            --! Number of FFT stages
        -- MODE        : string:="UNSCALED"; --! Unscaled, Rounding, Truncate modes
        FORMAT      : integer:=1;            --! 1 - Uscaled, 0 - Scaled
        RNDMODE     : integer:=0;            --! 0 - Truncate, 1 - Rounding (FORMAT should be = 1)
        RAMB_TYPE   : string:="WRAP";        --! Cross-commutation type: WRAP / CONT
        DATA_WIDTH  : integer:=16;           --! Input data width
        TWDL_WIDTH  : integer:=16;           --! Twiddle factor data width    
        XSER        : string:="OLD";         --! FPGA family: for 6/7 series: "OLD"; for ULTRASCALE: "NEW";
        USE_MLT     : boolean:=FALSE         --! Use multipliers in Twiddle factors
    );
    port (
        RST         : in  std_logic;         --! Global positive RST 
        CLK         : in  std_logic;         --! Signal processing clock 

        USE_FLY     : in  std_logic;         --! '1' - use arithmetics, '0' - don't use

        DI_RE0      : in  std_logic_vector(DATA_WIDTH-1 downto 0); --! Input data Even Re
        DI_IM0      : in  std_logic_vector(DATA_WIDTH-1 downto 0); --! Input data Even Im
        DI_RE1      : in  std_logic_vector(DATA_WIDTH-1 downto 0); --! Input data Odd Re
        DI_IM1      : in  std_logic_vector(DATA_WIDTH-1 downto 0); --! Input data Odd Im
        DI_ENA      : in  std_logic; --! Input valid data

        DO_RE0      : out std_logic_vector(FORMAT*NFFT+DATA_WIDTH-1 downto 0); --! Output data Even Re
        DO_IM0      : out std_logic_vector(FORMAT*NFFT+DATA_WIDTH-1 downto 0); --! Output data Even Im
        DO_RE1      : out std_logic_vector(FORMAT*NFFT+DATA_WIDTH-1 downto 0); --! Output data Odd Re
        DO_IM1      : out std_logic_vector(FORMAT*NFFT+DATA_WIDTH-1 downto 0); --! Output data Odd Im
        DO_VAL      : out std_logic --! Output valid data
    );
end int_ifftNk;

architecture int_ifftNk of int_ifftNk is    

--function set_mode(inmod: string) return integer is
-- begin
    -- if    (inmod = "UNSCALED") then return  2;
    -- elsif (inmod = "ROUNDING") then return  1;
    -- elsif (inmod = "TRUNCATE") then return  0;
    -- else                            return -1;
    -- end if;
-- end function;

-- constant FORMAT    : integer:=set_mode(MODE)/2;
-- constant RNDMOD    : integer:=(set_mode(MODE) mod 2);

type complex_WxN is array (NFFT-1 downto 0) of std_logic_vector(FORMAT*NFFT+DATA_WIDTH-1 downto 0);

function scale_mode(dat: integer) return integer is
    variable ret : integer:=0;
begin
    if (dat = 0) then ret := 1; else ret := 0; end if;
    return ret; 
end function;

constant SCALE      : integer:=scale_mode(FORMAT);

-------- Butterfly In / Out --------
signal ia_re        : complex_WxN := (others => (others => '0'));
signal ia_im        : complex_WxN := (others => (others => '0'));
signal ib_re        : complex_WxN := (others => (others => '0'));
signal ib_im        : complex_WxN := (others => (others => '0'));

signal oa_re        : complex_WxN := (others => (others => '0'));
signal oa_im        : complex_WxN := (others => (others => '0'));
signal ob_re        : complex_WxN := (others => (others => '0'));
signal ob_im        : complex_WxN := (others => (others => '0'));

-------- Align data --------
signal sa_re        : complex_WxN := (others => (others => '0'));
signal sa_im        : complex_WxN := (others => (others => '0'));
signal sb_re        : complex_WxN := (others => (others => '0'));
signal sb_im        : complex_WxN := (others => (others => '0'));

-------- Mux'ed data flow (fly_ena) --------
signal xa_re        : complex_WxN := (others => (others => '0'));
signal xa_im        : complex_WxN := (others => (others => '0'));
signal xb_re        : complex_WxN := (others => (others => '0'));
signal xb_im        : complex_WxN := (others => (others => '0'));

-------- Enables --------
signal ab_en        : std_logic_vector(NFFT-1 downto 0);
signal ab_vl        : std_logic_vector(NFFT-1 downto 0);
signal ss_en        : std_logic_vector(NFFT-1 downto 0);
signal xx_vl        : std_logic_vector(NFFT-1 downto 0);

-------- Delay data Cross-commutation --------
type complex_DxN is array (NFFT-2 downto 0) of std_logic_vector(FORMAT*2*NFFT+2*DATA_WIDTH-1 downto 0);

signal di_aa        : complex_DxN := (others => (others => '0'));
signal di_bb        : complex_DxN := (others => (others => '0'));  
signal do_aa        : complex_DxN := (others => (others => '0'));
signal do_bb        : complex_DxN := (others => (others => '0'));

signal di_en        : std_logic_vector(NFFT-2 downto 0);
signal do_en        : std_logic_vector(NFFT-2 downto 0);

-------- Twiddle factor --------
type complex_FxN is array (NFFT-1 downto 0) of std_logic_vector(TWDL_WIDTH-1 downto 0);
signal ww_re        : complex_FxN;
signal ww_im        : complex_FxN;
signal ww_en        : std_logic_vector(NFFT-1 downto 0);

begin

ab_en(0) <= DI_ENA;
ia_re(0)(DATA_WIDTH-1 downto 0) <= DI_RE0;
ia_im(0)(DATA_WIDTH-1 downto 0) <= DI_IM0;
ib_re(0)(DATA_WIDTH-1 downto 0) <= DI_RE1;
ib_im(0)(DATA_WIDTH-1 downto 0) <= DI_IM1;

xCALC: for ii in 0 to NFFT-1 generate
begin
    ---- Butterflies ----
    xBUTTERFLY: entity work.int_dit2_fly
        generic map ( 
            -- IS_SIM   => IS_SIM,
            STAGE    => ii,
            SCALE    => SCALE,
            RNDMODE  => RNDMODE,
            DTW      => DATA_WIDTH+ii*FORMAT,
            TFW      => TWDL_WIDTH,
            XSER     => XSER
        )
        port map (
            IA_RE    => sa_re(ii)(DATA_WIDTH-1+ii*FORMAT downto 0),
            IA_IM    => sa_im(ii)(DATA_WIDTH-1+ii*FORMAT downto 0),
            IB_RE    => sb_re(ii)(DATA_WIDTH-1+ii*FORMAT downto 0),
            IB_IM    => sb_im(ii)(DATA_WIDTH-1+ii*FORMAT downto 0),
            IN_EN    => ss_en(ii),

            OA_RE    => oa_re(ii)(DATA_WIDTH-1+(ii+1)*FORMAT downto 0),
            OA_IM    => oa_im(ii)(DATA_WIDTH-1+(ii+1)*FORMAT downto 0),
            OB_RE    => ob_re(ii)(DATA_WIDTH-1+(ii+1)*FORMAT downto 0),
            OB_IM    => ob_im(ii)(DATA_WIDTH-1+(ii+1)*FORMAT downto 0),
            DO_VL    => ab_vl(ii),
            
            WW_RE    => ww_re(ii),
            WW_IM    => ww_im(ii),
            
            RST      => rst,
            clk      => clk
        ); 
        
    ---- Twiddle factor ----

    xTWIDDLE: entity work.rom_twiddle_int
        generic map (
            AWD      => TWDL_WIDTH,
            NFFT     => NFFT,
            STAGE    => ii,
            XSER     => XSER,
            USE_MLT  => USE_MLT
        )
        port map (
            CLK      => clk,
            RST      => rst,
            WW_EN    => ww_en(ii),
            WW_RE    => ww_re(ii),
            WW_IM    => ww_im(ii)
        );

    ---- Aligne data for butterfly calc ----
    xALIGNE: entity work.int_align_ifft 
        generic map (
            DATW     => DATA_WIDTH+ii*FORMAT,
            NFFT     => NFFT,
            STAGE    => ii
        )
        port map (
            CLK      => clk,
            IA_RE    => ia_re(ii)(DATA_WIDTH-1+ii*FORMAT downto 0),
            IA_IM    => ia_im(ii)(DATA_WIDTH-1+ii*FORMAT downto 0),
            IB_RE    => ib_re(ii)(DATA_WIDTH-1+ii*FORMAT downto 0),
            IB_IM    => ib_im(ii)(DATA_WIDTH-1+ii*FORMAT downto 0),

            OA_RE    => sa_re(ii)(DATA_WIDTH-1+ii*FORMAT downto 0),
            OA_IM    => sa_im(ii)(DATA_WIDTH-1+ii*FORMAT downto 0),
            OB_RE    => sb_re(ii)(DATA_WIDTH-1+ii*FORMAT downto 0),
            OB_IM    => sb_im(ii)(DATA_WIDTH-1+ii*FORMAT downto 0),

            BF_EN    => ab_en(ii),
            BF_VL    => ss_en(ii),
            TW_EN    => ww_en(ii)
        );

    ---- select input delay data ----
    pr_xd: process(clk) is
    begin
        if rising_edge(clk) then
            if (USE_FLY = '1') then
                xx_vl(ii) <= ab_vl(ii);
                xa_re(ii) <= oa_re(ii);
                xa_im(ii) <= oa_im(ii);
                xb_re(ii) <= ob_re(ii);
                xb_im(ii) <= ob_im(ii);
            else        
                xx_vl(ii) <= ab_en(ii);
                xa_re(ii) <= ia_re(ii);
                xa_im(ii) <= ia_im(ii);
                xb_re(ii) <= ib_re(ii);
                xb_im(ii) <= ib_im(ii);
            end if;
        end if;
    end process;
    
end generate;

xDELAYS: for ii in 0 to NFFT-2 generate
        constant DW : integer:=(DATA_WIDTH+(ii+1)*FORMAT);
    begin
    
    di_aa(ii)(2*DW-1 downto 0) <= xa_im(ii)(DW-1 downto 0) & xa_re(ii)(DW-1 downto 0);    
    di_bb(ii)(2*DW-1 downto 0) <= xb_im(ii)(DW-1 downto 0) & xb_re(ii)(DW-1 downto 0);    
    di_en(ii) <= xx_vl(ii);
    
    xCONT_IN: if (RAMB_TYPE = "CONT") generate
        xDELAY_LINE : entity work.int_delay_line
            generic map(
                NWIDTH   => 2*DW,
                NFFT     => NFFT,
                STAGE    => NFFT-ii-2    
            )
            port map (
                DI_AA    => di_aa(ii)(2*DW-1 downto 0),
                DI_BB    => di_bb(ii)(2*DW-1 downto 0),
                DI_EN    => di_en(ii),  
                DO_AA    => do_aa(ii)(2*DW-1 downto 0),
                DO_BB    => do_bb(ii)(2*DW-1 downto 0),
                DO_VL    => do_en(ii),
                RST      => rst,
                CLK      => clk
            );
    end generate;
    xWRAP_IN: if (RAMB_TYPE = "WRAP") generate    
        xDELAY_LINE : entity work.int_delay_wrap
            generic map(
                NWIDTH   => 2*DW,
                NFFT     => NFFT,
                STAGE    => NFFT-ii-2
            )
            port map (
                DI_AA     => di_aa(ii)(2*DW-1 downto 0),
                DI_BB     => di_bb(ii)(2*DW-1 downto 0),
                DI_EN     => di_en(ii),  
                DO_AA     => do_aa(ii)(2*DW-1 downto 0),
                DO_BB     => do_bb(ii)(2*DW-1 downto 0),
                DO_VL     => do_en(ii),
                RST       => rst,
                CLK       => clk
            );
    end generate;

    ia_re(ii+1)(DW-1 downto 0) <= do_aa(ii)(1*DW-1 downto 0*DW);
    ia_im(ii+1)(DW-1 downto 0) <= do_aa(ii)(2*DW-1 downto 1*DW);
    ib_re(ii+1)(DW-1 downto 0) <= do_bb(ii)(1*DW-1 downto 0*DW);
    ib_im(ii+1)(DW-1 downto 0) <= do_bb(ii)(2*DW-1 downto 1*DW);
    ab_en(ii+1) <= do_en(ii); 
end generate;

pr_out: process(clk) is
begin
    if rising_edge(clk) then
        DO_RE0 <= xa_re(NFFT-1);
        DO_IM0 <= xa_im(NFFT-1);
        DO_RE1 <= xb_re(NFFT-1);
        DO_IM1 <= xb_im(NFFT-1);
        DO_VAL <= xx_vl(NFFT-1);
    end if;
end process;

end int_ifftNk;