-------------------------------------------------------------------------------
--
-- Title       : rom_twiddle_gen
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     :
--
-- Description : FP/INT twiddle factor with Taylor stages
--
-------------------------------------------------------------------------------
--
--  Version 1.0  22.05.2015
--               Description: Twiddle factor (coeffs) in ROM/RAM for FFT/IFFT.
--  
--  Version 2.0  14.07.2015
--               Description: Twiddle factor has the Taylor ROM calculation 
--                              This math code uses several DSP48 slices and
--                              fix RAMBs (3 for FP24 format).
--       
--  Version 3.0  12.08.2016
--               Description: You can choose INT of FP COE data for TWIDDLE.
--                   
--  Version 3.1  18.08.2016
--               Description: You don't need to create ROM file for twiddle.
--                              Trig func can be calculated with MATH package
--
--  Version 3.2  04.09.2016
--               Description: Improved logic for twiddle factor and data delays
--                              Only 1/4 part of sin period is used.
--
--  Version 3.3  06.09.2016
--               Description: DATATYPE = 16 for integer twiddle factor,
--                              DATATYPE = 23 for floating twiddle factor.
--  
--          Delay lines stages:
--              ST: 00 --> (Z = 1) --> (1 FD)
--              ST: 01 --> (Z = 1) --> (1 FD)
--              ST: 02 --> (Z = 3) --> (2 FD)
--              ST: 03 --> (Z = 3) --> (4 FD)
--              ST: 04 --> (Z = 3) --> (8 FD)
--              ST: 05 --> (Z = 3) --> (16 FD)
--              ST: 06 --> (Z = 3) --> (1/4 or 1/8 SLICEM or 32 FD)
--              ST: 07 --> (Z = 3) --> (1/4 SLICEM)
--              ST: 08 --> (Z = 3) --> (2/4 SLICEM)
--              ST: 09 --> (Z = 3) --> (1 SLICEM or 1 RAMBs) 
--              ST: 10 --> (Z = 3) --> (1 RAMBs) 
--              ST: 11 --> (Z = 3) --> (2 RAMBs)  
--              ST: 12 --> (Z = 3) --> (4 RAMBs)  
--              ST: 13 --> (Z = 3) --> (8 RAMBs)  
--              ST: 14 --> (Z = 3) --> (16 RAMBs)  
--              ST: 15 --> (Z = 3) --> (32 RAMBs)  
--              ST: 16 --> (Z = 3) --> (64 RAMBs)  
--              ...
--
--          Delay lines Taylor (NFFT - 12 > STAGE):
--
--              ST: INT  COE --> (Z = 8) --> (2 RAMBs + 2/3 DSP48) 
--              ST: FP23 COE --> (Z = 25) --> (3 RAMBs + 4 DSP48) 
--
--          Note: fix2float operation takes 9 clocks (!!)
-- 
--  Version 4.0  11.02.2017
--               Description: DATATYPE = 23 (ONLY) !
--                   SCALE = "TRUE" - MAX RAMBS
--                   SCALE = "FALSE" - USE TAYLOR SCHEME
--
--  Version 5.0  10.10.2018
--               Description: Remove primitive operations: multiply by +/-1,0
--
-- Example: NFFT = 16
--    ---------------------------------
--    | Stage | DEPTH | COEFS | RAMBS |
--    ---------------------------------
--    |   15  | 512   | 32K   |  TAY  |
--    |   14  | 512   | 16K   |  TAY  |
--    |   13  | 512   |  8K   |  TAY  |
--    |   12  | 512   |  4K   |  TAY  |
--    |   11  | 512** |  2K   |  TAY  |
--    |   10  | 512   |  1K   |   1   |
--    |    9  | 256   | 512   |   0   |
--    |    8  | 128   | 256   |  LUT  |
--    |    7  |  64   | 128   |  LUT  |
--    |    6  |  32   |  64   |  LUT  |
--    |    5  |  16   |  32   |  LUT  |
--    |    4  |   8   |  16   |  LUT  |
--    |    3  |   4   |   8   |  LUT  |
--    |    2  |   2   |   4   |  LUT  |
--    |    1  |   1   |   2   |   X   |
--    |    0  |   1*  |   1   |   X   |
--    ---------------------------------
--
-- * - first and second stages don't need ROM. 
--     STAGE = 0: {0,1}; 
--     STAGE = 1: {0,1} and {-1,0};
-- ** - Taylor scheme (1 RAMB + some DSPs)
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--  GNU GENERAL PUBLIC LICENSE
--  Version 3, 29 June 2007
--
--  Copyright (c) 2019 Kapitanov Alexander
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
library IEEE;
use ieee.std_logic_1164.all;  
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use ieee.math_real.all;

library work;
use work.fp_m1_pkg.int16_complex;
use work.fp_m1_pkg.fp23_complex;
use work.fp_m1_pkg.find_fp;

entity rom_twiddle_gen is
    generic (
        NFFT        : integer:=11;  --! FFT lenght
        STAGE       : integer:=0;   --! FFT stage       
        XSERIES     : string:="7SERIES"; --! FPGA family: for 6/7 series: "7SERIES"; for ULTRASCALE: "ULTRA";
        USE_MLT     : boolean:=FALSE; -- Use DSP48 for Add/Sub in twiddles
        USE_SCALE   : boolean:=FALSE --! use full scale rambs for twiddle factor or Taylor algotihm     
    );
    port (
        ww          : out fp23_complex; --! Twiddle factor
        clk         : in std_logic; --! Clock
        ww_ena      : in std_logic; --! Enable for coeffs
        reset       : in std_logic  --! Reset
    );
end rom_twiddle_gen;

architecture rom_twiddle_gen of rom_twiddle_gen is 

constant Nww        : integer:=16;

signal dpo          : std_logic_vector(31 downto 0);
signal ww_node      : std_logic_vector(31 downto 0);    

constant N_INV      : integer:=NFFT-stage-1;

function calc_string(xx : integer) return string is
begin 
    if (xx < 10) then -- 11 or 12
        return "distributed";
    else
        return "block";
    end if;
end calc_string;
constant ramb_str   : string:=calc_string(N_INV);

attribute rom_style : string;
attribute rom_style of dpo : signal is ramb_str;

signal div          : std_logic;

signal ww_i         : fp23_complex;
signal ww_o         : fp23_complex;

begin 

-- Output data in (INT to FP) format --
xFP_RE: entity work.fp23_fix2float
    port map (
        din     => ww_node(15 downto 00),
        ena     => '1',
        dout    => ww_i.re,
        vld     => open,
        clk     => clk,
        reset   => reset
    );
    
xFP_IM: entity work.fp23_fix2float
    port map (
        din     => ww_node(31 downto 16),
        ena     => '1',
        dout    => ww_i.im,
        vld     => open,
        clk     => clk,
        reset   => reset
    );
    
-- Twiddle Re/Im parts calculating --
pr_ww: process(clk) is
begin
    if rising_edge(clk) then
        if (div = '0') then
            ww_node <= dpo;
        else      
            ww_node(15 downto 00) <= dpo(31 downto 16);
            ww_node(31 downto 16) <= not dpo(15 downto 00); -- NEGATIVE!!
        end if;
    end if;
end process; 

-- Low part for Twiddle factor based on FD --
-- !! Save DSP and logic,because multiply data in {Sin,Cos} = {1,0} or {0,1} is primitive! 

-- High part for Twiddle factor based on SLICEM and RAMBs --
X_GEN_M12: if (N_INV >= 2) generate
    
    function ww_width(ii : integer; mode : boolean) return integer is
        variable value : integer:=0;
    begin
        if (mode = TRUE) then 
            value := N_INV;
        else
            if (ii < 12) then
                value := N_INV;
            else
                value := 11;
            end if;
        end if;
        return value;
    end ww_width;       
    constant WWID : integer := ww_width(N_INV,USE_SCALE);  

    type std_array_32xN is array (0 to 2**(WWID-1)-1) of std_logic_vector(31 downto 00); 
    
    function rom_twiddle(xx : integer) return std_array_32xN is
        variable pi_new : real:=0.0;
        variable sc_int : std_array_32xN;
        
        variable re_int : integer:=0;
        variable im_int : integer:=0;
    begin
        for ii in 0 to 2**(xx-1)-1 loop
            pi_new := (real(ii) * MATH_PI)/(2.0**xx);
            
            re_int := INTEGER(32767.0*COS(pi_new)); 
            im_int := INTEGER(32767.0*SIN(-pi_new));

            sc_int(ii)(31 downto 16) := STD_LOGIC_VECTOR(CONV_SIGNED(im_int,16));
            sc_int(ii)(15 downto 00) := STD_LOGIC_VECTOR(CONV_SIGNED(re_int,16));  
        end loop;
        
        return sc_int;      
    end rom_twiddle;    
    
    constant ww32x1K : std_array_32xN:= rom_twiddle(WWID);
    
    signal half : std_logic;
    signal cnt  : std_logic_vector(N_INV-1 downto 0);
    signal addr : std_logic_vector(N_INV-2 downto 0);
    
begin
    pr_cnt: process(clk) is
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                cnt <=  (others =>  '0');
            elsif (ww_ena = '1') then
                cnt <= cnt + '1';
            end if;
        end if;
    end process;    

    addr <= cnt(N_INV-2 downto 0) when rising_edge(clk);
    half <= cnt(N_INV-1) when rising_edge(clk);        
    div  <= half when rising_edge(clk);    
    
    X_GEN_M1: if ((N_INV < 12) or (USE_SCALE = TRUE)) generate      
    begin
        dpo <= ww32x1K(conv_integer(unsigned(addr))) when rising_edge(clk);
        ww <= ww_i;
    end generate;       
        
    X_GEN_M2: if ((N_INV >= 12) and (USE_SCALE = FALSE)) generate       
        signal addrx        : std_logic_vector(9 downto 0); 
        signal ww_enaz      : std_logic_vector(3 downto 0);
        signal count        : std_logic_vector(N_INV-12 downto 0);
        
        type std_array_cnt is array (1 downto 0) of std_logic_vector(N_INV-12 downto 0); 
        signal cntzz        : std_array_cnt;
    begin   
        addrx <= addr(N_INV-2 downto N_INV-11); 
        dpo <= ww32x1K(conv_integer(unsigned(addrx))) when rising_edge(clk);
        
        ww_enaz <= ww_enaz(2 downto 0) & ww_ena when rising_edge(clk);  
        count <= addr(N_INV-12 downto 0);
        
        cntzz <= cntzz(0 downto 0) & count when rising_edge(clk);   
        X_TAYLOR_COE: entity work.fp23_cnt2flt_m1
            generic map (
                USE_MLT     => USE_MLT,
                XSERIES     => XSERIES,
                ii          => N_INV-12
            )
            port map (
                rom_ww      => ww_i,
                rom_en      => ww_enaz(3),--ww_ena,--ww_ena,
                   
                dsp_ww      => ww_o,     
                int_cnt     => cntzz(1),
                
                clk         => clk,
                reset       => reset
            );  
            
            ww <= ww_o; 
    end generate;
end generate;


end rom_twiddle_gen;