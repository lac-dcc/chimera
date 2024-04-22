-------------------------------------------------------------------------------
--
-- Title       : fp23_fconv_core
-- Design      : Fast Convolution
-- Author      : Kapitanov Alexander
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-------------------------------------------------------------------------------
--
-- Description : Support function component: Two buffers for convolution.
--
-- SupFunc Buffer: Input data width = 16, output data width = 24 (FP23 format)
--              Has: 2 ind. RAM blocks for SF0 and SF1
--              Can: switch between SF0 and SF1 while operating
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

library work;
use work.fp_m1_pkg.fp23_complex;    
use work.reduce_pack.and_reduce;

entity fp23_sfunc_dbl is
    generic ( 
        SFMODE          : string:="FWD";--!  "FWD" - linear address for SF / "INV" - bit-reverse address
        NFFT            : integer:=15 --! FFT stages: NFFT = log2(N)
    );
    port (
        clk_dsp         : in std_logic; --! Calculate clock
        clk_trd         : in std_logic; --! System clock
        reset           : in std_logic; --! System reset

        fx_sf_re0       : in std_logic_vector(15 downto 0); --! Data SF Re
        fx_sf_im0       : in std_logic_vector(15 downto 0); --! Data SF Im
        fx_sf_reN       : in std_logic_vector(15 downto 0); --! Data SF Re
        fx_sf_imN       : in std_logic_vector(15 downto 0); --! Data SF Im
        
        fx_sf_en        : in std_logic; --! Data SF enable
        
        sf_rd           : in std_logic; --! Read enable: '1' - reading RAM block, '0' - waiting 
        sf_ld           : in std_logic_vector(1 downto 0); -- ! Load data into RAMs: "01" - to RAM0, "10" - to RAM1, "11" - to RAM0 and RAM1 
        sf_ok           : out std_logic; --! Signal from DSP to HOST, when '1' - you can load new data block (auto-reset to zero after starting new writing)
        sf_mx           : in std_logic; --! RAM selector for reading: 0 - first RAM block, 1 - second RAM block
        
        fp_sf_dt0       : out fp23_complex; --! Output data for "A" part FFT
        fp_sf_dt1       : out fp23_complex; --! Output data for "B" part FFT
        fp_sf_en        : out std_logic --! Output enable
    );                
end entity;

architecture fp23_sfunc_dbl of fp23_sfunc_dbl is

signal din              : std_logic_vector(63 downto 0);
signal ena              : std_logic;

signal do_ram0          : std_logic_vector(63 downto 0);
signal do_ram1          : std_logic_vector(63 downto 0);
signal fd_ram0          : std_logic_vector(63 downto 0);
signal fd_ram1          : std_logic_vector(63 downto 0);
signal wea0, wea1       : std_logic;

signal addra_nat        : std_logic_vector(NFFT-2 downto 0);
signal addra_rev        : std_logic_vector(NFFT-2 downto 0);
signal addrb            : std_logic_vector(NFFT-2 downto 0);

signal sf_dt            : std_logic_vector(63 downto 0);
signal sf0_re           : std_logic_vector(15 downto 0);
signal sf1_re           : std_logic_vector(15 downto 0);
signal sf0_im           : std_logic_vector(15 downto 0);
signal sf1_im           : std_logic_vector(15 downto 0);

signal rdy              : std_logic;
signal rd_mx            : std_logic;

signal sf_rd0           : std_logic;
signal sf_rd1           : std_logic; 
signal sf_rdz           : std_logic; 
signal sf_rdzz          : std_logic; 

signal sf_rd0z          : std_logic; 
signal sf_rd1z          : std_logic; 
signal sf_rd0zz         : std_logic; 
signal sf_rd1zz         : std_logic; 

signal fix_en           : std_logic;
signal fix_rd           : std_logic; 

type RAM is array (integer range <>) of std_logic_vector(63 downto 0);
signal mem0             : RAM ((2**(NFFT-1))-1 downto 0) := (others => (x"0000_7FFF_0000_7FFF"));
signal mem1             : RAM ((2**(NFFT-1))-1 downto 0) := (others => (x"0000_7FFF_0000_7FFF"));

signal cnt_rdy          : std_logic_vector(NFFT-1 downto 0);

begin

---------------- RAMB DATA IN ----------------
wea0 <= sf_ld(0);
wea1 <= sf_ld(1);
ena  <= fx_sf_en;
din  <= fx_sf_imN & fx_sf_reN & fx_sf_im0 & fx_sf_re0;

---------------- ADDRESS FROM TRD --------------------
pr_addra: process(clk_trd) is
begin
    if rising_edge(clk_trd) then
        if (reset = '1') then
            addra_nat <= (others => '0');
        elsif (fx_sf_en = '1') then
            addra_nat <= addra_nat + '1';
        end if;
    end if;
end process;

---------------- ADDRESS 0/1 RAMB --------------------
xGEN_INV: if (SFMODE = "INV") generate
    xBR: for ii in 0 to NFFT-2 generate
        addra_rev(ii) <= addra_nat(NFFT-2-ii);
    end generate;
end generate;

xGEN_FWD: if (SFMODE = "FWD") generate
begin
    addra_rev <= addra_nat;
end generate;

---------------- READ ENABLE ----------------
pr_sfen: process(clk_dsp) is
begin
    if rising_edge(clk_dsp) then
        sf_rd0   <= (sf_rd and not rd_mx);
        sf_rd1   <= (sf_rd and rd_mx);
        sf_rdz   <= sf_rd;
        sf_rdzz  <= sf_rdz;
        sf_rd0z  <= sf_rd0;
        sf_rd1z  <= sf_rd1;
        sf_rd0zz <= sf_rd0z;
        sf_rd1zz <= sf_rd1z;
    end if;
end process;

---------------- ADDRESS TO DSP --------------------
pr_rdy: process(clk_dsp) is
begin
    if rising_edge(clk_dsp) then
        if (reset = '1') then
            cnt_rdy <= (0 => '1', others => '0');
            rd_mx   <= '0';
            addrb   <= (others => '0');
        else
            if (sf_rd = '1') then
                ---- count sf data ----
                if (cnt_rdy(NFFT-1) = '1') then
                    cnt_rdy <= (0 => '1', others => '0');
                else
                    cnt_rdy <= cnt_rdy + '1';
                end if;
                ---- select mux ----
                if (cnt_rdy(NFFT-1) = '1') then
                    rd_mx <= sf_mx;
                end if;
            end if;
            ---- read address ----
            if (sf_rdz = '1') then
                addrb <= addrb + '1';
            end if;
        end if;
    end if;
end process;


---------------- RAMB 0 PART --------------------
pr_ram0_wr: process(clk_trd) is
begin
    if (clk_trd'event and clk_trd='1') then
        if (ena = '1') then
            if (wea0 = '1') then
                mem0(conv_integer(addra_rev)) <= din;
            end if;
        end if;
    end if;
end process;

pr_ram0_rd: process(clk_dsp) is
begin
    if (clk_dsp'event and clk_dsp='1') then
        if (sf_rd0 = '1') then        
            do_ram0 <= mem0(conv_integer(addrb));
        end if;
        fd_ram0 <= do_ram0;
    end if;
end process;

---------------- RAMB 1 PART --------------------
pr_ram1_wr: process(clk_trd) is
begin
    if (clk_trd'event and clk_trd='1') then
        if (ena = '1') then
            if (wea1 = '1') then
                mem1(conv_integer(addra_rev)) <= din;
            end if;
        end if;
    end if;
end process;

pr_ram1_rd: process(clk_dsp) is
begin
    if (clk_dsp'event and clk_dsp='1') then
        if (sf_rd1 = '1') then        
            do_ram1 <= mem1(conv_integer(addrb));
        end if;
        fd_ram1 <= do_ram1;
    end if;
end process;

---------------- READ DATA FROM RAMs --------------------
pr_mux_ramb: process(clk_dsp) is
begin
    if rising_edge(clk_dsp) then
        ---- select read buffer ----
        if (sf_rd0zz = '1') then
            sf_dt <= fd_ram0; 
        elsif (sf_rd1zz = '1') then
            sf_dt <= fd_ram1;
        end if; 
    end if;
end process; 

sf0_re <= sf_dt(15 downto 00);
sf0_im <= sf_dt(31 downto 16);
sf1_re <= sf_dt(47 downto 32);
sf1_im <= sf_dt(63 downto 48);

fix_rd <= sf_rdzz when rising_edge(clk_dsp);
fix_en <= fix_rd  when rising_edge(clk_dsp);

---------------- FIX 2 FLOAT --------------------
FIX_RE0: entity work.fp23_fix2float
    port map (
        din         => sf0_re,
        ena         => fix_en,
        dout        => fp_sf_dt0.re,
        vld         => fp_sf_en,
        clk         => clk_dsp,
        reset       => reset
    );

FIX_IM0: entity work.fp23_fix2float
    port map (
        din         => sf0_im,
        ena         => fix_en,
        dout        => fp_sf_dt0.im,
        vld         => open,
        clk         => clk_dsp,
        reset       => reset
    );

FIX_RE1: entity work.fp23_fix2float
    port map (
        din         => sf1_re,
        ena         => fix_en,
        dout        => fp_sf_dt1.re,
        vld         => open,
        clk         => clk_dsp,
        reset       => reset
    );

FIX_IM1: entity work.fp23_fix2float
    port map (
        din         => sf1_im,
        ena         => fix_en,
        dout        => fp_sf_dt1.im,
        vld         => open,
        clk         => clk_dsp,
        reset       => reset
    );

---------------- SIGNAL READY RAM --------------------
pr_ready: process(clk_trd) is
begin   
    if rising_edge(clk_trd) then
        if (reset = '1') then
            rdy   <= '0';
            sf_ok <= '0';
        else
            rdy <= and_reduce(addra_nat);
            if (rdy = '1') then
                sf_ok <= '1';
            elsif (fx_sf_en = '1') then
                sf_ok <= '0';
            end if;
        end if;
    end if;
end process;

end fp23_sfunc_dbl;