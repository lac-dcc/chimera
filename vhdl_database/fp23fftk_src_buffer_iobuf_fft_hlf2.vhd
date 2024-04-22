-------------------------------------------------------------------------------
--
-- Title       : iobuf_fft_hlf2
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     :
--
-------------------------------------------------------------------------------
--
-- Description : Input buffer: delay second part of data for Fast Convolution
-- 
-------------------------------------------------------------------------------
--
-- Version 1.0 : 29.04.2019
--
--    Input data    : Int-2 flow
--    Output data   : Int-2 w/ delay
--
--    Signle clock for input and output.
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

entity iobuf_fft_hlf2 is
    generic (
        ADDR        : integer := 13;      --! Number of FFT butterflies
        DATA        : integer := 16       --! I/O data width
    );
    port (
        ---- Common signals ----
        CLK         : in  std_logic; --! Clock
        RST         : in  std_logic; --! Reset
        ---- Input data ----
        DT_INT0     : in  std_logic_vector(DATA-1 downto 0); --! Data Even
        DT_INT1     : in  std_logic_vector(DATA-1 downto 0); --! Data Odd
        DT_EN01     : in  std_logic; --! Data enable
        ---- Output data ----
        DT_REV2     : out std_logic_vector(DATA-1 downto 0) --! FC: Half part of data
        -- dt_vl01     : out std_logic --! Data valid
    );  
end iobuf_fft_hlf2;

architecture iobuf_fft_hlf2 of iobuf_fft_hlf2 is

signal cnt_hlf              : std_logic_vector(ADDR-1 downto 0);
signal del_hlf              : std_logic;
signal cnt_dat              : std_logic_vector(ADDR-2 downto 0);
-- Why lenght = ADDR-2? -2 means: -1 - half part of data, -1 - for interleaving mode

signal ena_wr               : std_logic;
signal ena_rd               : std_logic;

signal en0_rd               : std_logic;
signal en1_rd               : std_logic;
signal adr_wr               : std_logic_vector(ADDR-3 downto 0);
signal ad0_rd               : std_logic_vector(ADDR-3 downto 0);
signal ad1_rd               : std_logic_vector(ADDR-3 downto 0);


signal ram_o0               : std_logic_vector(DATA-1 downto 0);
signal ram_o1               : std_logic_vector(DATA-1 downto 0);
signal ram_i0               : std_logic_vector(DATA-1 downto 0);
signal ram_i1               : std_logic_vector(DATA-1 downto 0);

signal ez0_rd               : std_logic;
signal ez1_rd               : std_logic;
signal zz0_rd               : std_logic;
signal zz1_rd               : std_logic;
signal ram_z0               : std_logic_vector(DATA-1 downto 0);
signal ram_z1               : std_logic_vector(DATA-1 downto 0);

-- Shared mem signal
type mem_type is array (integer range <>) of std_logic_vector(DATA-1 downto 0);
signal mem0 : mem_type((2**(ADDR-2))-1 downto 0) := (others => (others => '0'));
signal mem1 : mem_type((2**(ADDR-2))-1 downto 0) := (others => (others => '0'));

signal dt0_dat              : std_logic_vector(DATA-1 downto 0);
signal dt1_dat              : std_logic_vector(DATA-1 downto 0);
signal dt2_dat              : std_logic_vector(DATA-1 downto 0);
signal ena_dat              : std_logic;

signal dt0_dtz              : std_logic_vector(DATA-1 downto 0);
signal dt1_dtz              : std_logic_vector(DATA-1 downto 0);
signal ena_dtz              : std_logic;

begin

---------------- Counter for 1/2 part of N-sequence ----------------
pr_hlf: process(clk) is
begin
    if rising_edge(clk) then
        if (rst = '1') then
            cnt_hlf <= (0 => '1', others => '0');
            cnt_dat <= (others => '0');
            del_hlf <= '0';
        elsif (DT_EN01 = '1') then
            if (cnt_hlf(ADDR-1) = '0') then
                cnt_hlf <= cnt_hlf + '1';
            end if;
            cnt_dat <= cnt_dat + '1';
            del_hlf <= cnt_hlf(ADDR-1);
        end if;   
    end if;
end process;

---------------- Write part for RAM 0/1 ----------------
pr_wr: process(clk) is
begin
    if rising_edge(clk) then
        ena_wr <= DT_EN01 and cnt_hlf(ADDR-1) and not cnt_dat(ADDR-2);
        adr_wr <= cnt_dat(ADDR-3 downto 0);
        ram_i0 <= DT_INT0;
        ram_i1 <= DT_INT1;
    end if;
end process;

pr_rd: process(clk) is
begin
    if rising_edge(clk) then
        if (rst = '1') then
            ena_rd <= '0';
        elsif (DT_EN01 = '1') then
            ena_rd <= not ena_rd;
        end if;
        en1_rd <= DT_EN01 and ena_rd     and del_hlf;
        en0_rd <= DT_EN01 and not ena_rd and del_hlf;
        ez0_rd <= en0_rd; ez1_rd <= en1_rd;
        zz0_rd <= ez0_rd; zz1_rd <= ez1_rd;
    end if;
end process;

--en1_rd <= DT_EN01 and ena_rd     and del_hlf;
--en0_rd <= DT_EN01 and not ena_rd and del_hlf;

pr_addr: process(clk) is
begin
    if rising_edge(clk) then
        if (rst = '1') then
            ad0_rd <= (others => '0');
            ad1_rd <= (others => '0');
        else
            if (en0_rd = '1') then
                ad0_rd <= ad0_rd + '1';
            end if;
            if (en1_rd = '1') then
                ad1_rd <= ad1_rd + '1';
            end if;
        end if;
    end if;
end process;

---------------- RAM 0/1 for DELAYs ----------------
pr_ram0: process(clk) is
begin
    if rising_edge(clk) then
        if (ena_wr = '1') then
            mem0(conv_integer(adr_wr)) <= ram_i0;
        end if;
        if (rst = '1') then
            ram_o0 <= (others => '0');
        else  
            ram_o0 <= mem0(conv_integer(ad0_rd));
        end if;
        ram_z0 <= ram_o0;
    end if;
end process;

pr_ram1: process(clk) is
begin
    if rising_edge(clk) then
        if (ena_wr = '1') then
            mem1(conv_integer(adr_wr)) <= ram_i1;
        end if;
        if (rst = '1') then
            ram_o1 <= (others => '0');
        else  
            ram_o1 <= mem1(conv_integer(ad1_rd));
        end if;
        ram_z1 <= ram_o1;
    end if;
end process;
------------------ Mux outputs ----------------
pr_mux: process(clk) is
begin
    if rising_edge(clk) then
        if (zz0_rd = '1') then
            dt2_dat <= ram_z0;
        elsif (zz1_rd = '1') then
            dt2_dat <= ram_z1;
        end if;
    end if;
end process;

------------------ Output data ----------------
dt_rev2 <= dt2_dat;

end iobuf_fft_hlf2;