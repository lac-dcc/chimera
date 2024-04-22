-------------------------------------------------------------------------------
--
-- Title       : fp23_logic
-- Design      : fp23fftk
-- Author      : Kapitanov
-- Company     :
--
-- Description : Main module for FFT/IFFT logic
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

library ieee;
use ieee.std_logic_1164.all;  
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;

use work.fp_m1_pkg.fp23_complex;

use ieee.std_logic_textio.all;
use std.textio.all;

entity fp23_logic is
    generic (
        USE_SCALE           : boolean:=FALSE;       --! use full scale rambs for twiddle factor
        USE_MLT_FOR_ADDSUB  : boolean:=FALSE;       --! Use DSP48E1/2 blocks or not for Add/Sub
        USE_MLT_FOR_CMULT   : boolean:=FALSE;       --! Use DSP48E1/2 blocks or not for Complex Mult
        USE_MLT_FOR_TWDLS   : boolean:=FALSE;       --! Use DSP48E1/2 blocks or not for Twiddles
        USE_CONJ            : boolean:=FALSE;       --! Use conjugation for twiddle factor (COE)
        USE_PAIR            : boolean:=TRUE;        --! Bitreverse mode: Even/Odd - "TRUE" or Half Pair - "FALSE". For FFT: "TRUE"  
        USE_FWT             : boolean:=TRUE;        --! Bitreverse mode: Even/Odd - "TRUE" or Half Pair - "FALSE". For FFT: "TRUE"  
        XSERIES             : string:="ULTRA";      --! FPGA family: for 6/7 series: "7SERIES"; for ULTRASCALE: "ULTRA";
        NFFT                : integer :=16          --! Number of FFT stages    
    );                                                        
    port (
--        use_fly             : in std_logic;                     --! '1' - use bfly, '0' - don't use bfly
--        use_ifly            : in std_logic;                     --! '1' - use bfly, '0' - don't use bfly

        reset               : in std_logic;                     --! Global reset                                                              
        clk                 : in std_logic;                     --! DSP clock                                                         

        din_re              : in std_logic_vector(15 downto 0); --! Re data input
        din_im              : in std_logic_vector(15 downto 0); --! Im data input
        din_en              : in std_logic;                     --! Data enable

        dt_rev              : in std_logic;                     --! FFT Bitreverse
        dt_mux              : in std_logic_vector(01 downto 0); --! Data mux: "01" - Input, "10" - FFT, "11" - IFFT
        fpscale             : in std_logic_vector(05 downto 0); --! Scale in Float2Fix

        d_re                : out std_logic_vector(15 downto 0);--! Output data Even
        d_im                : out std_logic_vector(15 downto 0);--! Output data Odd     
        d_vl                : out std_logic                     --! Output valid data   
    );
end fp23_logic;

architecture fp23_logic of fp23_logic is          

signal  din0_fft                : fp23_complex;         
signal  din1_fft                : fp23_complex;                 
signal  din0_ifft               : fp23_complex;         
signal  din1_ifft               : fp23_complex; 

signal  dout0_fft               : fp23_complex;         
signal  dout1_fft               : fp23_complex;         
signal  dout0_ifft              : fp23_complex; 
signal  dout1_ifft              : fp23_complex; 

signal  ca_re                   : std_logic_vector(15 downto 0);
signal  ca_im                   : std_logic_vector(15 downto 0);
signal  cb_re                   : std_logic_vector(15 downto 0);
signal  cb_im                   : std_logic_vector(15 downto 0);        

signal  buf_en                  : std_logic:='0'; 
signal  fft_en                  : std_logic:='0';
signal  ifft_en                 : std_logic:='0';
signal  fft_vl                  : std_logic:='0';

signal  valid_mux               : std_logic:='0';

signal d_out_val                : std_logic;
signal ifft_val                 : std_logic;
signal d_val_bit                : std_logic;

signal dout0_mux, dout1_mux     : fp23_complex; 

signal val                      : std_logic_vector(3 downto 0);
signal over                     : std_logic_vector(3 downto 0);

signal fix_dout0_re             : std_logic_vector(15 downto 0);
signal fix_dout1_re             : std_logic_vector(15 downto 0);
signal fix_dout0_im             : std_logic_vector(15 downto 0);
signal fix_dout1_im             : std_logic_vector(15 downto 0);  

constant Nwidth                 : integer:=16;  

signal dout_re                  : std_logic_vector(Nwidth-1 downto 0);
signal dout_im                  : std_logic_vector(Nwidth-1 downto 0);  
signal dout_en                  : std_logic:='0';           

signal drev_re                  : std_logic_vector(Nwidth-1 downto 0);
signal drev_im                  : std_logic_vector(Nwidth-1 downto 0);
signal drev_en                  : std_logic:='0';           

begin   

-------------------- INPUT BUFFER --------------------
xIN_BUF: entity work.fp_Ndelay_in
    generic map (
        STAGES      => NFFT,
        Nwidth      => Nwidth
    )   
    port map (
        clk         => clk,
        reset       => reset,       
    
        din_re      => din_re,
        din_im      => din_im,
        din_en      => din_en,

        ca_re       => ca_re,       
        ca_im       => ca_im,       
        cb_re       => cb_re,       
        cb_im       => cb_im,       
        dout_val    => buf_en
    );
    
-------------------- FIX to FLOAT CONVERSION (on DSP or LUT) --------------------   
FIX0_IF: entity work.fp23_fix2float
    port map (
        din         => ca_re,
        ena         => buf_en,
        dout        => din0_fft.re,
        vld         => fft_en,
        clk         => clk,
        reset       => reset
    );                  
FIX1_IF: entity work.fp23_fix2float
    port map (
        din         => ca_im,
        ena         => buf_en,
        dout        => din0_fft.im,
        --dout_val  => dout_val,
        clk         => clk,
        reset       => reset
    );  
FIX2_IF: entity work.fp23_fix2float
    port map (
        din         => cb_re,
        ena         => buf_en,
        dout        => din1_fft.re,
        --dout_val  => dout_val,
        clk         => clk,
        reset       => reset
    );          
FIX3_IF: entity work.fp23_fix2float
    port map (
        din         => cb_im,
        ena         => buf_en,
        dout        => din1_fft.im,
        --dout_val  => dout_val,
        clk         => clk,
        reset       => reset
    );

------------------ FPFFTK_N (FORWARD FFT) --------------------      
xFFT: entity work.fp23_fftNk
    generic map (                   
        NFFT                => NFFT,                
        USE_MLT_FOR_ADDSUB  => USE_MLT_FOR_ADDSUB,  
        USE_MLT_FOR_CMULT   => USE_MLT_FOR_CMULT,
        USE_MLT_FOR_TWDLS   => USE_MLT_FOR_TWDLS,
        USE_SCALE           => USE_SCALE,
        XSERIES             => XSERIES
    )
    port map (
        data_in0            => din0_fft,
        data_in1            => din1_fft,
        data_en             => fft_en,
    
        dout0               => dout0_fft,
        dout1               => dout1_fft,
        dout_val            => fft_vl,
        
        --use_fly             => use_fly,
        reset               => reset, 
        clk                 => clk
    );
    
------------------ TEST IFFT MUX --------------------
din0_ifft   <= dout0_fft;
din1_ifft   <= dout1_fft;
ifft_en     <= fft_vl; 

xIFFT: entity work.fp23_ifftNk
    generic map (
        NFFT                => NFFT,
        USE_MLT_FOR_ADDSUB  => USE_MLT_FOR_ADDSUB,  
        USE_MLT_FOR_CMULT   => USE_MLT_FOR_CMULT,
        USE_MLT_FOR_TWDLS   => USE_MLT_FOR_TWDLS,
        USE_SCALE           => USE_SCALE,
        USE_CONJ            => USE_CONJ,
        XSERIES             => XSERIES  
    )
    port map (
        data_in0            => din0_ifft,
        data_in1            => din1_ifft,
        data_en             => ifft_en, 
        
        dout0               => dout0_ifft,
        dout1               => dout1_ifft,
        dout_val            => ifft_val,
        
        --use_fly             => use_ifly,
        reset               => reset, 
        clk                 => clk
    );      
    
------------------ MUX xDATA --------------------
pr_mux: process(clk) is
begin
    if (rising_edge(clk)) then
        case dt_mux is
            when "00" =>    
                dout0_mux <= (others => ("000000", '0', x"0000"));
                dout1_mux <= (others => ("000000", '0', x"0000"));
                valid_mux <= '0';           
            when "01" =>
                dout0_mux <= din0_fft;
                dout1_mux <= din1_fft;
                valid_mux <= fft_en;
            when "10" =>
                dout0_mux <= dout0_fft;
                dout1_mux <= dout1_fft;
                valid_mux <= fft_vl;
            when "11" =>            
                dout0_mux <= dout0_ifft;
                dout1_mux <= dout1_ifft;
                valid_mux <= ifft_val;
            when others =>
                null;
        end case;
    end if;
end process;    
    
------------------ FLOAT2FIX --------------------       
xFIX0RE: entity work.fp23_float2fix
    port map (
        din         => dout0_mux.re,    
        dout        => fix_dout0_re,
        clk         => clk,
        reset       => reset,
        ena         => valid_mux,
        scale       => fpscale,  
        vld         => val(0),
        overflow    => over(0)
    );  
        
xFIX1RE: entity work.fp23_float2fix
    port map (
        din         => dout1_mux.re,
        dout        => fix_dout1_re,
        clk         => clk,
        reset       => reset,
        ena         => valid_mux,
        scale       => fpscale,  
        vld         => val(2),
        overflow    => over(2)
    );  
    
xFIX0IM: entity work.fp23_float2fix
    port map (
        din         => dout0_mux.im,    
        dout        => fix_dout0_im,
        clk         => clk,
        reset       => reset,
        ena         => valid_mux,
        scale       => fpscale,  
        vld         => val(1),
        overflow    => over(1)
    );  
            
xFIX1IM: entity work.fp23_float2fix
    port map (
        din         => dout1_mux.im,    
        dout        => fix_dout1_im,
        clk         => clk,
        reset       => reset,
        ena         => valid_mux,
        scale       => fpscale,  
        vld         => val(3),
        overflow    => over(3)
    );      
    
-------------------- OUTPUT BUFFER -------------------- 
xOUT_BUF : entity work.fp_Ndelay_out
    generic map (
        stages      => NFFT,
        Nwidth      => Nwidth
    )
    port map (
        clk         => clk,
        reset       => reset,       
        
        dout_re     => dout_re,
        dout_im     => dout_im,
        dout_val    => dout_en,
        
        ca_re       => fix_dout0_re,
        ca_im       => fix_dout0_im,
        cb_re       => fix_dout1_re,
        cb_im       => fix_dout1_im,
        din_en      => val(0)           
    );  
    
-------------------- BIT REVERSE ORDER --------------------         
xBITREV_RE : entity work.fp_bitrev_ord
    generic map (
        FWT         => USE_FWT,
        PAIR        => USE_PAIR,
        STAGES      => NFFT,
        Nwidth      => Nwidth   
    )
    port map (
        clk         => clk,
        reset       => reset,
                
        di_dt       => dout_re,
        di_en       => dout_en,

        do_dt       => drev_re,
        do_vl       => drev_en
    );  

xBITREV_IM : entity work.fp_bitrev_ord
    generic map (
        FWT         => USE_FWT,
        PAIR        => USE_PAIR,
        STAGES      => NFFT,
        Nwidth      => Nwidth
    )
    port map (
        clk         => clk,
        reset       => reset,
                
        di_dt       => dout_im,
        di_en       => dout_en,

        do_dt       => drev_im,
        do_vl       => open
    );  

------------------ xDATA OUTPUT --------------------        
pr_rev: process(clk) is
begin
    if (rising_edge(clk)) then
        if (dt_rev = '0') then
            d_re <= dout_re;
            d_im <= dout_im;
            d_vl <= dout_en;
        else
            d_re <= drev_re;
            d_im <= drev_im;
            d_vl <= drev_en;
        end if;
    end if;
end process;
        
--------------------------------------------------------------------------------
-- writing_dout: process(clk) is    -- write file_io.out (++ done goes to '1')
    -- file log                     : TEXT open WRITE_MODE is "../../../../../../math/fft_out.dat";
    -- variable str                 : LINE;
    -- variable spc                 : string(1 to 4) := (others => ' ');    
-- begin
    -- if rising_edge(clk) then
        -- if (dout_en = '1') then  
            -- --------------------------------
            -- write(str, CONV_INTEGER(SIGNED(dout_re)), LEFT); write(str, spc);
            -- write(str, CONV_INTEGER(SIGNED(dout_im)), LEFT); write(str, spc);
            -- --------------------------------
            -- writeline(log, str);
        -- end if;
    -- end if;
-- end process;         
    
end fp23_logic;