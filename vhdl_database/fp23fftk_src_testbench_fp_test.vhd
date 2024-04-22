-------------------------------------------------------------------------------
--
-- Title       : FFT_logic
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     :
--
-- Description : FP logic: test FFT, IFFT, FFT + IFFT in FP23 format
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
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use ieee.std_logic_textio.all;
use std.textio.all; 

use work.fp_m1_pkg.all;

entity fp_test is

end fp_test;

architecture fp_test of fp_test is

-- ******************************** --
-- CHANGE STAGES TO EDIT FFT TEST!! --
constant NFFT               : integer:=8; 
constant SCALE              : std_logic_vector(5 downto 0):="011100";
--constant USE_FLY            : std_logic:='1';
--constant USE_IFLY           : std_logic:='1';
constant DT_MUX             : std_logic_vector(1 downto 0):="11";
constant DT_REV             : std_logic:='0';

signal clk                  : std_logic:='0';
signal reset                : std_logic:='0';
        
signal din_re               : std_logic_vector(15 downto 0):=x"0000";
signal din_im               : std_logic_vector(15 downto 0):=x"0000";
signal din_en               : std_logic:='0';

signal dout0                : std_logic_vector(15 downto 0);
signal dout1                : std_logic_vector(15 downto 0);

signal dval                 : std_logic;

begin

clk   <= not clk after 5 ns;
reset <= '1', '0' after 100 ns;

-------------------------------------------------------------------------------- 
read_din: process is
    file file_dt_re : text;        
    file file_dt_im : text; 
    
    constant file_re    : string:="../../../../../math/din_re.dat";
    constant file_im    : string:="../../../../../math/din_im.dat";
    
    variable l      : line; 
    variable lt     : integer:=0;
    variable lt1    : integer:=0; 
    variable lt2    : integer:=0; 
begin       
    wait for 50 ns;
    if (reset = '0') then
        din_en <= '0';
        din_re <= (others => '0');
        din_im <= (others => '0');
    else    
        wait for 100 ns;
        lp_inf: for jj in 0 to 7 loop
            file_close( file_dt_re);
            file_close( file_dt_im);
            file_open( file_dt_re, file_re, read_mode );
            file_open( file_dt_im, file_im, read_mode );

            while not endfile(file_dt_re) loop
                wait until rising_edge(clk);

                readline( file_dt_re, l );
                read( l, lt1 );
                readline( file_dt_im, l );
                read( l, lt2 );

                din_re <= conv_std_logic_vector( lt1, 16 );
                din_im <= conv_std_logic_vector( lt2, 16 );
                din_en <= '1'; 
            end loop;

            wait until rising_edge(clk);
            din_en <= '0';
            din_re <= ( others => '0');
            din_im <= ( others => '0');

            for nn in 0 to 2**(NFFT-1) loop
                wait until rising_edge(clk);
            end loop;
        end loop;
            din_en <= '0';
            din_re <= (others => '1');
            din_im <= (others => '1');
        wait;
    end if;
end process;  

uut_fft: entity work.fp23_logic
    generic map (
        USE_MLT_FOR_ADDSUB  => TRUE,
        USE_MLT_FOR_CMULT   => TRUE,
        USE_MLT_FOR_TWDLS   => TRUE,
        USE_SCALE           => TRUE,
        USE_CONJ            => FALSE,
        USE_PAIR            => TRUE,
        USE_FWT             => FALSE,
        XSERIES             => "ULTRA",
        NFFT                => NFFT
    )
    port map (
        reset               => reset,
        clk                 => clk,
 
        dt_rev              => dt_rev,
        dt_mux              => dt_mux,
        fpscale             => SCALE, 

        din_re              => din_re,
        din_im              => din_im,
        din_en              => din_en,
    
        d_re                => dout0,
        d_im                => dout1,
        d_vl                => dval
    );

end fp_test;