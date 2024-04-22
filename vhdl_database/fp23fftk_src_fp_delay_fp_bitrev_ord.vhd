-------------------------------------------------------------------------------
--
-- Title       : fp_bitrev_ord
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     : 
--
-------------------------------------------------------------------------------
--
--  Version 1.0  13.08.2016
--               Description: Universal bitreverse algorithm for FFT project
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

entity fp_bitrev_ord is
    generic (
        FWT         : boolean:=TRUE;    --! Bitreverse mode: Even/Odd - "TRUE" or Half Pair - "FALSE". For FFT: "TRUE"
        PAIR        : boolean:=TRUE;    --! Bitreverse mode: Even/Odd - "TRUE" or Half Pair - "FALSE". For FFT: "TRUE"
        STAGES      : integer:=4;       --! FFT stages
        Nwidth      : integer:=16       --! Data width
    );
    port (
        clk         : in  std_logic; --! Clock
        reset       : in  std_logic; --! Reset

        di_dt       : in  std_logic_vector(Nwidth-1 downto 0); --! Data input
        di_en       : in  std_logic; --! Data enable

        do_dt       : out std_logic_vector(Nwidth-1 downto 0); --! Data output  
        do_vl       : out std_logic --! Data valid      
    );  
end fp_bitrev_ord;

architecture fp_bitrev_ord of fp_bitrev_ord is

signal addra            : std_logic_vector(STAGES-1 downto 0);
signal addrx            : std_logic_vector(STAGES-1 downto 0);
signal addrb            : std_logic_vector(STAGES-1 downto 0);
signal cnt              : std_logic_vector(STAGES downto 0);

signal ram_di0          : std_logic_vector(Nwidth-1 downto 0);
signal ram_do0          : std_logic_vector(Nwidth-1 downto 0);
signal ram_di1          : std_logic_vector(Nwidth-1 downto 0);
signal ram_do1          : std_logic_vector(Nwidth-1 downto 0);

signal we0, we1         : std_logic;
signal rd0, rd1         : std_logic;
signal vl0, vl1         : std_logic;
signal cntz             : std_logic_vector(1 downto 0);
signal dmux             : std_logic;
signal valid            : std_logic;

function bit_pair(Len: integer; Dat: std_logic_vector) return std_logic_vector is
    variable Tmp : std_logic_vector(Len-1 downto 0);
begin 
    Tmp(Len-1) :=  Dat(0);
    for ii in 1 to Len-1 loop
        Tmp(ii-1) := Dat(ii);
    end loop;
    return Tmp; 
end function; 

function bit_pair2(Len: integer; Dat: std_logic_vector) return std_logic_vector is
    variable Tmp : std_logic_vector(Len-1 downto 0);
begin 
    Tmp(0) :=  Dat(Len-1);
    for ii in 1 to Len-1 loop
        Tmp(ii) := Dat(ii-1);
    end loop;
    return Tmp; 
end function; 

signal cnt1st       : std_logic_vector(STAGES downto 0);

begin

-- Data out and valid proc --   
pr_cnt1: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            cnt1st <= (others => '0');
        else        
            if (valid = '1') then
                if (cnt1st(STAGES) = '0') then
                    cnt1st <= cnt1st + '1';
                end if;
            end if; 
        end if;
    end if;
end process;
    
xFWT_TRUE: if (FWT = TRUE) generate
    addra <= addrx;
    addrb <= bit_pair(STAGES, addrx);
end generate;
xFWT_FALSE: if (FWT = FALSE) generate
--  xPAIR_FALSE: if (PAIR = FALSE) generate
--      addra <= addrx;
--      addrb <= addrx;
--  end generate;
    xPAIR_FALSE: if (PAIR = FALSE) generate
        addra <= addrx;   
        addrb <= addrx;
    end generate;

    xPAIR_TRUE: if (PAIR = TRUE) generate
        addra <= bit_pair2(STAGES, addrx);
        G_BR_ADDR: for ii in 0 to STAGES-1 generate
            addrb(ii) <= cnt(STAGES-1-ii) when rising_edge(clk);
        end generate;
    end generate;   
    
end generate;   

addrx <= cnt(STAGES-1 downto 0) when rising_edge(clk);

-------------------------------------------------------------------------------

-- Data out and valid proc --   
pr_dout: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            do_dt <= (others => '0');      
        else
            if (dmux = '0') then
                do_dt <= ram_do1;
            else
                do_dt <= ram_do0;
            end if; 
        end if;
    end if;
end process;    
do_vl <= valid and cnt1st(STAGES) when rising_edge(clk);
        
-- Common proc --   
ram_di0 <= di_dt when rising_edge(clk);
ram_di1 <= di_dt when rising_edge(clk); 
    
pr_cnt: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            cnt <= (others => '0');
        else
            if (di_en = '1') then
                cnt <= cnt + '1';
            end if; 
        end if;
    end if;
end process;
cntz <= cntz(0) & cnt(STAGES) when rising_edge(clk);

pr_we: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            we0 <= '0';
            we1 <= '0';    
        else
            we0 <= not cnt(STAGES) and di_en;
            we1 <= cnt(STAGES) and di_en;
        end if;
    end if;
end process;

-- Read / Address proc --   
rd0 <= we1;
rd1 <= we0;

vl0 <= we1 when rising_edge(clk);
vl1 <= we0 when rising_edge(clk);

--addrx <= cnt(STAGES-1 downto 0) when rising_edge(clk);
----addrb <= cnt(STAGES-1 downto 0) when rising_edge(clk);
--addrb <= bit_pair(STAGES, addrx);
--G_BR_ADDR: for ii in 0 to STAGES-1 generate      
----    addrb(ii) <= cnt(STAGES-1-ii) when rising_edge(clk);
--end generate;

-- RAMB generator --    
G_LOW_STAGE: if (STAGES < 9) generate   
    type ram_t is array(0 to 2**(STAGES)-1) of std_logic;--_vector(31 downto 0);    
begin
    X_GEN_SRL0: for ii in 0 to Nwidth-1 generate
    begin
        pr_srlram0: process(clk) is
            variable ram0 : ram_t;
        begin
            if (clk'event and clk = '1') then
                if (we0 = '1') then
                    ram0(conv_integer(addra)) := ram_di0(ii);
                end if;
                --ram_do0 <= ram0(conv_integer(addra)); -- signle port
                if (rd0 = '1') then
                    ram_do0(ii) <= ram0(conv_integer(addrb)); -- dual port
                end if;
            end if; 
        end process;
        
        pr_srlram1: process(clk) is
            variable ram1 : ram_t;
        begin
            if (clk'event and clk = '1') then
                if (we1 = '1') then
                    ram1(conv_integer(addra)) := ram_di1(ii);
                end if;
                --ram_do1 <= ram1(conv_integer(addra)); -- signle port
                if (rd1 = '1') then
                    ram_do1(ii) <= ram1(conv_integer(addrb)); -- dual port
                end if;
            end if; 
        end process;        
    end generate;
    
    dmux <= cntz(1);
    valid <= (vl0 or vl1);
end generate; 

G_HIGH_STAGE: if (STAGES >= 9) generate
    type ram_t is array(0 to 2**(STAGES)-1) of std_logic_vector(Nwidth-1 downto 0);
    signal ram0, ram1           : ram_t;
    signal dout0, dout1         : std_logic_vector(Nwidth-1 downto 0);

    attribute ram_style         : string;
    attribute ram_style of RAM0 : signal is "block";    
    attribute ram_style of RAM1 : signal is "block";  
    
begin
    PR_RAMB0: process(clk) is
    begin
        if (clk'event and clk = '1') then
            ram_do0 <= dout0;
            if (reset = '1') then 
                dout0 <= (others => '0');
            else
                if (rd0 = '1') then
                    dout0 <= ram0(conv_integer(addrb)); -- dual port
                end if;
            end if;
            if (we0 = '1') then
                ram0(conv_integer(addra)) <= ram_di0;
            end if;
        end if; 
    end process;

    PR_RAMB1: process(clk) is
    begin
        if (clk'event and clk = '1') then
            ram_do1 <= dout1;
            if (reset = '1') then
                dout1 <= (others => '0');
            else
                if (rd1 = '1') then
                    dout1 <= ram1(conv_integer(addrb)); -- dual port
                end if;
            end if;
            if (we1 = '1') then
                ram1(conv_integer(addra)) <= ram_di1;
            end if;
        end if; 
    end process;
    
    dmux <= cntz(1) when rising_edge(clk);
    valid <= (vl0 or vl1) when rising_edge(clk);
end generate;

end fp_bitrev_ord;