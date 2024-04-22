-------------------------------------------------------------------------------
--
-- Title       : inbuf_fastconv_int2
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     :
--
-------------------------------------------------------------------------------
--
-- Description : Input buffer for linear fast convolution and interleave-2 data
-- 
-------------------------------------------------------------------------------
--
-- Version 1.0 : 23.04.2019
--
--    Input data    : Int-2 flow
--    Output data   : Int-2 flow and Int-2 w/ delay
--
--    Signle clock for input and output.
--
-------------------------------------------------------------------------------
--
-- Timing diagram:
--
-- Input strobes (interleave-2 mode): 
--        DI_EVEN   : ..0246....8ACE.......
--        DI_ODD    : ..1357....9BDF.......
--
-- Output strobes:
--        DA_FC0    : ..............0123...
--        DB_FC0    : ..............4567...
--
--        DA_FC1    : ..............4567...
--        DB_FC1    : ..............89AB...
--
-- Parameters:
--      ADDR - Integer: Number of FFT butterflies, ADDR = log2(NFFT).
--      DATA - Integer: Data width (input / output).
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

entity inbuf_fastconv_int2 is
    generic (
        NFFT        : integer := 13;      --! Number of FFT butterflies
        DATA        : integer := 16       --! I/O data width
    );
    port (
        ---- Common signals ----
        CLK         : in  std_logic; --! Clock
        RST         : in  std_logic; --! Reset
        ---- Input data ----
        DI_IN0      : in  std_logic_vector(DATA-1 downto 0); --! Data Even
        DI_IN1      : in  std_logic_vector(DATA-1 downto 0); --! Data Odd
        DI_ENA      : in  std_logic; --! Data enable
        ---- Output data ----
        F0_DT0      : out std_logic_vector(DATA-1 downto 0); --! FC0: First  part
        F0_DT1      : out std_logic_vector(DATA-1 downto 0); --! FC0: Second part
        F1_DT0      : out std_logic_vector(DATA-1 downto 0); --! FC1: First  part
        F1_DT1      : out std_logic_vector(DATA-1 downto 0); --! FC1: Second part
        FC_VAL      : out std_logic --! Data valid
    );  
end inbuf_fastconv_int2;

architecture inbuf_fastconv_int2 of inbuf_fastconv_int2 is

signal dt0_dat              : std_logic_vector(DATA-1 downto 0);
signal dt1_dat              : std_logic_vector(DATA-1 downto 0);
signal dt2_dat              : std_logic_vector(DATA-1 downto 0);
signal ena_dat              : std_logic;

signal dt0_dtz              : std_logic_vector(DATA-1 downto 0);
signal dt1_dtz              : std_logic_vector(DATA-1 downto 0);
signal ena_dtz              : std_logic;

begin

-------------------------------------------------------------------------------
-- **** Input buffer for Fast convolution explaining ****
-- Example: 
-- 
-- Input N-sequence:        ....01234567... (N = 8)
--
-- Interleave-2 seq:        ....0246... - this is int-2 input data
--                          ....1357...
--
-- Output seq. for FFT:     ....0123... - this is output data from INBUF and input data for FFT
--                          ....4567...
-- 
-- Fast convolution input:  ....02468ACE... - Add another N-length data vector
--                          ....13579BDF...
-- 
-- FC0 data (N/2 delayed):  ........0123... - Input for circular convolution (0)
--                          ........4567...
--
-- FC1 data ():             ........4567... - Input for circular convolution (1)
--                          ........89AB...
--
-- So, FC0 (2nd part) and FC1 (1st part) are EQUAL! We can use it and save N/2 memory for FC1 part. 
-- 
-------------------------------------------------------------------------------

---------------- Input Shuffler: Interleave-2 to Half-data ----------------
xIN0: entity work.iobuf_fft_int2
    generic map (
        BITREV      => FALSE,
        DATA        => DATA,
        ADDR        => NFFT
    )
    port map (
        rst         => rst,
        clk         => clk,

        dt_int0     => DI_IN0,
        dt_int1     => DI_IN1,
        dt_en01     => DI_ENA,
        
        dt_rev0     => dt0_dat,
        dt_rev1     => dt1_dat,
        dt_vl01     => ena_dat
    );

---------------- Input Shuffler: Delay second part of data ----------------
xIN1: entity work.iobuf_fft_hlf2
    generic map (
        DATA        => DATA,
        ADDR        => NFFT
    )
    port map (
        rst         => rst,
        clk         => clk,

        dt_int0     => DI_IN0,
        dt_int1     => DI_IN1,
        dt_en01     => DI_ENA,
        
        dt_rev2     => dt2_dat

    );
------------------ Output data ----------------
pr_out: process(clk) is
begin
    if rising_edge(clk) then
        dt0_dtz <= dt0_dat;
        dt1_dtz <= dt1_dat;
        ena_dtz <= ena_dat;

        if (rst = '1') then
            FC_VAL <= '0';
            F0_DT0 <= (others => '0');
            F0_DT1 <= (others => '0');
            F1_DT0 <= (others => '0');
            F1_DT1 <= (others => '0');
        else
            FC_VAL <= ena_dtz;
            if (ena_dtz = '1') then
                F0_DT0 <= dt0_dtz;
                F0_DT1 <= dt1_dtz;
                F1_DT0 <= dt1_dtz;
                F1_DT1 <= dt2_dat;
            end if;
        end if;
    end if;
end process;

end inbuf_fastconv_int2;