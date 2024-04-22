-------------------------------------------------------------------------------
--
-- Title       : int_fft_ifft_pair
-- Design      : FFT _+ IFFT (Scaled / Unscaled Fixed point)
-- Author      : Kapitanov Alexander
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-- Description : Main module for FFT/IFFT logic
--
-- Has several important constants:
--
--   NFFT           - (p) - Number of stages = log2(FFT LENGTH)
--   DATA_WIDTH     - (p) - Data width for signal imitator: 8-32 bits.
--   TWDL_WIDTH     - (p) - Data width for twiddle factor : 8-24/26 bits.
--   RAMB_TYPE      - (p) - Cross-commutation type: "WRAP" / "CONT"
--       "WRAP" - data valid strobe can be bursting (no need continuous valid),
--       "CONT" - data valid must be continuous (strobe length = N/2 points);
--
--   FLY_FWD        - (s) - Use butterflies into Forward FFT: 1 - TRUE, 0 - FALSE
--   FLY_INV        - (s) - Use butterflies into Inverse FFT: 1 - TRUE, 0 - FALSE
--   XSERIES        - (p) - FPGA Series: 
--       "NEW" - ULTRASCALE,
--       "OLD" - 6/7-SERIES;
--
--   USE_MLT        - (p) - Use Multiplier for calculation M_PI in Twiddle factor
--    MODE          - (p) - Select output data format and roun mode
--
--     - "UNSCALED" - Output width = Input width + log(N)
--     - "ROUNDING" - Output width = Input width, use round()
--     - "TRUNCATE" - Output width = Input width, use floor()
--
--    Old modes:
--        FORMAT    - (p) - 1 - Use Unscaled mode / 0 - Scaled (truncate) mode
--        RNDMODE   - (p) - 1 - Round, 0 - Floor, while (FORMAT = 0)
--
-- where: (p) - generic parameter, (s) -  input signal.
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
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;

use ieee.std_logic_textio.all;
use std.textio.all;

entity int_fft_ifft_pair is
    generic (
        TD           : time:=0.1ns;        --! Simulation time    
        NFFT         : integer:=16;        --! Number of FFT stages
        RAMB_TYPE    : string:="WRAP";     --! Cross-commutation type: WRAP / CONT
        -- MODE      : string:="UNSCALED"; --! Unscaled, Rounding, Truncate
        FORMAT       : integer:=1;         --! 1 - Uscaled, 0 - Scaled
        RNDMODE      : integer:=0;         --! 0 - Truncate, 1 - Rounding (FORMAT should be = 1)
        DATA_WIDTH   : integer:=16;        --! Data input width (8-32)
        TWDL_WIDTH   : integer:=16;        --! Data width for twiddle factor
        XSERIES      : string:="NEW";      --! FPGA family: for 6/7 series: "OLD"; for ULTRASCALE: "NEW";
        USE_MLT      : boolean:=FALSE      --! Use Multiplier for calculation M_PI in Twiddle factor
    );
    port (
        ---- Common ----
        RESET        : in  std_logic;    --! Global reset
        CLK          : in  std_logic;    --! DSP clock
        ---- Butterflies ----
        FLY_FWD      : in  std_logic;    --! Forward: '1' - use BFLY, '0' - don't use BFLY
        FLY_INV      : in  std_logic;    --! Inverse: '1' - use BFLY, '0' - don't use BFLY
        ---- Input data ----
        D0_RE        : in  std_logic_vector(DATA_WIDTH-1 downto 0); --! Real: 1'st data part [0:N/2)
        D1_RE        : in  std_logic_vector(DATA_WIDTH-1 downto 0); --! Real: 2'nd data part [N/2:N)
        D0_IM        : in  std_logic_vector(DATA_WIDTH-1 downto 0); --! Imag: 1'st data part [0:N/2)
        D1_IM        : in  std_logic_vector(DATA_WIDTH-1 downto 0); --! Imag: 2'nd data part [N/2:N)
        DI_EN        : in  std_logic;  --! Data enable strobe (valid)
        ---- Output data ----
        Q0_RE        : out std_logic_vector(DATA_WIDTH+FORMAT*2*NFFT-1 downto 0); --! Output Real: 1'st data part [0:N/2)
        Q1_RE        : out std_logic_vector(DATA_WIDTH+FORMAT*2*NFFT-1 downto 0); --! Output Real: 2'nd data part [N/2:N)
        Q0_IM        : out std_logic_vector(DATA_WIDTH+FORMAT*2*NFFT-1 downto 0); --! Output Imag: 1'st data part [0:N/2)
        Q1_IM        : out std_logic_vector(DATA_WIDTH+FORMAT*2*NFFT-1 downto 0); --! Output Imag: 2'nd data part [N/2:N) 
        QO_VL        : out std_logic  --! Output valid data
    );
end int_fft_ifft_pair;

architecture int_fft_ifft_pair of int_fft_ifft_pair is   

---------------- Input data ----------------
signal di_d0     : std_logic_vector(2*DATA_WIDTH-1 downto 0);
signal di_d1     : std_logic_vector(2*DATA_WIDTH-1 downto 0);
signal da_dt     : std_logic_vector(2*DATA_WIDTH-1 downto 0);
signal db_dt     : std_logic_vector(2*DATA_WIDTH-1 downto 0);

---------------- Forward FFT ----------------
signal di_re0    : std_logic_vector(DATA_WIDTH-1 downto 0);
signal di_im0    : std_logic_vector(DATA_WIDTH-1 downto 0);
signal di_re1    : std_logic_vector(DATA_WIDTH-1 downto 0);
signal di_im1    : std_logic_vector(DATA_WIDTH-1 downto 0);

signal do_re0    : std_logic_vector(FORMAT*NFFT+DATA_WIDTH-1 downto 0);
signal do_im0    : std_logic_vector(FORMAT*NFFT+DATA_WIDTH-1 downto 0);
signal do_re1    : std_logic_vector(FORMAT*NFFT+DATA_WIDTH-1 downto 0);
signal do_im1    : std_logic_vector(FORMAT*NFFT+DATA_WIDTH-1 downto 0);

signal di_ena    : std_logic;
signal do_val    : std_logic;

---------------- Inverse FFT ----------------
signal fi_re0    : std_logic_vector(FORMAT*NFFT+DATA_WIDTH-1 downto 0);
signal fi_im0    : std_logic_vector(FORMAT*NFFT+DATA_WIDTH-1 downto 0);
signal fi_re1    : std_logic_vector(FORMAT*NFFT+DATA_WIDTH-1 downto 0);
signal fi_im1    : std_logic_vector(FORMAT*NFFT+DATA_WIDTH-1 downto 0);

signal fo_re0    : std_logic_vector(FORMAT*2*NFFT+DATA_WIDTH-1 downto 0);
signal fo_im0    : std_logic_vector(FORMAT*2*NFFT+DATA_WIDTH-1 downto 0);
signal fo_re1    : std_logic_vector(FORMAT*2*NFFT+DATA_WIDTH-1 downto 0);
signal fo_im1    : std_logic_vector(FORMAT*2*NFFT+DATA_WIDTH-1 downto 0);

signal fi_ena    : std_logic;
signal fo_val    : std_logic;

---------------- Shuffle data ----------------
signal dt_int0   : std_logic_vector(2*(FORMAT*2*NFFT+DATA_WIDTH)-1 downto 0);    
signal dt_int1   : std_logic_vector(2*(FORMAT*2*NFFT+DATA_WIDTH)-1 downto 0);    
signal dt_en01   : std_logic;

---------------- Output data ----------------
signal dt_rev0   : std_logic_vector(2*(FORMAT*2*NFFT+DATA_WIDTH)-1 downto 0);    
signal dt_rev1   : std_logic_vector(2*(FORMAT*2*NFFT+DATA_WIDTH)-1 downto 0);    
signal dt_vl01   : std_logic;

begin

di_d0 <= D0_IM & D0_RE;
di_d1 <= D1_IM & D1_RE;

-------------------- INPUT BUFFER --------------------
xCONT_IN: if (RAMB_TYPE = "CONT") generate
    xIN_BUF: entity work.iobuf_flow_int2
        generic map (
            BITREV     => FALSE,
            ADDR       => NFFT,
            DATA       => 2*DATA_WIDTH
        )    
        port map (
            clk        => clk,
            rst        => reset,

            dt_int0    => di_d0,
            dt_int1    => di_d1,
            dt_en01    => di_en,

            dt_rev0    => da_dt,
            dt_rev1    => db_dt,
            dt_vl01    => di_ena
        );
end generate;

xWRAP_IN: if (RAMB_TYPE = "WRAP") generate
    xIN_BUF: entity work.iobuf_wrap_int2
        generic map (
            BITREV     => FALSE,
            ADDR       => NFFT,
            DATA       => 2*DATA_WIDTH
        )    
        port map (
            clk        => clk,
            rst        => reset,

            dt_int0    => di_d0,
            dt_int1    => di_d1,
            dt_en01    => di_en,

            dt_rev0    => da_dt,
            dt_rev1    => db_dt,
            dt_vl01    => di_ena
        );
end generate;

di_re0 <= da_dt(1*DATA_WIDTH-1 downto 0*DATA_WIDTH);
di_im0 <= da_dt(2*DATA_WIDTH-1 downto 1*DATA_WIDTH);
di_re1 <= db_dt(1*DATA_WIDTH-1 downto 0*DATA_WIDTH);
di_im1 <= db_dt(2*DATA_WIDTH-1 downto 1*DATA_WIDTH);

------------------ FFTK_N (FORWARD FFT) --------------------
xFFT: entity work.int_fftNk
    generic map (
        -- IS_SIM        => FALSE,
        NFFT          => NFFT,
        -- MODE          => MODE,
        FORMAT        => FORMAT,
        RNDMODE       => RNDMODE,
        RAMB_TYPE     => RAMB_TYPE,
        DATA_WIDTH    => DATA_WIDTH,
        TWDL_WIDTH    => TWDL_WIDTH,
        XSER          => XSERIES,
        USE_MLT       => USE_MLT
    )
    port map (
        DI_RE0        => di_re0,
        DI_IM0        => di_im0,
        DI_RE1        => di_re1,
        DI_IM1        => di_im1,
        DI_ENA        => di_ena,

        USE_FLY       => fly_fwd,

        DO_RE0        => do_re0,
        DO_IM0        => do_im0,
        DO_RE1        => do_re1,
        DO_IM1        => do_im1,
        DO_VAL        => do_val,

        RST           => reset, 
        CLK           => clk
    );

------------------ FFTK_N (FORWARD FFT) --------------------
pr_clk: process(clk) is
begin
    if rising_edge(clk) then
        fi_re0 <= do_re0;
        fi_im0 <= do_im0;
        fi_re1 <= do_re1;
        fi_im1 <= do_im1;
        fi_ena <= do_val;
    end if;
end process;

xIFFT: entity work.int_ifftNk
    generic map (
        -- IS_SIM        => FALSE,
        NFFT          => NFFT,
        -- MODE          => MODE,
        FORMAT        => FORMAT,
        RNDMODE       => RNDMODE,
        RAMB_TYPE     => RAMB_TYPE,
        DATA_WIDTH    => DATA_WIDTH+FORMAT*NFFT,
        TWDL_WIDTH    => TWDL_WIDTH,
        XSER          => XSERIES,
        USE_MLT       => USE_MLT
    )
    port map (
        DI_RE0        => fi_re0,
        DI_IM0        => fi_im0,
        DI_RE1        => fi_re1,
        DI_IM1        => fi_im1,
        DI_ENA        => fi_ena,

        USE_FLY       => fly_inv,

        DO_RE0        => fo_re0,
        DO_IM0        => fo_im0,
        DO_RE1        => fo_re1,
        DO_IM1        => fo_im1,
        DO_VAL        => fo_val,

        RST           => reset, 
        CLK           => clk
    );

-------------------- SHUFFLE BUFFER --------------------
dt_int0 <= fo_im0 & fo_re0;
dt_int1 <= fo_im1 & fo_re1;
dt_en01 <= fo_val;

xCONT_OUT: if (RAMB_TYPE = "CONT") generate
    xSHL_OUT: entity work.iobuf_flow_int2 
        generic map (
            BITREV     => TRUE,
            ADDR       => NFFT,
            DATA       => 2*(FORMAT*2*NFFT+DATA_WIDTH)
        )
        port map (
            clk        => clk,
            rst        => reset,

            dt_int0    => dt_int0,
            dt_int1    => dt_int1,
            dt_en01    => dt_en01,

            dt_rev0    => dt_rev0,
            dt_rev1    => dt_rev1,
            dt_vl01    => dt_vl01
        );
end generate;

xWRAP_OUT: if (RAMB_TYPE = "WRAP") generate
    xSHL_OUT: entity work.iobuf_wrap_int2
        generic map (
            BITREV      => TRUE,
            ADDR        => NFFT,
            DATA        => 2*(FORMAT*2*NFFT+DATA_WIDTH)
        )    
        port map (
            clk         => clk,
            rst         => reset,

            dt_int0     => dt_int0,
            dt_int1     => dt_int1,
            dt_en01     => dt_en01,

            dt_rev0     => dt_rev0,
            dt_rev1     => dt_rev1,
            dt_vl01     => dt_vl01
        );
end generate;

Q0_RE <= dt_rev0(1*(FORMAT*2*NFFT+DATA_WIDTH)-1 downto 0*(FORMAT*2*NFFT+DATA_WIDTH));
Q1_RE <= dt_rev1(2*(FORMAT*2*NFFT+DATA_WIDTH)-1 downto 1*(FORMAT*2*NFFT+DATA_WIDTH));
Q0_IM <= dt_rev0(1*(FORMAT*2*NFFT+DATA_WIDTH)-1 downto 0*(FORMAT*2*NFFT+DATA_WIDTH));
Q1_IM <= dt_rev1(2*(FORMAT*2*NFFT+DATA_WIDTH)-1 downto 1*(FORMAT*2*NFFT+DATA_WIDTH));
QO_VL <= dt_vl01;

end int_fft_ifft_pair;