-------------------------------------------------------------------------------
--
-- Title       : fp_Ndelay_out
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     :
--
-------------------------------------------------------------------------------
--
-- Description : 16.04.2015
--
-- Universal output buffer for FFT project
-- It has several independent DPRAM components for FFT stages between 2k and 64k
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

entity fp_Ndelay_out is
    generic (
        STAGES      : integer:=7; --! FFT stages
        Nwidth      : integer:=48 --! Data width
    );
    port (
        dout_re     : out std_logic_vector(Nwidth-1 downto 0); --! Data Real
        dout_im     : out std_logic_vector(Nwidth-1 downto 0); --! Data Imag
        dout_val    : out std_logic; --! Data vaid

        clk         : in  std_logic; --! Clock
        reset       : in  std_logic; --! Reset      
        
        ca_re       : in  std_logic_vector(Nwidth-1 downto 0); --! Even Real
        ca_im       : in  std_logic_vector(Nwidth-1 downto 0); --! Even Imag
        cb_re       : in  std_logic_vector(Nwidth-1 downto 0); --! Odd Real 
        cb_im       : in  std_logic_vector(Nwidth-1 downto 0); --! Odd Imag         
        din_en      : in  std_logic --! Data enable 
    );  
end fp_Ndelay_out;

architecture fp_Ndelay_out of fp_Ndelay_out is

signal addra            : std_logic_vector(STAGES-2 downto 0);
signal addrb            : std_logic_vector(STAGES-1 downto 0);
signal addrbz           : std_logic_vector(STAGES-1 downto 0);
signal cnt              : std_logic_vector(STAGES-1 downto 0);    

signal din_rez1         : std_logic_vector(Nwidth-1 downto 0);
signal din_imz1         : std_logic_vector(Nwidth-1 downto 0);

signal din_rez2         : std_logic_vector(Nwidth-1 downto 0);
signal din_imz2         : std_logic_vector(Nwidth-1 downto 0);

signal ram_din          : std_logic_vector(2*Nwidth-1 downto 0);
signal ram_dout         : std_logic_vector(2*Nwidth-1 downto 0);

signal ena, enb         : std_logic;
signal enaz             : std_logic;
signal enbz             : std_logic; 

signal muxa             : std_logic_vector(Nwidth-1 downto 0);
signal muxb             : std_logic_vector(Nwidth-1 downto 0);

signal dat_ena          : std_logic:='0';

begin

din_rez1 <= ca_re when rising_edge(clk);
din_imz1 <= ca_im when rising_edge(clk);

din_rez2 <= din_rez1 when rising_edge(clk);
din_imz2 <= din_imz1 when rising_edge(clk);

---- Write counter ----
pr_cnt: process(clk) is
begin   
    if rising_edge(clk) then
        if (reset = '1') then
            cnt <= (0 => '1', others => '0');
        else
            if (din_en = '1') then
                if (cnt(STAGES-1) = '1') then
                    cnt <= (0 => '1', others => '0');
                else
                    cnt <= cnt + '1';
                end if;
            end if;
        end if;
    end if;
end process;
addra <= cnt(STAGES-2 downto 0)-1 when rising_edge(clk);

---- Write counter ----
pr_dat: process(clk) is
begin   
    if rising_edge(clk) then
        if (reset = '1') then
            dat_ena <= '0';
        else
            if (cnt(STAGES-1) = '1') then
                dat_ena <= '1';
            elsif (addrb(STAGES-1) = '1') then
                dat_ena <= '0';
            end if;
        end if;
    end if;
end process;


pr_cnt2: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            addrb <= (0 => '1', others => '0');     
        else
            if (addrb(STAGES-1) = '1')then
                addrb <= (0 => '1', others => '0');
            elsif (dat_ena = '1')  then
                addrb <= addrb + '1';
            end if;
        end if;
    end if;
end process;
--addrbz <= addrb-1 when rising_edge(clk); 
addrbz <= addrb-1 when rising_edge(clk);

ena <= din_en when rising_edge(clk);
enaz <= ena when rising_edge(clk);

enb <= dat_ena when rising_edge(clk);
enbz <= enb when rising_edge(clk); 

ram_din <= cb_im & cb_re when rising_edge(clk);

G_HIGH_STAGE: if (STAGES >= 9) generate
    type ram_t is array(0 to 2**(STAGES-1)-1) of std_logic_vector(2*Nwidth-1 downto 0);
    signal ram                  : ram_t;
    signal dout                 : std_logic_vector(2*Nwidth-1 downto 0);
    
    attribute ram_style         : string;
    attribute ram_style of RAM  : signal is "block";    
    
    signal din_rez3             : std_logic_vector(Nwidth-1 downto 0);
    signal din_imz3             : std_logic_vector(Nwidth-1 downto 0); 

    signal enbz                 : std_logic; 
    signal enazz                : std_logic;
    signal enbzz                : std_logic; 
    
begin
    enbz  <= enb when rising_edge(clk); 
    enazz <= enaz when rising_edge(clk);
    enbzz <= enbz when rising_edge(clk);    
    
    pr_ramb: process (clk) is
    begin
        if (clk'event and clk = '1') then
            ram_dout <= dout;
            if (reset = '1') then
                dout <= (others => '0');
            else
                if (enb = '1') then
                    dout <= ram(conv_integer(addrbz(stages-2 downto 0))); -- dual port
                end if;
            end if;             
            if (ena = '1') then
                ram(conv_integer(addra)) <= ram_din;
            end if;
        end if; 
    end process;
    
    pr_mux: process (clk) is
    begin
        if (clk'event and clk = '1') then
            if (enbzz = '0') then
                muxa <= din_rez3;
                muxb <= din_imz3;
            else
                muxa <= ram_dout(1*Nwidth-1 downto 00);
                muxb <= ram_dout(2*Nwidth-1 downto Nwidth);
            end if;
        end if; 
    end process;    

    din_rez3 <= din_rez2 when rising_edge(clk);
    din_imz3 <= din_imz2 when rising_edge(clk);     

    dout_val <= (enbzz or enazz) when rising_edge(clk); 
    -- dout_val <= (enbz or enaz) when rising_edge(clk);    

end generate;

G_LOW_STAGE: if (STAGES < 9) generate   
    type ram_t is array(0 to 2**(STAGES-1)-1) of std_logic;--_vector(31 downto 0);  
    --signal ram        : ram_t; 
begin
    X_GEN_W: for ii in 0 to 2*Nwidth-1 generate
    begin
        pr_srlram: process (clk) is
            variable ram : ram_t;
        begin
            if (clk'event and clk = '1') then
                if (ena = '1') then
                    ram(conv_integer(addra)) := ram_din(ii);
                end if;
                --ram_dout <= ram(conv_integer(addra)); -- signle port
                ram_dout(ii) <= ram(conv_integer(addrbz(stages-2 downto 0))); -- dual port
            end if; 
        end process;
    end generate;
    
    pr_mux: process (clk) is
    begin
        if (clk'event and clk = '1') then
            if (enbz = '0') then
                muxa <= din_rez2;
                muxb <= din_imz2;
            else
                muxa <= ram_dout(1*Nwidth-1 downto 00);
                muxb <= ram_dout(2*Nwidth-1 downto Nwidth);
            end if;
        end if; 
    end process;
    
    dout_val <= (enbz or enaz) when rising_edge(clk);
end generate;

dout_re <= muxa;
dout_im <= muxb;

end fp_Ndelay_out;