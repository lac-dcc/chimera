-------------------------------------------------------------------------------
--
-- Title       : fp_Ndelay_in
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     :
--
-------------------------------------------------------------------------------
--
--  Version 1.0  03.04.2015
--               Description: Universal input buffer for FFT project
--                  It has several independent DPRAM components for FFT stages 
--                  between 2k and 64k
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

entity fp_Ndelay_in is
    generic (
        STAGES      : integer:=7; --! FFT stages
        Nwidth      : integer:=48 --! Data width
    );
    port (
        din_re      : in  std_logic_vector(Nwidth-1 downto 0); --! Data Real
        din_im      : in  std_logic_vector(Nwidth-1 downto 0); --! Data Imag
        din_en      : in  std_logic; --! Data enable

        clk         : in  std_logic; --! Clock
        reset       : in  std_logic; --! Reset      
        
        ca_re       : out std_logic_vector(Nwidth-1 downto 0); --! Even Real
        ca_im       : out std_logic_vector(Nwidth-1 downto 0); --! Even Imag
        cb_re       : out std_logic_vector(Nwidth-1 downto 0); --! Odd Real 
        cb_im       : out std_logic_vector(Nwidth-1 downto 0); --! Odd Imag
        dout_val    : out std_logic --! Data valid
    );  
end fp_Ndelay_in;

architecture fp_Ndelay_in of fp_Ndelay_in is

signal addra            : std_logic_vector(STAGES-2 downto 0);
signal addrb            : std_logic_vector(STAGES-2 downto 0);
signal cnt              : std_logic_vector(STAGES-1 downto 0);    

signal din_rez          : std_logic_vector(Nwidth-1 downto 0);
signal din_imz          : std_logic_vector(Nwidth-1 downto 0);
signal din_rezz         : std_logic_vector(Nwidth-1 downto 0);
signal din_imzz         : std_logic_vector(Nwidth-1 downto 0); 


signal ram_din          : std_logic_vector(2*Nwidth-1 downto 0);
signal ram_dout         : std_logic_vector(2*Nwidth-1 downto 0);

signal dout_en          : std_logic; 
signal dout_enz         : std_logic; 
signal ena              : std_logic;
signal wea              : std_logic;

begin   
    
-- Common processes for delay lines --
din_rez <= din_re when rising_edge(clk);
din_imz <= din_im when rising_edge(clk);

din_rezz <= din_rez when rising_edge(clk);
din_imzz <= din_imz when rising_edge(clk);

pr_cnt: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            cnt <= (others => '0');
        else
            if (din_en = '1') then
                cnt <= cnt + '1';
            end if; 
        end if;
    end if;
end process;

addra <= cnt(STAGES-2 downto 0);
addrb <= cnt(STAGES-2 downto 0) when rising_edge(clk);

ena         <= din_en;
wea         <= not cnt(STAGES-1);
ram_din     <= din_im & din_re;
dout_en     <= cnt(STAGES-1) and din_en when rising_edge(clk);
dout_enz    <= dout_en when rising_edge(clk);

dout_val    <= dout_enz when rising_edge(clk);
cb_re       <= din_rezz when rising_edge(clk) and dout_enz = '1';
cb_im       <= din_imzz when rising_edge(clk) and dout_enz = '1';  

G_HIGH_STAGE: if (STAGES >= 10) generate
    type ram_t is array(0 to 2**(STAGES-1)-1) of std_logic_vector(2*Nwidth-1 downto 0);
    signal ram                  : ram_t;
    signal dout                 : std_logic_vector(2*Nwidth-1 downto 0);
    signal enb                  : std_logic;
    
    attribute ram_style         : string;
    attribute ram_style of RAM  : signal is "block";    
                        
begin
    enb <= cnt(STAGES-1) and din_en when rising_edge(clk);
    
    PR_RAMB: process(clk) is
    begin
        if (clk'event and clk = '1') then
            ram_dout <= dout;
            if (reset = '1') then
                dout <= (others => '0');
            else
                if (enb = '1') then
                    dout <= ram(conv_integer(addrb)); -- dual port
                end if;
            end if;             
            if (ena = '1') then
                if (wea = '1') then
                    ram(conv_integer(addra)) <= ram_din;
                end if;
            end if;
        end if; 
    end process;

    ca_re <= ram_dout(1*Nwidth-1 downto 0);
    ca_im <= ram_dout(2*Nwidth-1 downto Nwidth);
end generate;

G_LOW_STAGE: if (STAGES < 10) generate  
    type ram_t is array(0 to 2**(STAGES-1)-1) of std_logic;--_vector(31 downto 0);  
    --signal ram        : ram_t; 
begin
    X_GEN_SRL: for ii in 0 to 2*Nwidth-1 generate
    begin
        pr_srlram: process(clk) is
            variable ram : ram_t;
        begin
            if (clk'event and clk = '1') then
                if (wea = '1') then
                    ram(conv_integer(addra)) := ram_din(ii);
                end if;
                --ram_dout <= ram(conv_integer(addra)); -- signle port
                ram_dout(ii) <= ram(conv_integer(addrb)); -- dual port
            end if; 
        end process;
    end generate;

    ca_re <= ram_dout(1*Nwidth-1 downto 0) when rising_edge(clk) and dout_enz = '1';
    ca_im <= ram_dout(2*Nwidth-1 downto Nwidth) when rising_edge(clk) and dout_enz = '1';
end generate; 

end fp_Ndelay_in;